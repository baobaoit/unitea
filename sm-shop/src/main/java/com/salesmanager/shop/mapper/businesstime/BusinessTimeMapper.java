package com.salesmanager.shop.mapper.businesstime;

import com.salesmanager.core.model.businesstime.BusinessSchedule;
import com.salesmanager.core.model.businesstime.BusinessTimeConfiguration;
import com.salesmanager.shop.model.businesstime.PersistableBusinessSchedule;
import com.salesmanager.shop.model.businesstime.ReadableBusinessSchedule;
import com.salesmanager.shop.model.configuration.PersistableBusinessTimeConfiguration;
import com.salesmanager.shop.model.configuration.ReadableBusinessTimeConfiguration;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BusinessTimeMapper {

    public ReadableBusinessSchedule toReadableBusinessSchedule(BusinessSchedule schedule) {

        ReadableBusinessSchedule readableBusinessSchedule = new ReadableBusinessSchedule();
        readableBusinessSchedule.setDay(DayOfWeek.valueOf(schedule.getDay()));
        readableBusinessSchedule.setOpeningHour(LocalTime.parse(schedule.getOpeningHour()).format(DateTimeFormatter.ofPattern("hh:mm a")));
        readableBusinessSchedule.setClosingHour(LocalTime.parse(schedule.getClosingHour()).format(DateTimeFormatter.ofPattern("hh:mm a")));
        readableBusinessSchedule.setEnabled(schedule.isEnabled());

        return readableBusinessSchedule;
    }

    public List<ReadableBusinessSchedule> toReadableBusinessScheduleList(List<BusinessSchedule> schedule) {
        return schedule.stream().map(this::toReadableBusinessSchedule).collect(Collectors.toList());
    }

    public ReadableBusinessTimeConfiguration toReadableBusinessTimeConfiguration(BusinessTimeConfiguration configuration) {
        ReadableBusinessTimeConfiguration timeConfiguration = new ReadableBusinessTimeConfiguration();
        timeConfiguration.setBusinessSchedules(toReadableBusinessScheduleList(configuration.getBusinessSchedules()));

        return timeConfiguration;
    }

    public BusinessTimeConfiguration toBusinessTimeConfig(PersistableBusinessTimeConfiguration configuration) {

        Validate.notNull(configuration,"Tip configuration must not be null");
        Validate.notNull(configuration.getBusinessSchedules(),"PersistableTipConfiguration must not be null");
        List<BusinessSchedule> businessSchedules = new ArrayList<>();

        for (PersistableBusinessSchedule schedule: configuration.getBusinessSchedules()) {
            businessSchedules.add(toBusinessSchedule(schedule));
        }
        BusinessTimeConfiguration businessTimeConfiguration = new BusinessTimeConfiguration();
        businessTimeConfiguration.setBusinessSchedules(businessSchedules);

        return businessTimeConfiguration;
    }

    private BusinessSchedule toBusinessSchedule(PersistableBusinessSchedule businessSchedule) {
        BusinessSchedule schedule = new BusinessSchedule();
        schedule.setDay(String.valueOf(businessSchedule.getDay()));
        schedule.setOpeningHour(businessSchedule.getOpeningHour().toString());
        schedule.setClosingHour(businessSchedule.getClosingHour().toString());
        schedule.setEnabled(businessSchedule.isEnabled());

        return schedule;
    }
}
