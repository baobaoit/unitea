import { ChangeDetectorRef, Component, OnInit, ViewChild, OnDestroy } from '@angular/core';

import { StorageService } from '../../shared/services/storage.service';
import { StoreService } from '../../store-management/services/store.service';
import { ReportService } from '../services/report.service';
import { LocalDataSource } from 'ng2-smart-table';
import { Router } from '@angular/router';
// import { MalihuScrollbarService } from 'ngx-malihu-scrollbar';
import { TranslateService } from '@ngx-translate/core';
import { error } from '@angular/compiler/src/util';
import { NbDialogService } from '@nebular/theme';
import { ToastrService } from 'ngx-toastr';
import { environment } from '../../../../environments/environment';

import { Subscription } from 'rxjs';
import * as moment from 'moment';
import { NbDateService } from '@nebular/theme';

import { ViewOrderDetailsComponent } from '../view-order-details/view-order-details';

@Component({
  selector: 'ngx-tips-report',
  templateUrl: './tips.component.html',
  styleUrls: ['./tips.component.scss']
})
export class TipsReportComponent implements OnInit, OnDestroy {

  @ViewChild('item', { static: false }) accordion;
  source: LocalDataSource = new LocalDataSource();
  loadingList = false;
  settings = {};
  stores: Array<any> = [];
  selectedStore: string = '';
  // paginator
  perPage = 10;
  currentPage = 1;
  totalCount;
  // roles;
  searchValue: string = '';
  isSuperAdmin: boolean;

  startDate: Date = new Date();
  endDate: Date = new Date();
  tipsDetails: any;
  params = this.loadParams();
  private subs: Subscription = new Subscription();

  constructor(
    private reportService: ReportService,
    private router: Router,
    private dialogService: NbDialogService,
    private translate: TranslateService,
    private storageService: StorageService,
    private storeService: StoreService,
    private toastr: ToastrService,
    protected dateService: NbDateService<Date>
  ) {
    this.isSuperAdmin = this.storageService.getUserRoles().isSuperadmin;
    this.getStoreList();
    this.selectedStore = this.storageService.getMerchant();
  }

  ngOnInit() {
    this.getTipsReport();
  }

  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  loadParams() {
    return {
      count: this.perPage,
      page: 0,
      store: environment.merchantStore
    };
  }

  getStoreList() {
    this.subs.add(this.storeService.getListOfMerchantStoreNames({ 'store': environment.merchantStore })
      .subscribe(res => {
        res.forEach((store) => {
          this.stores.push({ value: store.code, label: store.code });
        });
    }));
  }

  getTipsReport() {
    const fromDate = this.startDate ? moment(this.startDate).format('yyyy-MM-DD') : moment().format('yyyy-MM-DD');
    const toDate = this.endDate ? moment(this.endDate).format('yyyy-MM-DD') : moment().format('yyyy-MM-DD');
    this.params['fromDate'] = fromDate;
    this.params['toDate'] = toDate;
    this.params.page = this.currentPage - 1;

    this.loadingList = true;
    this.subs.add(this.reportService.getTipReports(this.params)
      .subscribe(data => {
        this.loadingList = false;
        this.tipsDetails = data;
        if (data.orderTips && data.orderTips.length !== 0) {
          this.source.load(data.orderTips);
        } else {
          this.source.load([]);
        }
        this.totalCount = data.recordsTotal;
      }, error => {
        this.loadingList = false;
        this.source.load([]);
    }));
    this.setSettings();
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
          { name: 'details', title: '<i class="nb-edit"></i>' },
        ],
      },
      pager: {
        display: false
      },
      columns: {
        orderId: {
          title: this.translate.instant('TIP.ORDER_ID'),
          type: 'number'
        },
        datePurchased: {
          title: this.translate.instant('TIP.DATE'),
          type: 'string'
          // filterFunction(cell: any, search?: string): boolean {
          //   return true;
          // }
        },
        tipAmount: {
          title: this.translate.instant('TIP.TIP_AMOUNT'),
          type: 'string'
        },
        totalAmount: {
          title: this.translate.instant('TIP.TOTAL_AMOUNT'),
          type: 'string'
        },
      }
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
    this.getTipsReport();
  }

  route(e) {
    const orderData = e.data;
    this.dialogService.open(ViewOrderDetailsComponent, {
      context: {
        orderData
      },
    });
  }

  onSelectStore(e) {
    this.params["store"] = e;
    this.getTipsReport();
  }

  onStartDateChange(event): void {
    this.startDate = event;
    if (this.endDate) {
      this.getTipsReport();
    }
  }

  onEndDateChange(event): void {
    this.endDate = event;
    if (this.startDate) {
      this.getTipsReport();
    }
  }

}
