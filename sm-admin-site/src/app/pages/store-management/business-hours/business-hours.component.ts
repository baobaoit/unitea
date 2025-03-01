import { Component, OnInit, OnDestroy } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';

import * as _ from 'lodash';
import * as moment from 'moment';

import { StorageService } from '../../shared/services/storage.service';
import { StoreService } from '../services/store.service';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'ngx-business-hours',
  templateUrl: './business-hours.component.html',
  styleUrls: ['./business-hours.component.scss']
})
export class BusinessHoursComponent implements OnInit, OnDestroy {
  loader = false;
  isSuperAdmin: boolean;
  isOpenNow: boolean;

  originBusinessHours: any[] = [
    {
      day: 'MONDAY', display: 'Mon', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'TUESDAY', display: 'Tue', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'WEDNESDAY', display: 'Wed', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'THURSDAY', display: 'Thu', openingHour: '', closingHour: '', enabled: false
    },
     {
      day: 'FRIDAY', display: 'Fri', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'SATURDAY', display: 'Sat', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'SUNDAY', display: 'Sun', openingHour: '', closingHour: '', enabled: false
    }
  ];
  
  businessHours: any[] = [
    {
      day: 'MONDAY', display: 'Mon', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'TUESDAY', display: 'Tue', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'WEDNESDAY', display: 'Wed', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'THURSDAY', display: 'Thu', openingHour: '', closingHour: '', enabled: false
    },
     {
      day: 'FRIDAY', display: 'Fri', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'SATURDAY', display: 'Sat', openingHour: '', closingHour: '', enabled: false
    },
    {
      day: 'SUNDAY', display: 'Sun', openingHour: '', closingHour: '', enabled: false
    }
  ];

  timeOptions: any[] = [
    { label: '12:00 am (midnight)', value: '12:00 AM'},
    { label: '12:30 am', value: '12:30 AM'},
    { label: '1:00 am', value: '01:00 AM'},
    { label: '1:30 am', value: '01:30 AM'},
    { label: '2:00 am', value: '02:00 AM'},
    { label: '2:30 am', value: '02:30 AM'},
    { label: '3:00 am', value: '03:00 AM'},
    { label: '3:30 am', value: '03:30 AM'},
    { label: '4:00 am', value: '04:00 AM'},
    { label: '4:30 am', value: '04:30 AM'},
    { label: '5:00 am', value: '05:00 AM'},
    { label: '5:30 am', value: '05:30 AM'},
    { label: '6:00 am', value: '06:00 AM'},
    { label: '6:30 am', value: '06:30 AM'},
    { label: '7:00 am', value: '07:00 AM'},
    { label: '7:30 am', value: '07:30 AM'},
    { label: '8:00 am', value: '08:00 AM'},
    { label: '8:30 am', value: '08:30 AM'},
    { label: '9:00 am', value: '09:00 AM'},
    { label: '9:30 am', value: '09:30 AM'},
    { label: '10:00 am', value: '10:00 AM'},
    { label: '10:30 am', value: '10:30 AM'},
    { label: '11:00 am', value: '11:00 AM'},
    { label: '11:30 am', value: '11:30 AM'},
    { label: '12:00 pm (noon)', value: '12:00 PM'},
    { label: '12:30 pm', value: '12:30 PM'},

    { label: '1:00 pm', value: '01:00 PM'},
    { label: '1:30 pm', value: '01:30 PM'},
    { label: '2:00 pm', value: '02:00 PM'},
    { label: '2:30 pm', value: '02:30 PM'},
    { label: '3:00 pm', value: '03:00 PM'},
    { label: '3:30 pm', value: '03:30 PM'},
    { label: '4:00 pm', value: '04:00 PM'},
    { label: '4:30 pm', value: '04:30 PM'},
    { label: '5:00 pm', value: '05:00 PM'},
    { label: '5:30 pm', value: '05:30 PM'},
    { label: '6:00 pm', value: '06:00 PM'},
    { label: '6:30 pm', value: '06:30 PM'},
    { label: '7:00 pm', value: '07:00 PM'},
    { label: '7:30 pm', value: '07:30 PM'},
    { label: '8:00 pm', value: '08:00 PM'},
    { label: '8:30 pm', value: '08:30 PM'},
    { label: '9:00 pm', value: '09:00 PM'},
    { label: '9:30 pm', value: '09:30 PM'},
    { label: '10:00 pm', value: '10:00 PM'},
    { label: '10:30 pm', value: '10:30 PM'},
    { label: '11:00 pm', value: '11:00 PM'},
    { label: '11:30 pm', value: '11:30 PM'},
  ];
  shopSite: string = environment.shopSite;
  merchantSelected: string = environment.merchantStore;

  private sub: Subscription = new Subscription();

  constructor(
    private storeService: StoreService,
    private translate: TranslateService,
    private storageService: StorageService,
    private toastr: ToastrService
  ) {
    this.isSuperAdmin = this.storageService.getUserRoles().isSuperadmin;
  }
 
