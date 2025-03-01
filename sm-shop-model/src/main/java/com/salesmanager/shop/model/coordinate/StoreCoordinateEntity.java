package com.salesmanager.shop.model.coordinate;

import java.io.Serializable;

public class StoreCoordinateEntity implements Serializable {

    private static final long serialVersionUID = 6208925691341335581L;

    private double latitude;
    private double longitude;

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
