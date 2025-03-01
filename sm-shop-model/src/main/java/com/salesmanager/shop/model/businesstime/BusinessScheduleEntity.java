package com.salesmanager.shop.model.businesstime;


import java.io.Serializable;
import java.time.DayOfWeek;
import java.util.Objects;

public class BusinessScheduleEntity implements Serializable {

    private static final long serialVersionUID = -3851168025740233072L;

    private DayOfWeek day;

    private boolean enabled;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BusinessScheduleEntity that = (BusinessScheduleEntity) o;
        return day == that.day;
    }

    @Override
    public int hashCode() {
        return Objects.hash(day);
    }

    public DayOfWeek getDay() {
        return day;
    }
    public void setDay(DayOfWeek day) {
        this.day = day;
    }
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
