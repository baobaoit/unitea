import { Component, OnInit, ViewChild, ElementRef, OnDestroy } from '@angular/core';
import { StorageService } from '../../shared/services/storage.service';
import { StoreService } from '../../store-management/services/store.service';
import { OrdersService } from '../services/orders.service';
import { LocalDataSource } from 'ng2-smart-table';
import { Router, ActivatedRoute } from '@angular/router';

import { TranslateService } from '@ngx-translate/core';
import { environment } from '../../../../environments/environment';
import { Subscription } from 'rxjs';
@Component({
  selector: 'ngx-order-going',
  templateUrl: './order-going.component.html',
  styleUrls: ['./order-going.component.scss']
})
export class OrderGoingComponent implements OnInit, OnDestroy {
  @ViewChild('item', { static: false }) accordion;
  source: LocalDataSource = new LocalDataSource();
  loadingList = false;
  settings = {};
  stores: any[] = [];
  selectedStore: string = '';
  // paginator
  perPage = 20;
  currentPage = 1;
  totalCount;
  roles;
  // searchValue: string = '';
  isSuperAdmin: boolean;
  isAdminOrder: boolean;

  timeoutHandler: any;
  params = this.loadParams();

  @ViewChild('printBtn', { static: true }) printBtn: ElementRef<HTMLElement>;
  orderSelection: any;
  orderIds: string[] = [];

  private subscriptions: Subscription = new Subscription();

