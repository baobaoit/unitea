import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { TipComponent } from './tip-management.component';
import { TipListComponent } from './tip-list/list.component';
import { NotFoundComponent } from '../shared/components/not-found/not-found.component';

const routes: Routes = [
  {
    path: '', component: TipComponent, children: [
      {
        path: '',
        redirectTo: 'list',
        pathMatch: 'full',
      },
      {
        path: 'list',
        component: TipListComponent,
      },
      {
        path: '**',
        component: NotFoundComponent
      }
    ],
  }
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TipRoutingModule {
}
