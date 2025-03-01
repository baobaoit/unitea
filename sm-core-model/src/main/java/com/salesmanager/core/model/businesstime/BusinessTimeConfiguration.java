package com.salesmanager.core.model.businesstime;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import java.util.Collections;
import java.util.List;

public class BusinessTimeConfiguration implements JSONAware {

    List<BusinessSchedule> businessSchedules = Collections.singletonList(new BusinessSchedule());

    @SuppressWarnings("unchecked")
    @Override
    public String toJSONString() {
        JSONObject data = new JSONObject();
        data.put("businessSchedules", businessSchedules);
        return data.toJSONString();
    }

    public List<BusinessSchedule> getBusinessSchedules() {
        return businessSchedules;
    }
    public void setBusinessSchedules(List<BusinessSchedule> businessSchedules) {
        this.businessSchedules = businessSchedules;
    }
}
