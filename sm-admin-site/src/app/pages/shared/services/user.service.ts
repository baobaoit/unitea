import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { environment } from '../../../../environments/environment';
import { roles } from '../models/access-roles';
import { CrudService } from './crud.service';

@Injectable({
  providedIn: 'root'
})

export class UserService {
  userIdString = 'userId';
  roles = {
    canAccessToOrder: false,
    isSuperadmin: false,
    isAdmin: false,
    isAdminCatalogue: false,
    isAdminStore: false,
    isAdminOrder: false,
    isAdminContent: false,
    isCustomer: false,
    isAdminRetail: false,
  };

  constructor(
    private crudService: CrudService
  ) {
  }

  getUser(id: any, params): Observable<any> {
    return this.crudService.get(`/v1/private/users/` + id, params);
  }

  getUserProfile(): Observable<any> {
    return this.crudService.get(`/v1/private/user/profile`);
  }

  checkIfUserExist(body): Observable<any> {
    return this.crudService.post(`/v1/private/user/unique?store=${environment.merchantStore}`, body);
  }

  getMerchant(storeCode?): Observable<any> {
    return this.crudService.get(`/v1/store/${storeCode}`);
  }

  updateUserEnabled(user): Observable<any> {
    return this.crudService.patch(`/v1/private/user/${user.id}/enabled`, user);
  }

  // check roles for access to order page
  checkForAccess(array) {
    roles.forEach(role => {
      array.forEach(elem => {
        if (elem.name === role.name) {
          this.roles.canAccessToOrder = true;
        }
        switch (elem.name) {
          case 'SUPERADMIN':
            this.roles.isSuperadmin = true;
            break;
          case 'ADMIN':
            this.roles.isAdmin = true;
            break;
          case 'ADMIN_CATALOGUE':
            this.roles.isAdminCatalogue = true;
            break;
          case 'ADMIN_STORE':
            this.roles.isAdminStore = true;
            break;
          case 'ADMIN_ORDER':
            this.roles.isAdminOrder = true;
            break;
          case 'ADMIN_CONTENT':
            this.roles.isAdminContent = true;
            break;
          case 'CUSTOMER':
            this.roles.isCustomer = true;
            break;
          case 'ADMIN_RETAIL':
            this.roles.isAdminRetail = true;
            break;
        }
      });
    });
  }

  getUsersList(store, params): Observable<any> {
    return this.crudService.get(`/v1/private/users`, params);
  }

  createUser(user : any, store: any): Observable<any> {
    const params = {
      'store': store
    };
    return this.crudService.post(`/v1/private/user/`, user, { params });
  }

  updateUser(id: any, user: any, store: any): Observable<any> {
    const params = {
      'store': store
    };
    return this.crudService.put(`/v1/private/user/${ id }`, user, { params });
  }

  deleteUser(id: any, store: any): Observable<any> {
    const params = {
      'store': store
    };
    return this.crudService.delete(`/v1/private/user/${ id }`, { params });
  }

  updatePassword(id: any, passwords: any): Observable<any> {
    return this.crudService.patch(`/v1/private/user/${ id }/password`, passwords);
  }

  getUserId(): string {
    return localStorage.getItem(this.userIdString);
  }

  saveUserId(id: string) {
    localStorage.setItem(this.userIdString, id);
  }

  destroyUserId() {
    localStorage.removeItem(this.userIdString);
  }

  // get TIP today
  getTipsToday(): Observable<any> {
    return this.crudService.get(`/v1/private/tips-today?store=${environment.merchantStore}`);
  }

  getStatistic(nowDate?: string): Observable<any> {
    let baseUrl = `/v1/private/statistic?store=${environment.merchantStore}`;
    if (nowDate) {
      baseUrl = `/v1/private/statistic?store=${environment.merchantStore}&date=${nowDate}`;
    }
    return this.crudService.get(baseUrl);
  }

  getRecentOrder(params): Observable<any> {
    return this.crudService.get(`/v1/private/orders?store=${environment.merchantStore}`, params);
  }

  getNewOrders(): Observable<any> {
    return this.crudService.get(`/v1/private/orders/notification/latest?store=${environment.merchantStore}`);
  }

}
