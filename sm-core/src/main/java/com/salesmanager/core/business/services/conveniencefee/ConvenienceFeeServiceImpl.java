package com.salesmanager.core.business.services.conveniencefee;

import static com.salesmanager.core.business.constants.Constants.CONVENIENCE_FEE;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.system.MerchantConfigurationRepository;
import com.salesmanager.core.model.conveniencefee.ConvenienceFeeConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.MerchantConfiguration;
import java.math.BigDecimal;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service("convenienceFeeService")
public class ConvenienceFeeServiceImpl implements ConvenienceFeeService {
  @Inject private MerchantConfigurationRepository merchantConfigurationRepository;

  @Override
  public ConvenienceFeeConfiguration getConfiguration(MerchantStore store) throws ServiceException {
    MerchantConfiguration configuration =
        merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), CONVENIENCE_FEE);
    ConvenienceFeeConfiguration convenienceFeeConfiguration = new ConvenienceFeeConfiguration();

    if (configuration != null) {
      String value = configuration.getValue();
      ObjectMapper mapper = new ObjectMapper();

      try {
        convenienceFeeConfiguration = mapper.readValue(value, ConvenienceFeeConfiguration.class);
      } catch (Exception e) {
        throw new ServiceException("Cannot parse json string " + value);
      }
    }

    return convenienceFeeConfiguration;
  }

  @Override
  public void saveConfiguration(
      ConvenienceFeeConfiguration convenienceFeeConfiguration, MerchantStore store)
      throws ServiceException {

    MerchantConfiguration configuration =
        merchantConfigurationRepository.findByMerchantStoreAndKey(store.getId(), CONVENIENCE_FEE);

    if (configuration == null) {
      configuration = new MerchantConfiguration();
      configuration.setMerchantStore(store);
      configuration.setKey(CONVENIENCE_FEE);
    }

    String value = convenienceFeeConfiguration.toJSONString();
    configuration.setValue(value);
    merchantConfigurationRepository.saveAndFlush(configuration);
  }

  @Override
  public BigDecimal getConvenienceFee(MerchantStore store) throws ServiceException {
    ConvenienceFeeConfiguration convenienceFeeConfiguration = getConfiguration(store);
    BigDecimal convenienceFee = null;

    if (convenienceFeeConfiguration.isEnabled()) {
      convenienceFee = convenienceFeeConfiguration.getConvenienceFee();
    }

    return convenienceFee;
  }
}
