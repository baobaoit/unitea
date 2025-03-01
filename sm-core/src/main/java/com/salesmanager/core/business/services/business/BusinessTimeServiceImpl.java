package com.salesmanager.core.business.services.business;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.system.MerchantConfigurationRepository;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.businesstime.BusinessTimeConfiguration;
import com.salesmanager.core.model.system.MerchantConfiguration;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

import static com.salesmanager.core.business.constants.Constants.BUSINESS_TIME_CONFIG;

@Service("businessTimeService")
public class BusinessTimeServiceImpl implements BusinessTimeService {

    @Inject
    private MerchantConfigurationRepository merchantConfigurationRepository;

    @Override
    public void saveConfiguration(BusinessTimeConfiguration businessTimeConfiguration, MerchantStore store) {
        MerchantConfiguration configuration = merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), BUSINESS_TIME_CONFIG);

        if (configuration == null) {
            configuration = new MerchantConfiguration();
            configuration.setMerchantStore(store);
            configuration.setKey(BUSINESS_TIME_CONFIG);
        }

        String value = businessTimeConfiguration.toJSONString();
        configuration.setValue(value);
        merchantConfigurationRepository.saveAndFlush(configuration);
    }

    @Override
    public BusinessTimeConfiguration getConfiguration(MerchantStore store) throws ServiceException {
        MerchantConfiguration configuration = merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), BUSINESS_TIME_CONFIG);

        BusinessTimeConfiguration businessTimeConfiguration = new BusinessTimeConfiguration();
        if (configuration != null) {
            String value = configuration.getValue();

            ObjectMapper mapper = new ObjectMapper();
            try {
                businessTimeConfiguration = mapper.readValue(value, BusinessTimeConfiguration.class);
            } catch(Exception e) {
                throw new ServiceException("Cannot parse json string " + value);
            }
        }

        return businessTimeConfiguration;
    }


}
