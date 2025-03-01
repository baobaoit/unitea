import { Component, OnInit, OnDestroy } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';

import { StorageService } from '../../shared/services/storage.service';
import { TaxService } from '../services/tax.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-tax-configuration',
  templateUrl: './tax-configuration.component.html',
  styleUrls: ['./tax-configuration.component.scss']
})
export class TaxConfigurationComponent implements OnInit, OnDestroy {
  loader = false;
  isSuperAdmin: boolean;
  
  taxConfiguration: any[] = [
    {
      value: 'STOREADDRESS',
      name: 'Store address'
    },
    {
      value: 'SHIPPINGADDRESS',
      name: 'Shipping address'
    },
    {
      value: 'BILLINGADDRESS',
      name: 'Billing address'
    }
  ];
  selectedTax: string;
  newValue: number;
  merchantSelected: string = environment.merchantStore;

  private sub: Subscription = new Subscription();

  constructor(
    private taxService: TaxService,
    private translate: TranslateService,
    private storageService: StorageService,
    private toastr: ToastrService
  ) {
    this.isSuperAdmin = this.storageService.getUserRoles().isSuperadmin;
  }
 
  ngOnInit() {
    this.getCurrentTaxConfiguration();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  onSelectStore(e) {
    this.merchantSelected = e;
    this.getCurrentTaxConfiguration();
  }
 
  getCurrentTaxConfiguration() {
    this.loader = true;
    this.sub.add(this.taxService.getCurrentTaxConfiguration(this.merchantSelected)
      .subscribe(data => {
        console.log('data', data);
        this.loader = false;
        this.selectedTax = data.taxBasis;
      }, error => {
        this.loader = false;
    }));
  }

  save(): void {
    this.loader = true;
    this.sub.add(this.taxService.updateTaxConfiguration(this.merchantSelected, this.selectedTax)
      .subscribe(data => {
        this.loader = false;
        this.toastr.success(this.translate.instant('TAX.SAVE_TAX_CONFIGURATION'));
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

}