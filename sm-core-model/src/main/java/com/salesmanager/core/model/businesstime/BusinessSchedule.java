package com.salesmanager.core.model.businesstime;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class BusinessSchedule implements JSONAware {

    private String day = String.valueOf(DayOfWeek.MONDAY);

    private String openingHour = LocalTime.parse("07:00 AM", DateTimeFormatter.ofPattern("hh:mm a")).toString();

    private String closingHour = LocalTime.parse("11:45 PM", DateTimeFormatter.ofPattern("hh:mm a")).toString();

    private boolean enabled;

    @SuppressWarnings("unchecked")
    @Override
    public String toJSONString() {
        JSONObject data = new JSONObject();
        data.put("day", day);
        data.put("openingHour", openingHour);
        data.put("closingHour", closingHour);
        data.put("enabled", enabled);
        return data.toJSONString();
    }


    public String getDay() {
        return day;
    }
    public void setDay(String day) {
        this.day = day;
    }
    public String getOpeningHour() {
        return openingHour;
    }
    public void setOpeningHour(String openingHour) {
        this.openingHour = openingHour;
    }
    public String getClosingHour() {
        return closingHour;
    }
    public void setClosingHour(String closingHour) {
        this.closingHour = closingHour;
    }
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
