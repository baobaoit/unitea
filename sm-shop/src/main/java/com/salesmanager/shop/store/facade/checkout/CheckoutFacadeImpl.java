package com.salesmanager.shop.store.facade.checkout;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.payments.PaymentService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.IntegrationConfiguration;
import com.salesmanager.shop.model.businesstime.ReadableBusinessSchedule;
import com.salesmanager.shop.model.configuration.ReadableBusinessTimeConfiguration;
import com.salesmanager.shop.model.order.v1.checkout.CIType;
import com.salesmanager.shop.model.order.v1.checkout.ReadableCheckoutInformation;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.checkout.facade.CheckoutFacade;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service("checkoutFacade")
public class CheckoutFacadeImpl implements CheckoutFacade {
  private static final String BUSINESS_TIME_FORMAT = "hh:mm a";
  private static final String STRIPE_MODULE_CODE = "stripe";

  @Inject private PaymentService paymentService;

  @Override
  public ReadableCheckoutInformation enableCheckoutProcesses(
      ReadableBusinessTimeConfiguration businessTimeConfiguration, MerchantStore store) {

    try {
      String timeZone = businessTimeConfiguration.getTimeZone();
      if (StringUtils.isEmpty(timeZone)) {
        throw new ServiceException("Please contact the administrator to update store coordinates.");
      }

      IntegrationConfiguration integrationConfiguration =
          paymentService.getPaymentConfiguration(STRIPE_MODULE_CODE, store);
      List<CIType> types = new ArrayList<>();

      boolean isPaymentEnabled = Optional.ofNullable(integrationConfiguration)
        .map(IntegrationConfiguration::isActive).orElse(Boolean.FALSE);
      if (!isPaymentEnabled) {
        types.add(CIType.PAYMENT_NOT_SUPPORT);
      }

      boolean isInBusinessTime = false;
      List<ReadableBusinessSchedule> businessSchedules =
          businessTimeConfiguration.getBusinessSchedules();
      if (CollectionUtils.isNotEmpty(businessSchedules)) {
        ZoneId zoneId = ZoneId.of(timeZone);
        DayOfWeek currentDayOfWeek = LocalDate.now(zoneId).getDayOfWeek();
        LocalTime storeTimeNow = LocalTime.now(zoneId);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(BUSINESS_TIME_FORMAT);

        isInBusinessTime =
            businessSchedules.stream()
                .filter(bs -> bs.isEnabled() && currentDayOfWeek.equals(bs.getDay()))
                .anyMatch(
                    bs -> {
                      LocalTime openingHour = LocalTime.parse(bs.getOpeningHour(), formatter);
                      LocalTime closingHour = LocalTime.parse(bs.getClosingHour(), formatter);

                      return storeTimeNow.isAfter(openingHour)
                          && storeTimeNow.isBefore(closingHour);
                    });

        if (!isInBusinessTime) {
          types.add(CIType.BUSINESS_HOURS_CLOSE);
        }
      }

      ReadableCheckoutInformation checkoutInformation = new ReadableCheckoutInformation();
      checkoutInformation.setEnabled(isPaymentEnabled && isInBusinessTime);
      checkoutInformation.setTypes(
          CollectionUtils.isNotEmpty(types) ? types : Collections.singletonList(CIType.NORMAL));

      return checkoutInformation;
    } catch (ServiceException e) {
      throw new ServiceRuntimeException(e);
    }
  }
}
