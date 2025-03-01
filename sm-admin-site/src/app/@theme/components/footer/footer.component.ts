import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { NbMenuService, NbSidebarService } from '@nebular/theme';
import { LayoutService } from '../../../@core/utils';
import { AuthService } from '../../../pages/auth/services/auth.service';
import { UserService } from '../../../pages/shared/services/user.service';
import { environment } from '../../../../environments/environment';
import { TranslateService } from '@ngx-translate/core';
import { Subscription } from 'rxjs';

@Component({
  selector: 'ngx-footer',
  styleUrls: ['./footer.component.scss'],
  template: `
        <span class="created-by">&copy; Developed by <a href="https://hesmantech.com/">Hesmantech LLC</a></span>
        <div *ngIf="orders?.length" class="notification-box" (click)="onNewOrdersPage()">
          <span class="notification-count">{{orders?.length}}</span>
          <div class="notification-bell">
            <span class="bell-top"></span>
            <span class="bell-middle"></span>
            <span class="bell-bottom"></span>
            <span class="bell-rad"></span>
          </div>
        </div>
  `
})
export class FooterComponent implements OnInit, OnDestroy {
  currentYear = new Date().getFullYear();

  orders: any[] = [];
  private polling: any;
  private subscriptions: Subscription = new Subscription();

  constructor(
    private menuService: NbMenuService,
    private userService: UserService,
    private layoutService: LayoutService,
    private authService: AuthService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    // private howlerService: NgxHowlerService,
    private translate: TranslateService
  ) {
  }

  ngOnInit() {
    // this.howlerService.register('order', {
    //   src: ['https://cdns-preview-0.dzcdn.net/stream/c-04aafcf038f5e276615f4e1ab712504e-4.mp3'],
    //   html5: true
    // }).subscribe(status => {
    //   // ok
    // });
    this.loadNewOrders();
  }

  ngOnDestroy(): void {
    clearInterval(this.polling);
    // this.howlerService.get('order').off();
    this.subscriptions.unsubscribe();
  }

  onNewOrdersPage(): void {
    const queryParams = {
      id: this.orders.map(d => d.id)
    };
    this.router.navigate(['orders/order-going'], {
      relativeTo: this.activatedRoute,
      queryParams: queryParams
    });
  }

  private loadNewOrders(): void {
    const getNewOrders = () => {
      this.userService.getNewOrders().subscribe(result => {
        this.orders = result;
        if (result && result.length > 0) {
          // this.playSound();
        }
        if (result && result.length === 0) {
          // this.howlerService.get('order').off();
        }
      });
    };
    getNewOrders();
    this.polling = setInterval(() => {
      getNewOrders();
    }, 30000); 
    // 2 mins = 60000
    // 5 mins = 300000
  }
}
