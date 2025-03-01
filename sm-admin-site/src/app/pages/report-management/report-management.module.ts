import { NgModule } from '@angular/core';

import { NbDateFnsDateModule } from '@nebular/date-fns';
import { NbMomentDateModule } from '@nebular/moment';

import { ReportComponent } from './report-management.component';
import { TipsReportComponent } from './tips/tips.component';
import { ViewOrderDetailsComponent } from './view-order-details/view-order-details';
import { ReportRoutingModule } from './report-management-routing.module';
import { SharedModule } from '../shared/shared.module';

import { NbDialogModule, NbFormFieldModule, NbInputModule } from '@nebular/theme';
import { MalihuScrollbarModule } from 'ngx-malihu-scrollbar';
import { CustomModule } from '../custom-component/custom.module';

@NgModule({
  declarations: [
    ReportComponent,
    TipsReportComponent,
    ViewOrderDetailsComponent
  ],
  entryComponents: [
    ViewOrderDetailsComponent
  ],
  imports: [
    ReportRoutingModule,
    NbFormFieldModule,
    NbInputModule,
    SharedModule,
    CustomModule,
    NbDialogModule.forChild(),
    MalihuScrollbarModule.forRoot(),
    NbDateFnsDateModule.forRoot({
      format: 'yyyy-MM-dd',
    }),
    NbMomentDateModule
  ]
})
export class ReportManagementModule { }
