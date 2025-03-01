import { Component, OnDestroy, OnInit } from '@angular/core';

import { CategoryService } from '../../categories/services/category.service';
import { ProductService } from '../services/product.service';
import { LocalDataSource } from 'ng2-smart-table';
import { TranslateService } from '@ngx-translate/core';
import { StorageService } from '../../../shared/services/storage.service';
import { forkJoin, Subscription } from 'rxjs';

@Component({
  selector: 'ngx-product-to-category',
  templateUrl: './product-to-category.component.html',
  styleUrls: ['./product-to-category.component.scss']
})
export class ProductToCategoryComponent implements OnInit, OnDestroy {
  source: LocalDataSource = new LocalDataSource();
  loadingList = false;
  categories = [];
  settings = {};
  loader: boolean = false;
  // paginator
  perPage = 10;
  currentPage = 1;
  totalCount;

  // request params
  params = {
    store: this.storageService.getMerchant(),
    lang: this.storageService.getLanguage(),
    count: this.perPage,
    page: 0
  };

  selectedCategory;
  availableList: any[];
  selectedList: any[];
  availableName: string;

  private subscriptions: Subscription = new Subscription();

  constructor(
    private translate: TranslateService,
    private categoryService: CategoryService,
    private productService: ProductService,
    private storageService: StorageService,
  ) {
  }

  ngOnInit() {
    this.selectedList = [];
    this.getList();
    this.loadAVailableProduct();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  getList() {
    this.categories = [];
    this.params.page = this.currentPage - 1;
    this.loadingList = true;
    this.subscriptions.add(this.categoryService.getListOfCategories(this.params)
      .subscribe(categories => {
        categories.categories.forEach((el) => {
          this.getChildren(el);
        });
        this.totalCount = categories.totalPages;
        const fistItem = {
          id: -1,
          code: 'All'
        };
        this.categories.unshift(fistItem);
        this.source.load(this.categories);
        this.loadingList = false;
      }));
    // this.translate.onLangChange.subscribe((event) => {
    // });
  }

  getChildren(node) {
    if (node.children && node.children.length !== 0) {
      this.categories.push(node);
      node.children.forEach((el) => {
        this.getChildren(el);
      });
    } else {
      this.categories.push(node);
    }
  }

  moveEvent(e, type) {
    if (!this.selectedCategory) {
      return;
    }
    switch (type) {
      case 'toTarget':
        // this.addProductToGroup(e.items[0].id, this.selectedGroup);
        this.subscriptions.add(this.productService.addProductToCategory(e.items[0].id, this.selectedCategory)
          .subscribe(res => {
            console.log(res);
          }));
        break;
      case 'toSource':
        this.subscriptions.add(this.productService.removeProductFromCategory(e.items[0].id, this.selectedCategory)
          .subscribe(res => {
            console.log(res);
          }));
        break;
      case 'allToTarget':
        // const addArray = [];
        // e.items.forEach((el) => {
        //   // const req = this.addProductToGroup(el.id, this.selectedGroup);
        //   // addArray.push(req);
        // });
        // console.log(addArray);
        // forkJoin(addArray).subscribe(res => {
        //   console.log(res);
        // });
        break;
      case 'allToSource':
        // const removeArr = [];
        // e.items.forEach((el) => {
        //   // const req = this.removeProductFromGroup(el.id, this.selectedGroup);
        //   // removeArr.push(req);
        // });
        // console.log(removeArr);
        // forkJoin(removeArr).subscribe(res => {
        //   console.log(res);
        // });
        break;
    }
  }

  onSourceFilter($event) {
    // TODO
  }

  addProductToCategory(productId, groupCode) {
    // this.productGroupsService.addProductToGroup(productId, groupCode)
    //   .subscribe(res => {
    //     console.log(res);
    //   });
  }

  removeProductFromCategory(productId, groupCode) {
    // this.productGroupsService.removeProductFromGroup(productId, groupCode)
    //   .subscribe(res => {
    //     console.log(res);
    //   });
  }

  selectGroup(categoryCode) {
    if (categoryCode === -1) {
      this.selectedCategory = null;
      delete this.params['category'];
    } else {
      this.selectedCategory = categoryCode;
      this.params['category'] = this.selectedCategory;
    }
    delete this.params['name'];
    this.subscriptions.add(this.productService.getListOfProducts(this.params)
      .subscribe(res => {
        this.selectedList = [...res.products];
        this.availableList = this.availableList.filter(n => !this.selectedList.some(n2 => n.id === n2.id));
    }));
  }

  onFilterProduct($event) {
    setTimeout(() => {
      this.params["name"] = $event;
      delete this.params['category'];
      this.loadAVailableProduct();
    }, 0);
  }

  private loadAVailableProduct(): void {
    this.subscriptions.add(this.productService.getListOfProducts(this.params)
      .subscribe(res => {
        const renderProductForFilter = res.products.map(d => {
          if (d.description && d.description.name) {
            d.name = d.description.name;
          }
          return {...d};
        });
        if (this.selectedList && this.selectedList.length > 0) {
          const hasReadyData = (data) => {
            const isExist = this.selectedList.find(d => d.id === data.id);
            if (isExist) {
              return true;
            }
            return false;
          }
          const newProduct = renderProductForFilter.filter(d => {
            return !hasReadyData(d);
          });
          this.availableList = [...newProduct];
        } else {
          this.availableList = [...renderProductForFilter];
        }
    }));
  }

}
