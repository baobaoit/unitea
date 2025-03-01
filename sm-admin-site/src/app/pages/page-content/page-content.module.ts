import { NgModule } from '@angular/core';
import { PageContentRoutingModule } from './page-content-routing.module';
import { SharedModule } from '../shared/shared.module';
import { ngfModule } from 'angular-file';
import { QueryBuilderModule } from "angular2-query-builder";
import { NbDialogModule } from '@nebular/theme';
import { NgxDropzoneModule } from 'ngx-dropzone';
import { LightboxModule } from 'ngx-lightbox';
import { MalihuScrollbarModule } from 'ngx-malihu-scrollbar';
// import { FileManagerModule } from 'ng6-file-man';
import { NgxSummernoteModule } from 'ngx-summernote';
import { CustomModule } from '../custom-component/custom.module';

import { PageContentComponent } from './page-content.component';
import { PageComponent } from './pages/page.component';
import { BoxesComponent } from './boxes/boxes.component';
import { AddPageComponent } from './pages/add-page.component';
import { AddBoxComponent } from './boxes/add-box.component';
import { ImagesComponent } from './images/images.component';
import { PromotionComponent } from './promotion/promotion.component';
import { UploadComponent } from './upload/upload.component';
import { FilesComponent } from './files/files.component';

@NgModule({
  declarations: [
    PageContentComponent,
    PageComponent,
    AddPageComponent,
    BoxesComponent,
    AddBoxComponent,
    ImagesComponent,
    PromotionComponent,
    UploadComponent,
    FilesComponent
  ],
  imports: [
    PageContentRoutingModule,
    SharedModule,
    ngfModule,
    // FileManagerModule,
    QueryBuilderModule,
    NbDialogModule.forChild(),
    NgxSummernoteModule,
    NgxDropzoneModule,
    LightboxModule,
    MalihuScrollbarModule.forRoot(),
    CustomModule
  ],
  exports: []
})
export class PageContentModule {}
