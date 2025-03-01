package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.businesstime.PersistableBusinessSchedule;

import java.util.Set;

public class PersistableBusinessTimeConfiguration extends BusinessTimeConfigurationEntity {
    private Set<PersistableBusinessSchedule> businessSchedules;


    public Set<PersistableBusinessSchedule> getBusinessSchedules() {
        return businessSchedules;
    }
    public void setBusinessSchedules(Set<PersistableBusinessSchedule> businessSchedules) {
        this.businessSchedules = businessSchedules;
    }
}
