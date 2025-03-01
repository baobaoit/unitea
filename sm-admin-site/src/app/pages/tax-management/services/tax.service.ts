import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

import { environment } from '../../../../environments/environment';
import { Observable } from 'rxjs';
import { CrudService } from '../../shared/services/crud.service';

@Injectable({
  providedIn: 'root'
})
export class TaxService {

  constructor(
    private crudService: CrudService
  ) {
  }
  // Tax Classes Services 
  getTaxClass(params): Observable<any> {

    return this.crudService.get('/v1/private/tax/class', params);
  }
  deleteTaxClass(id): Observable<any> {
    return this.crudService.delete(`/v1/private/tax/class/${id}?store=${environment.merchantStore}`);
  }
  getUniqueTax(code) {
    return this.crudService.get(`/v1/private/tax/class/unique?code=${code}&store=${environment.merchantStore}`);
  }
  addTaxClasses(param) {
    return this.crudService.post(`/v1/private/tax/class?store=${environment.merchantStore}`, param);
  }
  updateTaxClasses(taxClassID, params) {
    return this.crudService.put(`/v1/private/tax/class/${taxClassID}?store=${environment.merchantStore}`, params);
  }
  getTaxClassesDetails(param): Observable<any> {
    return this.crudService.get(`/v1/private/tax/class/${param}?store=${environment.merchantStore}`);
  }
  // Country & State
  getCountry(): Observable<any> {
    return this.crudService.get('/v1/country')
  }
  getBillingZone(value): Observable<any> {
    return this.crudService.get('/v1/zones?code=' + value)
  }
  // Tax Rate Services

  getTaxRate(params): Observable<any> {

    return this.crudService.get('/v1/private/tax/rates', params);
  }
  getUniqueRate(code) {
    return this.crudService.get(`/v1/private/tax/rate/unique?code=${code}&store=${environment.merchantStore}`);
  }
  addTaxRate(param) {
    return this.crudService.post(`/v1/private/tax/rate?store=${environment.merchantStore}`, param);
  }
  deleteTaxRate(id): Observable<any> {
    return this.crudService.delete(`/v1/private/tax/rate/${id}?store=${environment.merchantStore}`);
  }
  getTaxRateDetails(param, lan): Observable<any> {
    return this.crudService.get(`/v1/private/tax/rate/${param}/?lang=${lan}&store=${environment.merchantStore}`);
  }
  updateTaxRate(taxrateID, params) {
    return this.crudService.put(`/v1/private/tax/rate/${taxrateID}?store=${environment.merchantStore}`, params);
  }

  getCurrentTaxConfiguration(params): Observable<any> {
    return this.crudService.get('/v1/private/configurations/taxes', params);
  }

  updateTaxConfiguration(currentStore: string, value: string) {
    const payload = {
      taxBasis: value
    };
    return this.crudService.put(`/v1/private/configurations/taxes?store=${currentStore}`, payload);
  }

}