  constructor(
    private ordersService: OrdersService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    // private mScrollbarService: MalihuScrollbarService,
    private translate: TranslateService,
    private storageService: StorageService,
    private storeService: StoreService,
  ) {
    // const orderIdsParam = this.activatedRoute.snapshot.queryParams.queryParamMap.get('id');
    this.subscriptions.add(this.activatedRoute.queryParams.subscribe(params => {
      console.log('orderIdsParam', params);
      if (params && params.id) {
        if (Array.isArray(params.id)) {
          this.orderIds = params.id;
        } else {
          this.orderIds.push(params.id);
        }
      }
      console.log('this.orderIds', this.orderIds);
    }));
    this.isSuperAdmin = this.storageService.getUserRoles().isSuperadmin;
    this.isAdminOrder = this.storageService.getUserRoles().isAdminOrder;
    if (!this.isAdminOrder) {
      this.getStoreList();
    }
    this.selectedStore = this.storageService.getMerchant();
  }
  getStoreList() {
    this.subscriptions.add(this.storeService.getListOfMerchantStoreNames({ 'store': environment.merchantStore })
      .subscribe(res => {
        res.forEach((store) => {
          this.stores.push({ value: store.code, label: store.code });
        });
      }));
  }
  ngOnInit() {
    this.getOrderList();
    this.subscriptions.add(this.translate.onLangChange.subscribe((lang) => {
      this.params.lang = this.storageService.getLanguage();
      this.getOrderList();
    }));
    this.subscriptions.add(this.source.onChanged().subscribe((change) => {
      if (change.action == 'refresh' || change.action == 'load') {
        clearTimeout(this.timeoutHandler);
      } else {
        var time = 2000;
      }
      if (this.timeoutHandler) {
        clearTimeout(this.timeoutHandler);
      }

      this.timeoutHandler = setTimeout(() => {
        if (change.action == 'filter') {
          change.filter.filters.map((a) => {
            if (a.field == "id") {
              this.params["id"] = a.search;
            } else if (a.field == "billingName") {
              this.params["name"] = a.search;
            } else if (a.field == "billingPhone") {
              this.params["phone"] = a.search;
            } else if (a.field == "billingEmail") {
              this.params["email"] = a.search;
            } else if (a.field == "orderStatus") {
              this.params["status"] = a.search;
            }
          });

          this.getOrderList(false);
        }
      }, time);

    }));
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  loadParams() {
    return {
      store: this.storageService.getMerchant(),
      lang: this.storageService.getLanguage(),
      count: this.perPage,
      page: 0,
      status: 'PROCESSED'
    };
  }
  getOrderList(hasInitColumns: boolean = true) {
    this.params.page = this.currentPage - 1;

    if (this.orderIds && this.orderIds.length > 0) {
      this.params['id'] = this.orderIds.toString();
    }

    this.loadingList = true;
    this.subscriptions.add(this.ordersService.getOrders(this.params)
      .subscribe(orders => {
        this.loadingList = false;
        if (orders.orders && orders.orders.length !== 0) {
          this.source.load(orders.orders);

          // confirm notifications
          if (this.orderIds && this.orderIds.length > 0) {
            this.ordersService.notificationConfirm(this.orderIds).subscribe(response => {
            });
          }

        } else {
          this.source.load([]);
        }
        this.totalCount = orders.recordsTotal;
      }, error => {
        this.loadingList = false;
        this.source.load([]);
    }));
    if (hasInitColumns) {
      this.setSettings();
    }
  }

  onClickAction(event) {
    switch (event.action) {
      case 'printer':
        this.loadOrderDetails(event.data.id);
        break;
    }
  }

  loadOrderDetails(orderID: number) {
    this.loadingList = true;
    this.ordersService.getOrderDetails(orderID)
      .subscribe(data => {
        this.loadingList = false;
        this.orderSelection = data;
        if (this.orderSelection && this.orderSelection.products && this.orderSelection.products.length > 0) {
          this.orderSelection.products.map(d => {
            d.topping = d.attributes.filter(p => p.attributeName === 'Topping');
            d.noneTopping = d.attributes.filter(p => p.attributeName !== 'Topping');
            return {...d};
          });
          if (this.orderSelection.totals) {
            this.orderSelection.tip = this.orderSelection.totals.filter(p => p.module === 'tip')[0].value;
            this.orderSelection.tax = this.orderSelection.totals.filter(p => p.module === 'tax')[0].value;
          }
        }
        // start to printer
        setTimeout(() => {
          const el: HTMLElement = this.printBtn.nativeElement;
          el.click();
        }, 10);

      }, error => {
        this.loadingList = false;
      });
  }

  setSettings() {
    var me = this;
    this.settings = {
      // mode: 'external',
      // hideSubHeader: false,
      actions: {
        columnTitle: this.translate.instant('ORDER.ACTIONS'),
        add: false,
        edit: false,
        delete: false,
        position: 'right',
        custom: [
          {
            name: 'printer',
            title: '<i class="fas fa-print"></i>'
          }
        ],
      },
      pager: {
        display: false
      },
      columns: {
        id: {
          title: this.translate.instant('COMMON.ID'),
          type: 'number',
          filterFunction(cell: any, search?: string): boolean {
            return true;
          }
        },
        billingName: {
          title: this.translate.instant('ORDER.CUSTOMER_NAME'),
          type: 'string',
          valuePrepareFunction: (customer, data) => {
            // console.log(data);
            return data.billing.firstName + ' ' + data.billing.lastName;
          },
          filterFunction(cell: any, search?: string): boolean {
            return true;
          }
        },
        billingPhone: {
          title: this.translate.instant('ORDER.CUSTOMER_PHONE'),
          type: 'string',
          valuePrepareFunction: (customer, data) => {
            // console.log(customer)
            return data.billing.phone;
          },
          filterFunction(cell: any, search?: string): boolean {
            return true;
          }
        },
        billingEmail: {
          title: this.translate.instant('ORDER.CUSTOMER_EMAIL'),
          type: 'string',
          valuePrepareFunction: (customer, data) => {
            // console.log(customer)
            return data.billing.email;
          },
          filterFunction(cell: any, search?: string): boolean {
            return true;
          }
        },
        total: {
          title: this.translate.instant('ORDER.TOTAL'),
          type: 'string',
          filter: false,
          valuePrepareFunction: (total) => {
            return total.value;
          }
        },
        datePurchased: {
          title: this.translate.instant('ORDER.ORDER_DATE'),
          type: 'string',
          filter: false,
          // valuePrepareFunction: (date) => {
          //   if (date) {
          //     return new DatePipe('en-GB').transform(date, 'yyyy-MM-dd');
          //   }
          // }
        },
      },

    };

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
    this.getOrderList()
  }

  onSelectStore(e) {
    this.params["store"] = e.value;
    this.getOrderList();
  }

}

