package com.salesmanager.shop.store.facade.conveniencefee;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.conveniencefee.ConvenienceFeeService;
import com.salesmanager.core.model.conveniencefee.ConvenienceFeeConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.conveniencefee.ReadableConvenienceFeeConfigurationMapper;
import com.salesmanager.shop.model.configuration.PersistableConvenienceFeeConfiguration;
import com.salesmanager.shop.model.configuration.ReadableConvenienceFeeConfiguration;
import com.salesmanager.shop.populator.conveniencefee.PersistableConvenienceFeeConfigurationPopulator;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.configurations.ConvenienceFeeConfigurationFacade;
import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service("convenienceFeeConfigurationFacade")
public class ConvenienceFeeConfigurationFacadeImpl implements ConvenienceFeeConfigurationFacade {
  @Inject private ConvenienceFeeService convenienceFeeService;

  @Inject
  private ReadableConvenienceFeeConfigurationMapper readableConvenienceFeeConfigurationMapper;

  @Inject
  private PersistableConvenienceFeeConfigurationPopulator
      persistableConvenienceFeeConfigurationPopulator;

  @Override
  public ReadableConvenienceFeeConfiguration getConfiguration(
      MerchantStore store, Language language) {

    try {
      ReadableConvenienceFeeConfiguration config = new ReadableConvenienceFeeConfiguration();
      ConvenienceFeeConfiguration convenienceFeeConfiguration =
          convenienceFeeService.getConfiguration(store);
      config =
          readableConvenienceFeeConfigurationMapper.merge(
              convenienceFeeConfiguration, config, store, language);
      return config;

    } catch (ServiceException e) {
      throw new ServiceRuntimeException("Error while getting convenience fee configuration", e);
    }
  }

  @Override
  public ReadableConvenienceFeeConfiguration saveConfiguration(
      PersistableConvenienceFeeConfiguration convenienceFeeConfiguration,
      MerchantStore store,
      Language language) {

    try {
      ConvenienceFeeConfiguration convenienceFeeConfigurationModel =
          convenienceFeeService.getConfiguration(store);
      if (convenienceFeeConfigurationModel == null) {
        convenienceFeeConfigurationModel = new ConvenienceFeeConfiguration();
      }

      persistableConvenienceFeeConfigurationPopulator.populate(
          convenienceFeeConfiguration, convenienceFeeConfigurationModel, store, language);
      convenienceFeeService.saveConfiguration(convenienceFeeConfigurationModel, store);

      return readableConvenienceFeeConfigurationMapper.convert(
          convenienceFeeConfigurationModel, store, language);
    } catch (Exception e) {
      throw new ServiceRuntimeException(
          String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
    }
  }
}
