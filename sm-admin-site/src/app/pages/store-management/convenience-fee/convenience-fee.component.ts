import { Component, OnInit, OnDestroy } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StorageService } from '../../shared/services/storage.service';
import { StoreService } from '../services/store.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-convenience-fee',
  templateUrl: './convenience-fee.component.html',
  styleUrls: ['./convenience-fee.component.scss']
})
export class ConvenienceFeeComponent implements OnInit, OnDestroy {
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
      enabled: [false, [Validators.required]],
      convenienceFee: ['', [Validators.required, Validators.min(0)]],
    });
    this.loadConvenienceFee();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  onSelectStore(e) {
    this.merchantSelected = e;
    this.loadConvenienceFee();
  }

  get convenienceFee() {
    return this.form.get('convenienceFee');
  }

  get enabled() {
    return this.form.get('enabled');
  }

  private loadConvenienceFee() {
    this.loader = true;
    this.sub.add(this.storeService.loadConvenienceFee(this.merchantSelected)
      .subscribe(data => {
        this.loader = false;
        this.form.controls['enabled'].patchValue(data.enabled);
        this.form.controls['convenienceFee'].patchValue(data.convenienceFee);
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

  save() {
    if (!this.form.valid) {
      return;
    }
    const storeObj = this.form.value;
    this.loader = true;
    this.sub.add(this.storeService.saveConvenienceFee(this.merchantSelected, storeObj)
      .subscribe(data => {
        this.loader = false;
        this.toastr.success(this.translate.instant('CONVENIENCE_FEE.SAVE'));
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }
}
