import { NgModule } from '@angular/core';

import { StoreManagementComponent } from './store-management.component';
import { SharedModule } from '../shared/shared.module';
import { StoreManagementRoutingModule } from './store-management-routing.module';
import { StoreDetailsComponent } from './store-details/store-details.component';
import { StoreCreationComponent } from './store-creation/store-creation.component';
import { StoresListComponent } from './stores-list/stores-list.component';
import { StoreFormComponent } from './store-form/store-form.component';
import { AgmCoreModule } from '@agm/core';
import { environment } from '../../../environments/environment';
import { StoreLandingPageComponent } from './store-landing-page/store-landing-page.component';
import { NgxSummernoteModule } from 'ngx-summernote';
import { StoreDetailInfoComponent } from './store-detail-info/store-detail-info.component';
import { StoreBrandingComponent } from './store-branding/store-branding.component';
import { RetailerComponent } from './retailer/retailer.component';
import { RetailerListComponent } from './retailer-list/retailer-list.component';
import { RetailerStoresComponent } from './retailer-stores/retailer-stores.component';
import { NbDialogModule } from '@nebular/theme';

import { BusinessHoursComponent } from './business-hours/business-hours.component';
import { StoreCoordinateComponent } from './store-coordinate/store-coordinate.component';
import { CustomModule } from '../custom-component/custom.module';
import { ConvenienceFeeComponent } from './convenience-fee/convenience-fee.component';

@NgModule({
  declarations: [
    StoreManagementComponent,
    StoreDetailsComponent,
    StoreCreationComponent,
    StoresListComponent,
    StoreFormComponent,
    StoreBrandingComponent,
    StoreFormComponent,
    StoreLandingPageComponent,
    StoreDetailInfoComponent,
    RetailerComponent,
    RetailerListComponent,
    RetailerStoresComponent,
    BusinessHoursComponent,
    StoreCoordinateComponent,
    ConvenienceFeeComponent
  ],
  imports: [
    StoreManagementRoutingModule,
    CustomModule,
    AgmCoreModule.forRoot({
      apiKey: environment.googleApiKey,
      libraries: ['places'],
      language: 'en'
    }),

    SharedModule,
    NbDialogModule.forChild(),
    NgxSummernoteModule
  ]
})
export class StoreManagementModule {
}
