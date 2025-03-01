package com.salesmanager.shop.mapper.coordinate;

import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.coordinate.StoreCoordinate;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.configuration.ReadableCoordinateConfiguration;
import com.salesmanager.shop.model.coordinate.ReadableStoreCoordinate;
import org.springframework.stereotype.Component;

@Component
public class ReadableCoordinateConfigurationMapper implements Mapper<CoordinateConfiguration, ReadableCoordinateConfiguration> {
    @Override
    public ReadableCoordinateConfiguration convert(CoordinateConfiguration source, MerchantStore store, Language language) {
        return merge(source, null, store, language);
    }

    @Override
    public ReadableCoordinateConfiguration merge(CoordinateConfiguration source, ReadableCoordinateConfiguration destination, MerchantStore store, Language language) {
        if (destination == null) {
            destination = new ReadableCoordinateConfiguration();
        }

        destination.setCoordinate(convertToReadableHCoordinate(source.getCoordinate()));

        return destination;
    }

    private ReadableStoreCoordinate convertToReadableHCoordinate(StoreCoordinate coordinate) {
        if (coordinate == null) {
            return null;
        }

        ReadableStoreCoordinate readableHCoordinate = new ReadableStoreCoordinate();
        readableHCoordinate.setLatitude(coordinate.getLatitude());
        readableHCoordinate.setLongitude(coordinate.getLongitude());

        return readableHCoordinate;
    }
}
