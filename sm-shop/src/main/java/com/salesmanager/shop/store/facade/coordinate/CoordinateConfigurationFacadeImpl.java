package com.salesmanager.shop.store.facade.coordinate;

import com.salesmanager.core.business.services.coordinate.CoordinateService;
import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.coordinate.ReadableCoordinateConfigurationMapper;
import com.salesmanager.shop.model.configuration.PersistableCoordinateConfiguration;
import com.salesmanager.shop.model.configuration.ReadableCoordinateConfiguration;
import com.salesmanager.shop.populator.PersistableCoordinateConfigurationPopulator;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.configurations.CoordinateConfigurationFacade;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service("coordinateConfigurationFacade")
public class CoordinateConfigurationFacadeImpl implements CoordinateConfigurationFacade {

    @Inject
    private CoordinateService coordinateService;

    @Inject
    private ReadableCoordinateConfigurationMapper readableCoordinateConfigurationMapper;

    @Inject
    private PersistableCoordinateConfigurationPopulator persistableCoordinateConfigurationPopulator;

    @Override
    public ReadableCoordinateConfiguration getConfiguration(MerchantStore store, Language language) {
        try {

            ReadableCoordinateConfiguration config = new ReadableCoordinateConfiguration();
            CoordinateConfiguration coordinateConfiguration = coordinateService.getConfiguration(store);

            config = readableCoordinateConfigurationMapper.merge(coordinateConfiguration, config, store, language);

            return config;

        } catch (Exception e) {
            throw new ServiceRuntimeException("Error while getting coordinate configuration", e);
        }
    }

    @Override
    public ReadableCoordinateConfiguration saveConfiguration(PersistableCoordinateConfiguration coordinateConfiguration,
                                                             MerchantStore store, Language language) {

        try {

            CoordinateConfiguration coordinateConfigurationModel = coordinateService.getConfiguration(store);
            if (coordinateConfigurationModel == null) {
                coordinateConfigurationModel = new CoordinateConfiguration();
            }

            persistableCoordinateConfigurationPopulator.populate(coordinateConfiguration, coordinateConfigurationModel,
                    store, language);
            coordinateService.saveConfiguration(coordinateConfigurationModel, store);

            return readableCoordinateConfigurationMapper.convert(coordinateConfigurationModel, store, language);

        } catch (Exception e) {
            throw new ServiceRuntimeException(String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
        }
    }

}
