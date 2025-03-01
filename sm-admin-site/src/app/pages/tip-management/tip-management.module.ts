import { NgModule } from '@angular/core';

import { NbDateFnsDateModule } from '@nebular/date-fns';
import { NbMomentDateModule } from '@nebular/moment';

import { TipComponent } from './tip-management.component';
import { TipRoutingModule } from './tip-management-routing.module';
import { SharedModule } from '../shared/shared.module';
import { TipListComponent } from './tip-list/list.component';

import { NbDialogModule, NbFormFieldModule, NbInputModule } from '@nebular/theme';
import { MalihuScrollbarModule } from 'ngx-malihu-scrollbar';
import { CustomModule } from '../custom-component/custom.module';
@NgModule({
  declarations: [
    TipComponent,
    TipListComponent
  ],
  entryComponents: [

  ],
  imports: [
    TipRoutingModule,
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
export class TipManagementModule { }
