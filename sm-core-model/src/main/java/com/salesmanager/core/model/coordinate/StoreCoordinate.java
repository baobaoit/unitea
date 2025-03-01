package com.salesmanager.core.model.coordinate;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class StoreCoordinate implements JSONAware {
    private double latitude;
    private double longitude;

    @SuppressWarnings("unchecked")
    @Override
    public String toJSONString() {
        JSONObject data = new JSONObject();
        data.put("latitude", latitude);
        data.put("longitude", longitude);

        return data.toJSONString();
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

}
