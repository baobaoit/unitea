import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

import { NbMenuService, NbSidebarService } from '@nebular/theme';
import { LayoutService } from '../../../@core/utils';
import { AuthService } from '../../../pages/auth/services/auth.service';
import { UserService } from '../../../pages/shared/services/user.service';
import { environment } from '../../../../environments/environment';
import { TranslateService } from '@ngx-translate/core';
import { Subscription } from 'rxjs';

// import { NgxHowlerService } from 'ngx-howler';

@Component({
  selector: 'ngx-header',
  styleUrls: ['./header.component.scss'],
  templateUrl: './header.component.html',
})
export class HeaderComponent implements OnInit, OnDestroy {

  @Input() position = 'normal';

  user: string;

  userMenu = [
    { title: 'HEADER.PROFILE', tag: 'profile' },
    { title: 'HEADER.LOGOUT', tag: 'logout' }
  ];
  localedMenu = [...this.userMenu];

  languages = [];

  langMap = {};
  private subscriptions: Subscription = new Subscription();

  constructor(private sidebarService: NbSidebarService,
              private menuService: NbMenuService,
              private userService: UserService,
              private layoutService: LayoutService,
              private authService: AuthService,
              private router: Router,
              private activatedRoute: ActivatedRoute,
              // private howlerService: NgxHowlerService,
              private translate: TranslateService) {

    this.getLanguageArray();
    menuService.onItemClick().subscribe((el) => {
      if (el.item['tag'] === 'logout') {
        this.authService.logout();
        this.router.navigate(['auth']);
      }
      if (el.item['tag'] === 'profile') {
        this.router.navigate(['pages/user-management/profile']);
      }
      // language events
      if (el.tag === 'language') {
        let lang = el.item.title
        let langCode = this.langMap[el.item.title];
        //console.log(langCode);
        this.setLanguage(langCode);
      }
    });
    this.localedMenu = [...this.localedMenu];
    this.translate.onLangChange.subscribe((lang) => {
      this.localedMenu = this.translateMenu(this.localedMenu);
    });
  }

  ngOnInit() {
    // this.howlerService.register('order', {
    //   src: ['https://cdns-preview-0.dzcdn.net/stream/c-04aafcf038f5e276615f4e1ab712504e-4.mp3'],
    //   html5: true
    // }).subscribe(status => {
    //   // ok
    // });

    this.localedMenu = this.translateMenu(this.localedMenu);
    this.subscriptions.add(this.userService.getUserProfile()
      .subscribe((user: any) => {
        this.user = user.firstName + ' ' + user.lastName;
    }));
  }

  ngOnDestroy(): void {
    // this.howlerService.get('order').off();
    this.subscriptions.unsubscribe();
  }

  translateMenu(array) {
    return array.map((el, index) => ({
      ...el,
      title: this.translate.instant(this.userMenu[index].title),
    }));
  }

  translateLang(key) {
    let translated =  this.translate.instant("LANG." + key);
    return translated;
  }

  getLanguageArray () {
    environment.client.language.array.forEach(lg => {
      this.langMap[this.translateLang(lg)] = lg;
      this.languages = [...this.languages, {title: this.translateLang(lg)}];
    });
  }

  setLanguage (lang) {
    localStorage.setItem('lang', lang);
    this.translate.setDefaultLang(lang);
    this.translate.use(lang);
    //get reference data
  }

  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, 'menu-sidebar');
    this.layoutService.changeLayoutSize();

    return false;
  }

  goToHome() {
    this.menuService.navigateHome();
  }

}
