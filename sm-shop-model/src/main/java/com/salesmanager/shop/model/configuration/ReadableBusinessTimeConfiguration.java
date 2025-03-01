package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.businesstime.ReadableBusinessSchedule;

import java.util.List;

public class ReadableBusinessTimeConfiguration extends BusinessTimeConfigurationEntity {
    private List<ReadableBusinessSchedule> businessSchedules;

    private String timeZone;

    public String getTimeZone() {
        return timeZone;
    }
    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }
    public List<ReadableBusinessSchedule> getBusinessSchedules() {
        return businessSchedules;
    }
    public void setBusinessSchedules(List<ReadableBusinessSchedule> businessSchedules) {
        this.businessSchedules = businessSchedules;
    }
}
