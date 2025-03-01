import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ReportComponent } from './report-management.component';
import { NotFoundComponent } from '../shared/components/not-found/not-found.component';
import { TipsReportComponent } from './tips/tips.component';

const routes: Routes = [
  {
    path: '', component: ReportComponent, children: [
      {
        path: '',
        redirectTo: 'tips',
        pathMatch: 'full',
      },
      {
        path: 'tips',
        component: TipsReportComponent,
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
export class ReportRoutingModule {
}
