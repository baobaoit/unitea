/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { Component, OnInit } from '@angular/core';

import { Router, NavigationEnd, ActivatedRoute } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { filter, map } from 'rxjs/operators';

import { TranslateService } from '@ngx-translate/core';
import { environment } from '../environments/environment';
import { ConfigService } from './pages/shared/services/config.service';

@Component({
  selector: 'ngx-app',
  template: '<div><router-outlet></router-outlet></div>',
  // template: '<div *ngIf="configService.languages.length!==0"><router-outlet></router-outlet></div>',
})
export class AppComponent implements OnInit {

  constructor(
    private titleService: Title,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private translate: TranslateService,
    public configService: ConfigService
  ) {
    this.configService.getListOfSystemSupportedLanguages();
    if (!localStorage.getItem('lang') || localStorage.getItem('lang') && localStorage.getItem('lang') === 'undefined') {
      localStorage.setItem('lang', environment.client.language.default);
    }
    translate.addLangs([...environment.client.language.array]);
    translate.setDefaultLang(localStorage.getItem('lang'));
    translate.use(localStorage.getItem('lang'));
  }

  ngOnInit(): void {
    const appTitle = this.titleService.getTitle();
    this.router
      .events.pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => {
          let child = this.activatedRoute.firstChild;
          while (child.firstChild) {
            child = child.firstChild;
          }
          if (child.snapshot.data['title']) {
            return child.snapshot.data['title'];
          }
          return appTitle;
        })
      ).subscribe((ttl: string) => {
        const newTitle = `Unitea | ${this.translate.instant(ttl)}`;
        this.titleService.setTitle(newTitle);
      });
  }

}
