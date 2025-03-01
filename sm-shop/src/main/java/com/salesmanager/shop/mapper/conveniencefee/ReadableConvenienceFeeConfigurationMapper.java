package com.salesmanager.shop.mapper.conveniencefee;

import com.salesmanager.core.model.conveniencefee.ConvenienceFeeConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.configuration.ReadableConvenienceFeeConfiguration;
import org.springframework.stereotype.Component;

@Component
public class ReadableConvenienceFeeConfigurationMapper
    implements Mapper<ConvenienceFeeConfiguration, ReadableConvenienceFeeConfiguration> {

  @Override
  public ReadableConvenienceFeeConfiguration convert(
      ConvenienceFeeConfiguration source, MerchantStore store, Language language) {

    return merge(source, null, store, language);
  }

  @Override
  public ReadableConvenienceFeeConfiguration merge(
      ConvenienceFeeConfiguration source,
      ReadableConvenienceFeeConfiguration destination,
      MerchantStore store,
      Language language) {

    if (destination == null) {
      destination = new ReadableConvenienceFeeConfiguration();
    }

    destination.setEnabled(source.isEnabled());
    destination.setConvenienceFee(source.getConvenienceFee());

    return destination;
  }
}
