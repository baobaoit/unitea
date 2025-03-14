import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { PaymentService } from '../services/payment.service';
import { Router } from '@angular/router';

import { TranslateService } from '@ngx-translate/core';
import { error } from '@angular/compiler/src/util';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-payment-methods',
  templateUrl: './methods.component.html',
  styleUrls: ['./methods.component.scss']
})
export class PaymentMethodsComponent implements OnInit {
  loadingList = false;
  paymentData: Array<any> = [];
  constructor(
    private paymentService: PaymentService,
    private router: Router,
    private translate: TranslateService,
  ) {
    this.getPaymentMethodsList()
  }

  ngOnInit() {


  }
  getPaymentMethodsList() {
    this.loadingList = true;
    this.paymentService.getPaymentModules({ store: environment.merchantStore })
      .subscribe(data => {
        console.log(data);
        this.loadingList = false;
        this.paymentData = data;
      }, error => {
        this.loadingList = false;
      });
  }
  onClickConfigure(value) {
    this.router.navigate(['pages/payment/configure/' + value]);
  }


}
