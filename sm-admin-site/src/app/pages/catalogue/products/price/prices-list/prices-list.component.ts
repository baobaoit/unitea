import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DomSanitizer } from '@angular/platform-browser';
import { ToastrService } from 'ngx-toastr';
import * as _ from 'lodash';

import { LocalDataSource } from 'ng2-smart-table';
import { ProductService } from '../../services/product.service';
import { NbDialogService } from '@nebular/theme';
import { TranslateService } from '@ngx-translate/core';
import { InventoryService } from '../../services/inventory.service';
import { ShowcaseDialogComponent } from '../../../../shared/components/showcase-dialog/showcase-dialog.component';
import { Subscription } from 'rxjs';

@Component({
  selector: 'ngx-prices-list',
  templateUrl: './prices-list.component.html',
  styleUrls: ['./prices-list.component.scss']
})
export class PricesListComponent implements OnInit, OnDestroy {
  @Input() prices: any[] = [];
  source: LocalDataSource = new LocalDataSource();
  loadingList = false;

  // paginator
  perPage = 10;
  currentPage = 1;
  totalCount;

  settings = {};

  params = {
    productId: '',
    inventoryId: ''
  };

  private subscriptions: Subscription = new Subscription();

  constructor(
    private productService: ProductService,
    private dialogService: NbDialogService,
    private translate: TranslateService,
    private activatedRoute: ActivatedRoute,
    private inventoryService: InventoryService,
    private _sanitizer: DomSanitizer,
    private toastr: ToastrService,
    private router: Router,
  ) {
    this.params.productId = this.activatedRoute.snapshot.paramMap.get('productId');
    this.params.inventoryId = this.activatedRoute.snapshot.paramMap.get('inventoryId');
  }

  ngOnInit() {
    this.getList();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  getList() {
    const _prices = (this.prices && this.prices.length) ? this.prices : [];
    this.prices = _.cloneDeep(_prices);
    this.source.load(this.prices);
    this.setSettings();
    this.subscriptions.add(this.translate.onLangChange.subscribe((event) => {
      this.setSettings();
    }));
  }

  setSettings() {
    this.settings = {
      actions: {
        columnTitle: this.translate.instant('ORDER.ACTIONS'),
        add: false,
        edit: false,
        delete: false,
        position: 'right',
        sort: true,
        custom: [
          { name: 'details', title: '<i class="nb-edit"></i>' },
          { name: 'remove', title: '<i class="nb-trash"></i>' }
        ],
      },
      pager: { display: false },
      columns: {
        store: {
          title: this.translate.instant('INVENTORY.INVENTORY_STORE'),
          type: 'string',
          editable: false,
          valuePrepareFunction: (store) => {
            return store.code;
          }
        },
        owner: {
          title: this.translate.instant('INVENTORY.INVENTORY_OWNER'),
          type: 'string',
          editable: false,
          valuePrepareFunction: (owner) => {
            return owner ? owner : 'null';
          }
        },
        quantity: {
          title: this.translate.instant('PRODUCT.QTY'),
          type: 'number',
          editable: true
        },
        prices: {
          title: this.translate.instant('PRODUCT.PRICE'),
          type: 'string',
          editable: true,
          valuePrepareFunction: (prices) => {
            return (prices.length && prices[0].originalPrice) ? prices[0].originalPrice : 'null';
          }
        },
        creationDate: {
          title: this.translate.instant('PRODUCT.CREATION_DATE'),
          type: 'string',
          editable: false
        },
      },
    };
  }

  route(event) {
    switch (event.action) {
      case 'details':
        const path = `pages/catalogue/products/${this.params.productId}/` +
          `inventory/${this.params.inventoryId}/price/${event.data.id}`;
        this.router.navigate([path]);
        break;
      case 'remove':
        const priceId = event.data.id;
        const removePrice = () => {
          this.subscriptions.add(this.inventoryService.removeInventoryPrice(this.params.productId, this.params.inventoryId, priceId).subscribe(result => {
            this.source.remove(event.data);
            this.source.refresh();
            this.toastr.success(this.translate.instant('PRICE.REMOVE'));
          }, (error) => {
            this.toastr.error(error.error.message);
          }));
        };
        this.dialogService.open(ShowcaseDialogComponent, {})
          .onClose.subscribe(res => {
            if (res) {
              removePrice();
            }
          });
    }
  }

  // paginator
  changePage(event) {
    switch (event.action) {
      case 'onPage': {
        this.currentPage = event.data;
        break;
      }
      case 'onPrev': {
        this.currentPage--;
        break;
      }
      case 'onNext': {
        this.currentPage++;
        break;
      }
      case 'onFirst': {
        this.currentPage = 1;
        break;
      }
      case 'onLast': {
        this.currentPage = event.data;
        break;
      }
    }
    this.getList();
  }

}
