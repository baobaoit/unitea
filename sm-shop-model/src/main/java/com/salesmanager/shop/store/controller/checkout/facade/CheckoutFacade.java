package com.salesmanager.shop.store.controller.checkout.facade;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.shop.model.configuration.ReadableBusinessTimeConfiguration;
import com.salesmanager.shop.model.order.v1.checkout.ReadableCheckoutInformation;

public interface CheckoutFacade {
  /**
   * Check if the order time is working hours and payment method is enable.
   *
   * @param businessTimeConfiguration
   * @param store
   * @return
   */
  ReadableCheckoutInformation enableCheckoutProcesses(
      ReadableBusinessTimeConfiguration businessTimeConfiguration, MerchantStore store);
}
