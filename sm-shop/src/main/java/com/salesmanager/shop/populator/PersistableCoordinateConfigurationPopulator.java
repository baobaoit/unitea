package com.salesmanager.shop.populator;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.coordinate.StoreCoordinate;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.configuration.PersistableCoordinateConfiguration;
import com.salesmanager.shop.model.coordinate.PersistableStoreCoordinate;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

@Component
public class PersistableCoordinateConfigurationPopulator extends
        AbstractDataPopulator<PersistableCoordinateConfiguration, CoordinateConfiguration> {

    @Override
    protected CoordinateConfiguration createTarget() {
        return null;
    }

    @Override
    public CoordinateConfiguration populate(PersistableCoordinateConfiguration source,
                                            CoordinateConfiguration target,
                                            MerchantStore store, Language language) throws ConversionException {

        Validate.notNull(target,"Coordinate configuration must not be null");
        Validate.notNull(source,"PersistableCoordinateConfiguration must not be null");
        Validate.notNull(source.getCoordinate(),"Coordinate must not be null");

        try {

            target.setCoordinate(convertToHCoordinate(source.getCoordinate()));

            return target;

        } catch (Exception e) {
            throw new ConversionException(e.getMessage());
        }
    }

    private StoreCoordinate convertToHCoordinate(PersistableStoreCoordinate persistableHCoordinate) {
        StoreCoordinate coordinate = new StoreCoordinate();
        coordinate.setLatitude(persistableHCoordinate.getLatitude());
        coordinate.setLongitude(persistableHCoordinate.getLongitude());

        return coordinate;
    }
}
