import { Component, OnDestroy, OnInit } from '@angular/core';

import { UserService } from '../shared/services/user.service';
import { CrudService } from '../shared/services/crud.service';
import { Subscription } from 'rxjs';
import { StorageService } from '../shared/services/storage.service';
import { TranslateService } from '@ngx-translate/core';
import { environment } from '../../../environments/environment';
import * as moment from 'moment';
import { LocalDataSource } from 'ng2-smart-table';

@Component({
  selector: 'ngx-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit, OnDestroy {
  loading = false;
  // paginator
  perPage = 10;
  currentPage = 1;

  widgetStatisticData: any = [
    {
        icon: 'far fa-heart',
        color: 'primary',
        value: '58947',
        text: 'Total Revenue'
    },
    {
        icon: 'fas fa-shopping-basket',
        color: 'success',
        value: '127',
        text: 'Orders'
    },
    {
        icon: 'far fa-chart-bar',
        color: 'info',
        value: '0.58',
        text: 'Stores'
    },
    {
        icon: 'far fa-user',
        color: 'warning',
        value: '78.41',
        text: 'Customers'
    }
  ];

  widgetTipsTodayData: any = [
    {
      title: 'Revenue today',
      value: 0,
      text: '',
      revenue: '17.48%'
    },
    {
      title: 'Orders today',
      value: 0,
      text: '',
      revenue: '3.64%'
    },
    {
      title: 'Tips today',
      value: 0,
      text: 'Tips today: $22506 ',
      revenue: '10.25%'
    },
    {
      title: 'Customers today',
      value: 0,
      text: '',
      revenue: '3.64%'
    }
  ];
  source: LocalDataSource = new LocalDataSource();
  settings = {};
  params = this.loadParams();
  totalCount;

  private subscriptions: Subscription = new Subscription();

  constructor(
    private userService: UserService,
    private crudService: CrudService,
    private storageService: StorageService,
    private translate: TranslateService,
  ) {
  }

  ngOnInit() {
    this.subscriptions.add(this.userService.getTipsToday().subscribe(response => {
      if (response) {
        this.widgetTipsTodayData[2].value = response.tipsToday;
        this.widgetTipsTodayData[2].text = `Total tips: ${response.totalTip}`;
      }
    }));
    // load Statistic today
    const nowDate = moment().format('yyyy-MM-DD');
    this.subscriptions.add(this.userService.getStatistic(nowDate).subscribe(response => {
      this.widgetTipsTodayData[0].value = response.totalRevenueValue ? `$${response.totalRevenueValue}`: 0;
      this.widgetTipsTodayData[1].value = response.totalOrders;
      this.widgetTipsTodayData[3].value = response.totalCustomer;
    }));
    this.subscriptions.add(this.userService.getStatistic().subscribe(response => {
      this.widgetStatisticData[0].value = response.totalRevenueValue ? `$${response.totalRevenueValue}`: 0;
      this.widgetStatisticData[1].value = response.totalOrders;
      this.widgetStatisticData[2].value = response.totalStores;
      this.widgetStatisticData[3].value = response.totalCustomer;
    }));

    this.getRecentOrders();
  }

 ngOnDestroy() {
   this.subscriptions.unsubscribe();
 }

 onViewMoreOrders() {

 }

 setSettings() {
  this.settings = {
    hideSubHeader: true,
    actions: {
      columnTitle: this.translate.instant('ORDER.ACTIONS'),
      add: false,
      edit: false,
      delete: false,
      position: 'right',
      sort: true,
      custom: [
      ],
    },
    pager: {
      display: false
    },
    columns: {
      id: {
        title: this.translate.instant('TIP.ORDER_ID'),
        type: 'number'
      },
      datePurchased: {
        title: this.translate.instant('ORDER.ORDER_DATE'),
        type: 'string'
      },
      orderStatus: {
        title: this.translate.instant('ORDER.STATUS'),
        type: 'string'
      },
      total: {
        title: this.translate.instant('ORDER.TOTAL'),
        type: 'string',
        valuePrepareFunction: (values) => {
          return `$${values.value}`;
        }
      },
    }
  };

  }

  loadParams() {
    return {
      count: this.perPage,
      page: 0,
      store: environment.merchantStore
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
  }

  getRecentOrders() {
    this.params.page = this.currentPage - 1;

    this.loading = true;
    this.subscriptions.add(this.userService.getRecentOrder(this.params)
      .subscribe(data => {
        this.loading = false;
        if (data.orders && data.orders.length !== 0) {
          this.source.load(data.orders);
        } else {
          this.source.load([]);
        }
        this.totalCount = data.recordsTotal;
      }, error => {
        this.loading = false;
        this.source.load([]);
    }));
    this.setSettings();
  }

}
