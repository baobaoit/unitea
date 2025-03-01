import { Injectable } from '@angular/core';

import { CrudService } from '../../../shared/services/crud.service';
import { Observable } from 'rxjs';
import { StorageService } from '../../../shared/services/storage.service';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(
    private crudService: CrudService,
    private storageService: StorageService,
  ) {
  }

  getListOfProducts(params): Observable<any> {
    return this.crudService.get(`/v1/products`, params).pipe(
      map(d => {
        if (d.products) {
          d.products.map(p => {
            p.name = p.description.name;
            return {...p};
          })
        }
        return {...d};
      })
    );
  }

  updateProductFromTable(id, product): Observable<any> {
    return this.crudService.patch(`/v1/private/product/${id}`, product);
  }

  updateProduct(id, product): Observable<any> {
    const params = {
      store: this.storageService.getMerchant()
    };
    return this.crudService.put(`/v2/private/product/definition/${id}`, product, { params });
  }

  getProductById(id): Observable<any> {
    const params = {
      lang: '_all',
      store: this.storageService.getMerchant()
    };
    return this.crudService.get(`/v1/products/${id}`, params);
  }

  getProductDefinitionById(id): Observable<any> {
    const params = {
      lang: '_all',
      store: this.storageService.getMerchant()
    };
    return this.crudService.get(`/v2/private/product/definition/${id}`, params);
  }

  createProduct(product): Observable<any> {
    const params = {
      store: this.storageService.getMerchant()
    };
    return this.crudService.post(`/v2/private/product/definition?store=${this.storageService.getMerchant()}`, product);
  }

  deleteProduct(id): Observable<any> {
    return this.crudService.delete(`/v1/private/product/${id}`);
  }

  getProductTypes(): Observable<any> {
    return this.crudService.get(`/v1/private/products/types`, { store: this.storageService.getMerchant() });
  }

  checkProductSku(code): Observable<any> {
    const params = {
      'code': code,
    };
    return this.crudService.get(`/v1/private/product/unique`, params);
  }

  addProductToCategory(productId, categoryId): Observable<any> {
    return this.crudService.post(`/v1/private/product/${productId}/category/${categoryId}`, {});
  }

  removeProductFromCategory(productId, categoryId): Observable<any> {
    return this.crudService.delete(`/v1/private/product/${productId}/category/${categoryId}`);
  }

  getTaxClass(params): Observable<any> {
    return this.crudService.get('/v1/private/tax/class', params);
  }

}