  ngOnInit() {
    this.loadBusinessHours();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  onSelectStore(e) {
    this.merchantSelected = e;
    this.businessHours = this.originBusinessHours;
    this.loadBusinessHours();
  }

  private loadBusinessHours() {
    this.loader = true;
    this.sub.add(this.storeService.loadBusinessHours(this.merchantSelected)
      .subscribe(data => {
        this.loader = false;
        const businessHoursServer = data.businessSchedules;

        if (!data.timeZone) {
          this.businessHours.map(d => {
            const hoursSelection = businessHoursServer.filter(res => res.day === d.day);
            if (hoursSelection && hoursSelection.length > 0) {
              d.openingHour = hoursSelection[0].openingHour;
              d.closingHour = hoursSelection[0].closingHour;
              d.enabled = hoursSelection[0].enabled;
              d.day = hoursSelection[0].day;
              d.hasOpenNow = false;
              d.currentDay = '';
            }
            return {...d};
          });
          return;
        }

        // Start  current day of time zone
        const options: Intl.DateTimeFormatOptions = {
          timeZone: data.timeZone, // time zone
          weekday: 'long',
          year: 'numeric',
          month: 'numeric',
          day: 'numeric',
          hour: 'numeric',
          minute: 'numeric',
          second: 'numeric',
        };
        const currentTimeFormatter = new Intl.DateTimeFormat([], options);
        // full datetime
        const nowDate = currentTimeFormatter.format(new Date());
        // only time
        const currentTimeOnStore = moment(nowDate).format('hh:mm A');
        // current day
        const currentDay = nowDate.substr(0, nowDate.indexOf(','));
        // End current day of time zone

        this.businessHours.map(d => {
          const hoursSelection = businessHoursServer.filter(res => res.day === d.day);
          if (hoursSelection && hoursSelection.length > 0) {
            d.openingHour = hoursSelection[0].openingHour;
            d.closingHour = hoursSelection[0].closingHour;
            d.enabled = hoursSelection[0].enabled;
            d.day = hoursSelection[0].day;
            d.hasOpenNow = false;
            d.currentDay = '';
            if (d.enabled) {
              d.hasOpenNow = this.hasCheckOpenNowonStore(currentDay, currentTimeOnStore, d.day, d.openingHour, d.closingHour);
              if (_.upperCase(d.day) === _.upperCase(currentDay)) {
                d.currentDay = d.hasOpenNow ? 'Open now' : 'Closed now';
              }
            }
          }
          return {...d};
        });
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

  saveBusinessHours() {
    this.loader = true;
    const newBusinessHours = _.cloneDeep(this.businessHours);
    newBusinessHours.map(d => {
      delete d.display;
      if (d.openingHour) {
        d.openingHour = moment(d.openingHour, 'hh:mm A').format('HH:mm');
      } else {
        d.openingHour = moment('12:00 AM', 'hh:mm A').format('HH:mm');
      }
      if (d.closingHour) {
        d.closingHour = moment(d.closingHour, 'hh:mm A').format('HH:mm');
      } else {
        d.closingHour = moment('12:00 AM', 'hh:mm A').format('HH:mm');
      }
      return {...d};
    });
    this.sub.add(this.storeService.saveBusinessHours(this.merchantSelected, newBusinessHours)
      .subscribe(data => {
        this.loader = false;
        this.loadBusinessHours();
        this.toastr.success(this.translate.instant('BUSINESS_HOURS.SAVE_BUSINESS_HOURS'));
      }, error => {
        this.loader = false;
        this.toastr.error(error.error.message);
    }));
  }

  private checkOpenNowonStore(timeZone: string, businessSchedules: any[]) {
    const isTimeBetween = (startTime, endTime, serverTime) => {
      const nowDate = moment().format('yyyy-MM-DD');
      const formatDate = 'yyyy-MM-DD HH:mm';
      const _startTime = `${nowDate} ${startTime}`;
      const _endTime = `${nowDate} ${endTime}`;
      const serverDateTime = `${nowDate} ${serverTime}`;
      
      const startDateTime = moment(_startTime).format(formatDate);
      const endDateTime = moment(_endTime).format(formatDate);
      const currentDateTime = moment(serverDateTime).format(formatDate);

      const readyOpen = moment(currentDateTime).isBetween(startDateTime, endDateTime);
      return readyOpen;
    };
    const options: Intl.DateTimeFormatOptions = {
      timeZone: timeZone,
      weekday: 'long',
      year: 'numeric',
      month: 'numeric',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric',
      second: 'numeric',
    };
    const currentTimeFormatter = new Intl.DateTimeFormat([], options);
    const nowDate = currentTimeFormatter.format(new Date());
    const currentTimeOnStore = moment(nowDate).format('hh:mm A');
    const currentDay = nowDate.substr(0, nowDate.indexOf(','));
    
    const daySelected = _.filter(businessSchedules, d => _.upperCase(d.day) === _.upperCase(currentDay) && d.enabled === true);
    if (daySelected && daySelected.length > 0) {
      return isTimeBetween(daySelected[0].openingHour, daySelected[0].closingHour, currentTimeOnStore);
    }
    return false;
  }

  private hasCheckOpenNowonStore(currentDay: string, currentTimeOnStore: string, dayOnServer: string, openingHour: string, closingHour: string) {
    // currentDay : day on time zone
    // currentTimeOnStore : on time zone
    // dayOnServer : day into database
    // openingHour : from time into database
    // closingHour : to time into database
    const isTimeBetween = (startTime, endTime, serverTime) => {
      const nowDate = moment().format('yyyy-MM-DD');
      const formatDate = 'yyyy-MM-DD HH:mm';
      const _startTime = `${nowDate} ${startTime}`;
      const _endTime = `${nowDate} ${endTime}`;
      const serverDateTime = `${nowDate} ${serverTime}`;
      
      const startDateTime = moment(_startTime).format(formatDate);
      const endDateTime = moment(_endTime).format(formatDate);
      const currentDateTime = moment(serverDateTime).format(formatDate);

      const readyOpen = moment(currentDateTime).isBetween(startDateTime, endDateTime);
      return readyOpen;
    };
    if (_.upperCase(dayOnServer) === _.upperCase(currentDay)) {
      return isTimeBetween(openingHour, closingHour, currentTimeOnStore);
    }
    return false;
  }

}
