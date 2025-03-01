package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.coordinate.PersistableStoreCoordinate;

public class PersistableCoordinateConfiguration extends CoordinateConfigurationEntity {

    private static final long serialVersionUID = -8793008504333013790L;

    private PersistableStoreCoordinate coordinate;

    public PersistableStoreCoordinate getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(PersistableStoreCoordinate coordinate) {
        this.coordinate = coordinate;
    }

}
