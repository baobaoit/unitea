package com.salesmanager.core.business.services.coordinate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.system.MerchantConfigurationRepository;
import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.MerchantConfiguration;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

import static com.salesmanager.core.business.constants.Constants.COORDINATE_CONFIG;

@Service("coordinateService")
public class CoordinateServiceImpl implements CoordinateService {

    @Inject
    private MerchantConfigurationRepository merchantConfigurationRepository;

    @Override
    public CoordinateConfiguration getConfiguration(MerchantStore store) throws ServiceException {

        MerchantConfiguration configuration = merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), COORDINATE_CONFIG);
        CoordinateConfiguration coordinateConfiguration = new CoordinateConfiguration();
        if (configuration != null) {
            String value = configuration.getValue();

            ObjectMapper mapper = new ObjectMapper();
            try {
                coordinateConfiguration = mapper.readValue(value, CoordinateConfiguration.class);
            } catch(Exception e) {
                throw new ServiceException("Cannot parse json string " + value);
            }
        }

        return coordinateConfiguration;
    }

    @Override
    public void saveConfiguration(CoordinateConfiguration coordinateConfiguration, MerchantStore store) throws ServiceException {

        MerchantConfiguration configuration = merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), COORDINATE_CONFIG);

        if (configuration == null) {
            configuration = new MerchantConfiguration();
            configuration.setMerchantStore(store);
            configuration.setKey(COORDINATE_CONFIG);
        }

        String value = coordinateConfiguration.toJSONString();
        configuration.setValue(value);
        merchantConfigurationRepository.saveAndFlush(configuration);

    }

}
