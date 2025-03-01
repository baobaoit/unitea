import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PageContentComponent } from './page-content.component';
import { PageComponent } from './pages/page.component';
import { BoxesComponent } from './boxes/boxes.component';
import { AddPageComponent } from './pages/add-page.component';
import { AddBoxComponent } from './boxes/add-box.component';
// import { ImagesComponent } from './images/images.component';

import { PromotionComponent } from './promotion/promotion.component';
// import { UploadComponent } from './upload/upload.component';
import { FilesComponent } from './files/files.component';

const routes: Routes = [{
  path: '',
  component: PageContentComponent,
  children: [
    {
      path: 'pages/list',
      component: PageComponent,
    },
    {
      path: 'pages/add/:code',
      component: AddPageComponent,
    },
    {
      path: 'pages/add',
      component: AddPageComponent,
    },
    {
      path: 'boxes/list',
      component: BoxesComponent,
    },
    {
      path: 'boxes/add/:code',
      component: AddBoxComponent,
    },
    {
      path: 'boxes/add',
      component: AddBoxComponent,
    },
    // {
    //   path: 'images/list',
    //   component: ImagesComponent,
    // },
    {
      path: 'files/list',
      component: FilesComponent,
    },
    {
      path: 'promotion',
      component: PromotionComponent,
    }
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PageContentRoutingModule { }