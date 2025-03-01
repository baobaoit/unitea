import { Injectable } from '@angular/core';

import { CrudService } from './crud.service';
import { Observable } from 'rxjs';
import { environment } from '../../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ManufactureService {

  constructor(
    private crudService: CrudService,
  ) {
  }

  getManufacturers(): Observable<any> {
    return this.crudService.get(`/v1/manufacturers/`, { store: environment.merchantStore });
  }
}
