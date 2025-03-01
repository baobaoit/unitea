package com.salesmanager.shop.model.businesstime;

import java.time.LocalTime;

public class PersistableBusinessSchedule extends BusinessScheduleEntity {

    private LocalTime openingHour;
    private LocalTime closingHour;

    public LocalTime getOpeningHour() {
        return openingHour;
    }

    public void setOpeningHour(LocalTime openingHour) {
        this.openingHour = openingHour;
    }

    public LocalTime getClosingHour() {
        return closingHour;
    }

    public void setClosingHour(LocalTime closingHour) {
        this.closingHour = closingHour;
    }
}
