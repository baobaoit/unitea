import { Component, OnInit, OnDestroy } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StorageService } from '../../shared/services/storage.service';
import { StoreService } from '../services/store.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-store-coordinate',
  templateUrl: './store-coordinate.component.html',
  styleUrls: ['./store-coordinate.component.scss']
})
export class StoreCoordinateComponent implements OnInit, OnDestroy {
  loader = false;
  form: FormGroup;
  merchantSelected: string = environment.merchantStore;

  private sub: Subscription = new Subscription();

  constructor(
    private fb: FormBuilder,
    private storeService: StoreService,
    private translate: TranslateService,
    private storageService: StorageService,
    private toastr: ToastrService
  ) {
  }
 
  ngOnInit() {
    this.form = this.fb.group({
      latitude: ['', [Validators.required]],
      longitude: ['', [Validators.required]],
    });
    this.loadStoreCoordinate();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  onSelectStore(e) {
    this.merchantSelected = e;
    this.loadStoreCoordinate();
  }

  get latitude() {
    return this.form.get('latitude');
  }

  get longitude() {
    return this.form.get('longitude');
  }

  private loadStoreCoordinate() {
    this.loader = true;
    this.sub.add(this.storeService.loadStoreCoordinate(this.merchantSelected)
      .subscribe(data => {
        this.loader = false;
        const coordinateServer = data.coordinate;
        this.form.controls['latitude'].patchValue(coordinateServer.latitude);
        this.form.controls['longitude'].patchValue(coordinateServer.longitude);
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

  save() {
    const storeObj = this.form.value;
    this.loader = true;
    this.sub.add(this.storeService.saveStoreCoordinate(this.merchantSelected, storeObj)
      .subscribe(data => {
        this.loader = false;
        this.toastr.success(this.translate.instant('STORE_COORDINATE.SAVE'));
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }
}
