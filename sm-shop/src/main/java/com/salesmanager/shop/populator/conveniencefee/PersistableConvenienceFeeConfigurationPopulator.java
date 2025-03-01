package com.salesmanager.shop.populator.conveniencefee;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.conveniencefee.ConvenienceFeeConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.configuration.PersistableConvenienceFeeConfiguration;
import java.math.BigDecimal;
import java.math.RoundingMode;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

@Component
public class PersistableConvenienceFeeConfigurationPopulator
    extends AbstractDataPopulator<
        PersistableConvenienceFeeConfiguration, ConvenienceFeeConfiguration> {

  @Override
  protected ConvenienceFeeConfiguration createTarget() {
    return null;
  }

  @Override
  public ConvenienceFeeConfiguration populate(
      PersistableConvenienceFeeConfiguration source,
      ConvenienceFeeConfiguration target,
      MerchantStore store,
      Language language)
      throws ConversionException {

    Validate.notNull(target, "Convenience fee configuration must not be null");
    Validate.notNull(source, "PersistableConvenienceFeeConfiguration must not be null");

    try {
      target.setEnabled(source.isEnabled());

      BigDecimal convenienceFee = source.getConvenienceFee();
      if (convenienceFee == null || convenienceFee.compareTo(BigDecimal.ZERO) < 0) {
        throw new ConversionException("Convenience fee must be positive");
      }
      convenienceFee = convenienceFee.setScale(2, RoundingMode.HALF_UP);
      target.setConvenienceFee(convenienceFee);

      return target;
    } catch (Exception e) {
      throw new ConversionException(e.getMessage());
    }
  }
}
