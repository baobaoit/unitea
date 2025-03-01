import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import { CrudService } from '../../shared/services/crud.service';

@Injectable({
  providedIn: 'root'
})
export class TipService {

  constructor(
    private crudService: CrudService
  ) {
  }
  
  getTipsManagement(merchantStore: string): Observable<any> {
    return this.crudService.get(`/v1/private/configurations/tip?store=${merchantStore}`);
  }

  saveTipsManagement(merchantStore: string, requestData: any[]): Observable<any> {
    const payload = {
      tipRates: requestData
    };
    return this.crudService.put(`/v1/private/configurations/tip?store=${merchantStore}`, payload);
  }
  
}
