import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';
import * as moment from 'moment';
import { OrdersService } from '../../orders/services/orders.service';

@Component({
  selector: 'ngx-view-order-details',
  templateUrl: 'view-order-details.html',
  styleUrls: ['view-order-details.scss'],
})
export class ViewOrderDetailsComponent implements OnInit {
  moment: any = moment;
  info = {
    userName: '',
    language: '',
    emailAddress: '',
    datePurchased: ''
  };
  billing = {
    firstName: '',
    lastName: '',
    company: '',
    address: '',
    city: '',
    zone: '',
    tempZone: '',
    country: '',
    tempCountry: '',
    postalCode: '',
    phone: ''
  };
  billingCountry: Array<any> = [];
  billingStateData: Array<any> = [];
  orderDetailsData: any;
  loadingList = false;
  orderID: string;
  orderData: any;
  public scrollbarOptions = { axis: 'y', theme: 'minimal-dark' };

  constructor(
    protected ref: NbDialogRef<ViewOrderDetailsComponent>,
    private ordersService: OrdersService
  ) {
    
  }

  ngOnInit(): void {
    this.getCountry();

    if (this.orderData) {
      this.orderID = this.orderData.orderId;
      this.getOrderDetails();
    }
  }

  cancel() {
    this.ref.close();
  }

  getCountry() {
    this.ordersService.getCountry()
      .subscribe(data => {

        this.billingCountry = data;
      }, error => {

      });
  }
  onBillingChange(value, flag) {
    this.ordersService.getBillingZone(value)
      .subscribe(data => {
        if (data.length > 0) {

          this.billingStateData = data;
          if (flag == 1) {
            this.billing.zone = data[0].code;

          }
        } else {
          this.billingStateData = data;
          this.billing.zone = '';

        }
      }, error => {

      });
  }

  getOrderDetails() {
    this.loadingList = true;
    this.ordersService.getOrderDetails(this.orderID)
      .subscribe(data => {
        this.loadingList = false;
        this.orderDetailsData = data;
        this.onBillingChange(data.billing.country, 0)

        this.info.emailAddress = data.customer.emailAddress;
        this.info.datePurchased = data.datePurchased;

        this.billing = data.billing;

      }, error => {
        this.loadingList = false;
      });
  }
}
