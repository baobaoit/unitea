import { Component, OnInit } from '@angular/core';
import { ProductService } from '../services/product.service';
import { LocalDataSource } from 'ng2-smart-table';
import { AvailableButtonComponent } from './available-button.component';
import { ShowcaseDialogComponent } from '../../../shared/components/showcase-dialog/showcase-dialog.component';
import { NbDialogService } from '@nebular/theme';
import { StoreService } from '../../../store-management/services/store.service';
import { UserService } from '../../../shared/services/user.service';
import { TranslateService } from '@ngx-translate/core';
import { StorageService } from '../../../shared/services/storage.service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { ListingService } from '../../../shared/services/listing.service';
import { environment } from '../../../../../environments/environment';


@Component({
  selector: 'ngx-products-list',
  templateUrl: './products-list.component.html',
  styleUrls: ['./products-list.component.scss']
})
export class ProductsListComponent implements OnInit {
  products = [];
  source: LocalDataSource = new LocalDataSource();
  listingService: ListingService;
  loadingList = false;
  loading: boolean = false;
  stores = [];
  isSuperadmin: boolean;
  selectedStore: String = '';
  // paginator
  perPage = 15;
  currentPage = 1;
  totalCount;
  merchant;

  // server params
  params = this.loadParams();
  settings = {};

  constructor(
    private userService: UserService,
    private productService: ProductService,
    private dialogService: NbDialogService,
    private storeService: StoreService,
    private translate: TranslateService,
    private storageService: StorageService,
    private toastr: ToastrService,
    private router: Router
  ) {
    this.selectedStore = this.storageService.getMerchant()
    this.isSuperadmin = this.storageService.getUserRoles().isSuperadmin;
    this.listingService = new ListingService();
  }

  loadParams() {
    return {
      store: this.storageService.getMerchant(),
      lang: this.storageService.getLanguage(),
      count: this.perPage,
      page: 0
    };
  }

  ngOnInit() {
    this.getStore();
    this.getList();
    this.translate.onLangChange.subscribe((lang) => {
      this.params.lang = this.storageService.getLanguage();
      this.getList();
    });


    //ng2-smart-table server side filter
    this.source.onChanged().subscribe((change) => {
      if (!this.loadingList) {//listing service
        this.listingService.filterDetect(this.params, change, this.loadList.bind(this), this.resetList.bind(this));
      }
    });
  }

  /** callback methods for table list*/
  private loadList(newParams: any) {
    //console.log('CallBack loadList');
    //console.log(JSON.stringify(newParams));
    this.currentPage = 1; //back to page 1
    this.params = newParams;
    this.getList();
  }

  private resetList() {
    //console.log('CallBack resetList');
    this.currentPage = 1;//back to page 1
    this.params = this.loadParams();
    this.getList();
  }
  getStore() {
    this.storeService.getListOfStores({ store: environment.merchantStore })
      .subscribe(res => {
        let storeData = []
        res.data.forEach((store) => {
          storeData.push(store.code);
        });
        this.stores = storeData;
      });
  }
  getList() {
    const startFrom = this.currentPage - 1;
    this.params.page = startFrom;
    this.loadingList = true;
    this.productService.getListOfProducts(this.params)
      .subscribe(res => {
        const products = res.products;
        this.totalCount = res.recordsTotal;
        products.forEach(el => {
          el.name = el.description.name;
        });
        this.products = [...products];
        this.source.load(products);
        this.loadingList = false;
      });
    this.setSettings();
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
          { name: 'edit', title: '<i class="nb-edit"></i>' },
          { name: 'remove', title: '<i class="nb-trash"></i>' }
        ],
      },
      pager: {
        display: false
      },
      columns: {
        id: {
          title: this.translate.instant('COMMON.ID'),
          type: 'number',
          editable: false,
          filter: false
        },
        sku: {
          title: this.translate.instant('PRODUCT.SKU'),
          type: 'string',
          editable: false,
          filter: true
        },
        name: {
          title: this.translate.instant('PRODUCT.PRODUCT_NAME'),
          type: 'html',
          filter: true,
          editable: false,
          valuePrepareFunction: (name) => {
            const id = this.products.find(el => el.name === name).id;
            return `<a href="#/pages/catalogue/products/product/${id}">${name}</a>`;
          }
        },
        quantity: {
          title: this.translate.instant('PRODUCT.QTY'),
          type: 'number',
          editable: true,
          filter: false
        },
        available: {
          filter: false,
          title: this.translate.instant('COMMON.AVAILABLE'),
          type: 'custom',
          renderComponent: AvailableButtonComponent,
          defaultValue: false,
          editable: true,
          editor: {
            type: 'checkbox'
          }
        },
        price: {
          title: this.translate.instant('PRODUCT.PRICE'),
          type: 'string',
          editable: true,
          filter: false
        },
        creationDate: {
          title: this.translate.instant('PRODUCT.CREATION_DATE'),
          type: 'string',
          editable: false,
          filter: false
        },
      },
    };
  }

  updateRecord(event) {
    const product = {
      available: event.newData.available,
      price: event.newData.price,
      quantity: event.newData.quantity
    };
    event.confirm.resolve(event.newData);
    this.productService.updateProductFromTable(event.newData.id, product)
      .subscribe(res => {
        event.confirm.resolve(event.newData);
        this.toastr.success(this.translate.instant('PRODUCT.PRODUCT_UPDATED'));
      }, error => {
        console.log(error.error.message);
      });
  }

  deleteRecord(event) {
    this.dialogService.open(ShowcaseDialogComponent, {})
      .onClose.subscribe(res => {
        if (res) {
          this.productService.deleteProduct(event.data.id)
            .subscribe(result => {
              this.toastr.success(this.translate.instant('PRODUCT.PRODUCT_REMOVED'));
              this.getList();
              // event.confirm.resolve();
            });
        } else {
          // event.confirm.reject();
        }
      });
  }

  choseStore(event) {
    //console.log("Choosing store " + event);
    this.params.store = event;
    this.getList();

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
  route(e) {
    //console.log(e)
    if (e.action == 'remove') {
      this.deleteRecord(e)
    } else {
      this.router.navigate(['pages/catalogue/products/product/' + e.data.id]);
    }
  }
}
