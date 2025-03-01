import { Component, OnInit, OnDestroy } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';

import { StorageService } from '../../shared/services/storage.service';
import { TipService } from '../services/tip.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-tip-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class TipListComponent implements OnInit, OnDestroy {
  loader = false;
  isSuperAdmin: boolean;
  // activated: false
  // percentage: 0
  tipRates: any[] = [];
  selectedTip: number;
  newValue: number;
  merchantSelected: string = environment.merchantStore;

  private sub: Subscription = new Subscription();

  constructor(
    private tipService: TipService,
    private translate: TranslateService,
    private storageService: StorageService,
    private toastr: ToastrService
  ) {
    this.isSuperAdmin = this.storageService.getUserRoles().isSuperadmin;
  }
 
  ngOnInit() {
    this.getTipList();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  onSelectStore(e) {
    this.merchantSelected = e;
    this.getTipList();
  }
 
  getTipList() {
    this.loader = true;
    this.sub.add(this.tipService.getTipsManagement(this.merchantSelected)
      .subscribe(data => {
        // console.log('data', data);
        this.loader = false;
        this.tipRates = data.tipRates;
        const tipSelection = this.tipRates.filter(d => d.activated === true);
        if (tipSelection && tipSelection.length > 0) {
          this.selectedTip = tipSelection[0].percentage;
        }
      }, error => {
        this.loader = false;
    }));
  }

  save(): void {
    this.loader = true;
    this.tipRates.map(d => {
      if (d.percentage === this.selectedTip) {
        d.activated = true;
      } else {
        d.activated = false;
      }
      return {...d};
    });

    this.sub.add(this.tipService.saveTipsManagement(this.merchantSelected, this.tipRates)
      .subscribe(data => {
        this.loader = false;
        this.toastr.success(this.translate.instant('TIP.SAVE_TIPS'));
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

  addTipRates() {
    const indexData = this.tipRates.findIndex(d => d.percentage === this.newValue);
    if (indexData !== -1) {
      return;
    }
    const newTips = {
      activated: false,
      percentage: this.newValue
    };
    this.tipRates.push(newTips);
    this.newValue = null;
  }

  onRemove($event, data): void {
    const indexData = this.tipRates.findIndex(d => d.percentage === data.percentage);
    if (indexData !== -1) {
      this.tipRates.splice(indexData, 1);
    }
  }

  onChangeTips($event): void {
    this.tipRates.map(d => {
      if (d.percentage === $event) {
        d.activated = true;
      } else {
        d.activated = false;
      }
      return {...d};
    });
  }

}
