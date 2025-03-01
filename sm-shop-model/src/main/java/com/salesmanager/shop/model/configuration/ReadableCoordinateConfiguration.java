package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.coordinate.ReadableStoreCoordinate;

public class ReadableCoordinateConfiguration extends CoordinateConfigurationEntity {

    private static final long serialVersionUID = -8123874452962770408L;

    private ReadableStoreCoordinate coordinate;

    public ReadableStoreCoordinate getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(ReadableStoreCoordinate coordinate) {
        this.coordinate = coordinate;
    }

}
