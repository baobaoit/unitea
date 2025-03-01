package com.salesmanager.core.business.services.conveniencefee;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.conveniencefee.ConvenienceFeeConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;
import java.math.BigDecimal;

public interface ConvenienceFeeService {
  /**
   * Retrieves convenience fee configurations (ConvenienceFeeConfiguration) for a given
   * MerchantStore
   *
   * @param store
   * @return
   * @throws ServiceException
   */
  ConvenienceFeeConfiguration getConfiguration(MerchantStore store) throws ServiceException;

  /**
   * Saves ConvenienceFeeConfiguration to MerchantConfiguration table
   *
   * @param convenienceFeeConfiguration
   * @param store
   * @throws ServiceException
   */
  void saveConfiguration(
      ConvenienceFeeConfiguration convenienceFeeConfiguration, MerchantStore store)
      throws ServiceException;

  /**
   * Get convenience fee of {@code store}
   *
   * @param store
   * @return
   * @throws ServiceException
   */
  BigDecimal getConvenienceFee(MerchantStore store) throws ServiceException;
}
