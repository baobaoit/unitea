import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

import { StoreService } from '../../../../store-management/services/store.service';
import { ConfigService } from '../../../../shared/services/config.service';
import { ToastrService } from 'ngx-toastr';
import { TranslateService } from '@ngx-translate/core';
import { InventoryService } from '../../services/inventory.service';
import * as moment from 'moment';
import { validators } from '../../../../shared/validation/validators';
import { environment } from '../../../../../../environments/environment';

@Component({
  selector: 'ngx-inventory-form',
  templateUrl: './inventory-form.component.html',
  styleUrls: ['./inventory-form.component.scss']
})
export class InventoryFormComponent implements OnInit, OnChanges {
  @Input() inventory;
  @Input() _title;
  form: FormGroup;
  stores = [];
  loader = false;
  languages = [];
  productId;
  prices = [];

  constructor(
    private fb: FormBuilder,
    private toastr: ToastrService,
    // private router: Router,
    private translate: TranslateService,
    private storeService: StoreService,
    private configService: ConfigService,
    private activatedRoute: ActivatedRoute,
    private inventoryService: InventoryService
  ) {
  }

  ngOnInit() {
    this.productId = this.activatedRoute.snapshot.paramMap.get('productId');
    this.createForm();
    this.storeService.getListOfStores({})
      .subscribe(res => {
        res.data.forEach((store) => {
          this.stores.push({ value: store.code, label: store.code });
        });
      });
    this.loader = true;
    this.configService.getListOfSupportedLanguages(localStorage.getItem('merchant'))
      .subscribe(res => {
        this.languages = [...res];
        this.createForm();
        // if (this.inventory.id) {
        //   this.fillForm();
        // }
        this.loader = false;
      });
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes.inventory && changes.inventory.currentValue && changes.inventory.currentValue.id) {
      this.fillForm();
    }
  }

  private createForm() {
    this.form = this.fb.group({
      available: [false],
      sku: ['', [Validators.required, Validators.pattern(validators.alphanumeric)]],
      dateAvailable: [new Date()],
      store: [environment.merchantStore, [Validators.required]],
      variant: ['', [Validators.required]],
      quantity: ['', [Validators.required]],
      owner: ['', [Validators.required]],
      dimensions: this.fb.group({
        weight: ['', [Validators.pattern(validators.number)]],
        height: ['', [Validators.pattern(validators.number)]],
        width: ['', [Validators.pattern(validators.number)]],
        length: ['', [Validators.pattern(validators.number)]],
      }),
      priceDetails: this.fb.group({
        finalPrice: [{value: '', disabled: true}, [Validators.required]],
        discountedPrice: [''],
        startDate: [new Date()],
        endDate: [new Date()],
      }),
    });
  }
  // private createForm() {
  //   this.form = this.fb.group({
  //     store: ['DEFAULT', [Validators.required]],
  //     owner: ['', [Validators.required]],
  //     dateAvailable: [new Date()],
  //     quantity: [0, [Validators.required]]
  //   });
  // }

  fillForm() {
    if (this.form) {
      setTimeout(() => {
        this.form.patchValue({
          store: this.inventory.store.code,
          quantity: this.inventory.quantity,
          owner: this.inventory.owner,
          sku: this.inventory.sku,
          variant: this.inventory.variant,
        });
        this.form.controls.dimensions.patchValue({
          weight: this.inventory.dimensions ? this.inventory.dimensions.weight : null,
          height: this.inventory.dimensions ? this.inventory.dimensions.height: null,
          width: this.inventory.dimensions ? this.inventory.dimensions.width : null,
          length: this.inventory.dimensions ? this.inventory.dimensions.length: null,
        });
      }, 0);
    }
  }

  get priceList() {
    if (this.inventory && this.inventory.prices) {
      const prices = this.inventory.prices;
      return prices.map(p => {
        p.owner = this.inventory.owner;
        p.store = this.inventory.store;
        p.quantity = this.inventory.quantity;
        p.prices = [{originalPrice: p.originalPrice}];
        p.creationDate = this.inventory.creationDate;
        return {...p};
      })
    }
    return [];
  }

  save() {
    if (this.loader) {
      return;
    }
    const inventoryObj = this.form.value;
    inventoryObj.dateAvailable = inventoryObj.dateAvailable ? moment(inventoryObj.dateAvailable).format('yyyy-MM-DD') : '';
    
    inventoryObj.discountStartDate = inventoryObj.discountStartDate ? moment(inventoryObj.discountStartDate).format('yyyy-MM-DD') : null;
    inventoryObj.discountEndDate = inventoryObj.discountEndDate ? moment(inventoryObj.discountEndDate).format('yyyy-MM-DD') : null;

    // const valuePrices = {
    //   finalPrice: inventoryObj.priceDetails.finalPrice,
    //   discountedPrice: inventoryObj.priceDetails.discountedPrice,
    //   discountStartDate: inventoryObj.priceDetails.startDate ? moment(inventoryObj.priceDetails.startDate).format('yyyy-MM-DD') : '',
    //   discountEndDate: inventoryObj.priceDetails.endDate ? moment(inventoryObj.priceDetails.endDate).format('yyyy-MM-DD') : ''
    // };
    // this.prices.push(valuePrices);
    // TODO
    inventoryObj.prices = []; // force to empty array
    inventoryObj.productId = this.productId;

    // delete not use priceDetails
    delete inventoryObj.priceDetails;

    if (this.inventory.id) {
      inventoryObj.id = this.inventory.id;
      this.inventoryService.updateInventory(this.productId, this.inventory.id, inventoryObj).subscribe((res) => {
        this.toastr.success(this.translate.instant('INVENTORY.INVENTORY_UPDATED'));
      });
    } else {
      this.inventoryService.createInventory(inventoryObj).subscribe((res) => {
        this.toastr.success(this.translate.instant('INVENTORY.INVENTORY_CREATED'));
        this.inventory = res;
      });
    }
  }

}
