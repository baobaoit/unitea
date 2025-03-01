package com.salesmanager.core.model.coordinate;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

/**
 * The store's coordinate configuration is saved in MerchantConfiguration.
 *
 * @author Bao Le
 */
public class CoordinateConfiguration implements JSONAware {

    private StoreCoordinate coordinate = new StoreCoordinate();

    @SuppressWarnings("unchecked")
    @Override
    public String toJSONString() {
        JSONObject data = new JSONObject();
        data.put("coordinate", coordinate);

        return data.toJSONString();
    }

    public StoreCoordinate getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(StoreCoordinate coordinate) {
        this.coordinate = coordinate;
    }

}
