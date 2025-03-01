import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

import { environment } from '../../../../environments/environment';
import { Observable } from 'rxjs';
import { CrudService } from '../../shared/services/crud.service';

@Injectable({
  providedIn: 'root'
})
export class OrdersService {

  constructor(
    private crudService: CrudService
  ) {
  }

  getOrders(params): Observable<any> {
    // const params = {
    //   'count': '50',
    //   'start': '0'
    // };
    return this.crudService.get('/v1/private/orders', params);
  }
  getOrderDetails(orderID): Observable<any> {
    return this.crudService.get('/v1/private/orders/' + orderID, { store: environment.merchantStore });
  }
  getCountry(): Observable<any> {
    return this.crudService.get('/v1/country')
  }
  getBillingZone(value): Observable<any> {
    return this.crudService.get('/v1/zones?code=' + value)
  }
  getShippingZone(value): Observable<any> {
    return this.crudService.get('/v1/zones?code=' + value)
  }
  getHistory(orderID): Observable<any> {
    return this.crudService.get('/v1/private/orders/' + orderID + '/history', { store: environment.merchantStore })
  }
  addHistory(orderID, param): Observable<any> {
    return this.crudService.post(`/v1/private/orders/${orderID}/history?store=${environment.merchantStore}`, param);
  }
  updateOrder(orderID, param): Observable<any> {
    return this.crudService.patch(`/v1/private/orders/${orderID}/customer?store=${environment.merchantStore}`, param);
  }
  getNextTransaction(orderID): Observable<any> {
    return this.crudService.get('/v1/private/orders/' + orderID + '/payment/nextTransaction', { store: environment.merchantStore });
  }
  refundOrder(orderID): Observable<any> {
    return this.crudService.post(`/v1/private/orders/${orderID}/refund?store=${environment.merchantStore}`, {});
  }
  captureOrder(orderID): Observable<any> {
    return this.crudService.post(`/v1/private/orders/${orderID}/capture?store=${environment.merchantStore}`, {});
  }
  getTransactions(orderID): Observable<any> {
    return this.crudService.get('/v1/private/orders/' + orderID + '/payment/transactions', { store: environment.merchantStore });
  }

  updateStatusOrder(orderID, status, param): Observable<any> {
    return this.crudService.put(`/v1/private/orders/${orderID}/status/${status}?store=${environment.merchantStore}`, param);
  }

  notificationConfirm(orderIds: any[]): Observable<any> {
    const baseUrl = `/v1/private/orders/notification/confirm?store=${environment.merchantStore}`;
    orderIds = orderIds.map(d => Number(d));
    return this.crudService.post(baseUrl, {orderIds});
  }

}
