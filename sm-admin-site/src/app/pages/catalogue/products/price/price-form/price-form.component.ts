import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';

import { ToastrService } from 'ngx-toastr';
import { TranslateService } from '@ngx-translate/core';
import { ConfigService } from '../../../../shared/services/config.service';
import * as moment from 'moment';
import { InventoryService } from '../../services/inventory.service';
import { formatMoney } from '../../../../shared/validation/price-validation';
import { slugify } from '../../../../shared/utils/slugifying';

@Component({
  selector: 'ngx-price-form',
  templateUrl: './price-form.component.html',
  styleUrls: ['./price-form.component.scss']
})
export class PriceFormComponent implements OnInit {
  price;
  priceId;
  form: FormGroup;
  loader = false;
  languages = [];
  prices = [];
  config = {
    placeholder: '',
    tabsize: 2,
    height: 300,
    uploadImagePath: '',
    toolbar: [
      ['misc', ['codeview', 'undo', 'redo']],
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
      ['fontsize', ['fontname', 'fontsize', 'color']],
      ['para', ['style', 'ul', 'ol', 'paragraph', 'height']],
      ['insert', ['table', 'picture', 'link', 'video', 'hr']]
    ],
    fontNames: ['Helvetica', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Roboto', 'Times']
  };
  inventory;
  params = {
    productId: '',
    inventoryId: ''
  };

  constructor(
    private activatedRoute: ActivatedRoute,
    private fb: FormBuilder,
    private toastr: ToastrService,
    private translate: TranslateService,
    private configService: ConfigService,
    private inventoryService: InventoryService
  ) {
  }

  ngOnInit() {
    this.params.productId = this.activatedRoute.snapshot.paramMap.get('productId');
    this.params.inventoryId = this.activatedRoute.snapshot.paramMap.get('inventoryId');
    this.priceId = this.activatedRoute.snapshot.paramMap.get('priceId');
    this.createForm();
    this.loader = true;
    this.inventoryService.getInventoryById(this.params.productId, this.params.inventoryId)
      .subscribe(res => {
        this.inventory = res;
        this.configService.getListOfSupportedLanguages(localStorage.getItem('merchant'))
          .subscribe(ln => {
            this.languages = [...ln];
            this.addFormArray();
            // if (this.priceId) {
            //   this.price = this.inventory.prices.find((r) => r.id && r.id === this.priceId);
            //   this.fillForm();
            // }
            if (this.priceId) {
              this.loadPriceProduct();
            } else {
              this.loader = false;
            }
          }, () => {
            this.loader = false;
          });
    }, () => {
      this.loader = false;
    });
    
  }

  loadPriceProduct() {
    this.inventoryService.loadPriceProduct(this.params.productId, this.params.inventoryId, this.priceId).subscribe(res => {
      if (res) {
        this.price = res;
        this.fillForm();
        this.loader = false;
      }
    }, () => {
      this.loader = false;
    });
  }

  transformTotal() {
    if (!this.form.controls.productAttributePrice) {
      return;
    }
    const value = '' + this.form.controls.productAttributePrice.value;
    if (value !== '') {
      this.form.controls.productAttributePrice.setValue(
        formatMoney(value.replace(/,/g, '')),
        { emitEvent: false }
      );
    }
  }

  private createForm() {
    this.form = this.fb.group({
      finalPrice: ['', [Validators.required]],
      originalPrice: ['', [Validators.required]],
      discountedPrice: [''],
      defaultPrice: ['', [Validators.required]],
      discounted: ['', [Validators.required]],
      selectedLanguage: ['', [Validators.required]],
      descriptions: this.fb.array([]),
      discountStartDate: [null],
      discountEndDate: [null],
    });
  }

  addFormArray() {
    const control = <FormArray>this.form.controls.descriptions;
    this.languages.forEach(lang => {
      control.push(
        this.fb.group({
          language: [lang.code, [Validators.required]],
          name: ['', [Validators.required]],
          highlights: [''],
          friendlyUrl: ['', [Validators.required]],
          description: [''],
          title: [''],
          keyWords: [''],
          metaDescription: [''],
        })
      );
    });
  }

  fillForm() {
    let finalPrice = 0;
    if (this.price.finalPrice) {
      finalPrice = this.price.finalPrice.substr(1, this.price.finalPrice.length).replace(',', '.');
    }
    let originalPrice = 0;
    if (this.price.originalPrice) {
      originalPrice = this.price.originalPrice.substr(1, this.price.originalPrice.length).replace(',', '.');
    }
     let discountedPrice = 0;
    if (this.price.discountedPrice) {
      discountedPrice = this.price.discountedPrice.substr(1, this.price.discountedPrice.length).replace(',', '.');
    }
    const dataForm = {
      finalPrice: finalPrice,
      originalPrice: originalPrice,
      discountedPrice: discountedPrice,
      discounted: this.price.discounted,
      descriptions: [],
      selectedLanguage: 'en',
      defaultPrice: this.price.activated || false
    };
    if (this.price.discountStartDate) {
      dataForm['discountStartDate'] = new Date(this.price.discountStartDate);
    }
    if (this.price.discountEndDate) {
      dataForm['discountEndDate'] = new Date(this.price.discountEndDate);
    }
    this.form.patchValue(dataForm);
    this.fillFormArray();
  }

  fillFormArray() {
    this.form.value.descriptions.forEach((desc, index) => {
      this.price.descriptions.forEach((description) => {
        if (desc.language === description.language) {
          (<FormArray>this.form.get('descriptions')).at(index).patchValue({
            language: description.language,
            name: description.name,
            highlights: description.highlights,
            friendlyUrl: description.friendlyUrl,
            description: description.description,
            title: description.title,
            keyWords: description.keyWords,
            metaDescription: description.metaDescription,
          });
        }
      });      
     
    });
  }

  get selectedLanguage() {
    return this.form.get('selectedLanguage');
  }

  get discountStartDate() {
    return this.form.get('discountStartDate');
  }

  get discountEndDate() {
    return this.form.get('discountEndDate');
  }

  get descriptions(): FormArray {
    return <FormArray>this.form.get('descriptions');
  }

  changeName(event, index) {
    (<FormArray>this.form.get('descriptions')).at(index).patchValue({
      friendlyUrl: slugify(event)
    });
  }

  save() {
    if (this.loader) {
      return;
    }
    this.loader = true;
    const priceObject = this.form.value;
    priceObject.dateAvailable = moment(priceObject.dateAvailable).format('yyyy-MM-DD');

    priceObject.discountStartDate = priceObject.discountStartDate ? moment(priceObject.discountStartDate).format('yyyy-MM-DD') : null;
    priceObject.discountEndDate = priceObject.discountEndDate ? moment(priceObject.discountEndDate).format('yyyy-MM-DD') : null;

    if (priceObject.discountStartDate && priceObject.discountEndDate) {
      const isReadyDiscountDate = moment(priceObject.discountStartDate).isBefore(priceObject.discountEndDate); //true
      if (!isReadyDiscountDate) {
        this.loader = false;
        this.toastr.error('Please check the start-end date on discount');
        return;
      }
    }
    // save important values for filling empty field in result object
    const tmpObj = {
      name: '',
      friendlyUrl: ''
    };
    priceObject.descriptions.forEach((el) => {
      if (tmpObj.name === '' && el.name !== '') {
        tmpObj.name = el.name;
      }
      if (tmpObj.friendlyUrl === '' && el.friendlyUrl !== '') {
        tmpObj.friendlyUrl = el.friendlyUrl;
      }
      for (const elKey in el) {
        if (el.hasOwnProperty(elKey)) {
          if (!tmpObj.hasOwnProperty(elKey) && el[elKey] !== '') {
            tmpObj[elKey] = el[elKey];
          }
        }
      }
    });

    const payload = {
      descriptions: priceObject.descriptions,
      originalPrice: priceObject.originalPrice,
      defaultPrice: priceObject.defaultPrice,
      discountEndDate: priceObject.discountEndDate,
      discountStartDate: priceObject.discountStartDate,
      discounted: priceObject.discounted,
      discountedPrice: !priceObject.discountedPrice ? 0 : priceObject.discountedPrice,
    }
    if (this.priceId) {
      payload['id'] = this.priceId;
      payload['descriptions'][0].id = this.price.descriptions[0].id;
      this.inventoryService.updateInventoryPrice(this.params.productId, this.inventory.id, payload)
        .subscribe((res) => {
          this.loader = false;
          this.toastr.success(this.translate.instant('PRICE.SAVE'));
        }, (error) => {
          this.loader = false;
          this.toastr.error(error.error.message);
      });
    } else {
      this.inventoryService.saveInventoryPrice(this.params.productId, this.inventory.id, payload)
      .subscribe((res) => {
        this.loader = false;
        this.toastr.success(this.translate.instant('PRICE.SAVE'));
      }, (error) => {
        this.loader = false;
        this.toastr.error(error.error.message);
      });
    }


    // if (tmpObj.name === '' || tmpObj.friendlyUrl === '' || priceObject.sku === '') {
    //   // this.toastr.error(this.translate.instant('COMMON.FILL_REQUIRED_FIELDS'));
    // } else {
    //   priceObject.descriptions.forEach((el) => {
    //     // fill empty fields
    //     for (const elKey in el) {
    //       if (el.hasOwnProperty(elKey)) {
    //         if (el[elKey] === '' && tmpObj[elKey] !== '') {
    //           el[elKey] = tmpObj[elKey];
    //         }
    //       }
    //     }
    //   });
    //   // check for undefined
    //   priceObject.descriptions.forEach(el => {
    //     for (const elKey in el) {
    //       if (el.hasOwnProperty(elKey)) {
    //         if (typeof el[elKey] === 'undefined') {
    //           el[elKey] = '';
    //         }
    //       }
    //     }
    //   });

    //   this.inventory.store = this.inventory.store.code;
    //   this.inventory.prices.forEach((el) => {
    //     const originalPriceIndex = el.originalPrice.match(/\d/).index;
    //     el.originalPrice = el.originalPrice.slice(originalPriceIndex);
    //     const finalPriceIndex = el.finalPrice.match(/\d/).index;
    //     el.finalPrice = el.finalPrice.slice(finalPriceIndex);
    //   });
    //   // this.inventory.prices = [...this.inventory.prices, priceObject];
    //   this.inventory.prices = [priceObject];
    // }
  }

}
