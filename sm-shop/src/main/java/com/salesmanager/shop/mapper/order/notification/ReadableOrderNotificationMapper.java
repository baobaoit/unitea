package com.salesmanager.shop.mapper.order.notification;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.notification.OrderNotification;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.order.v1.notification.ReadableOrderNotification;

import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

@Component
public class ReadableOrderNotificationMapper
    implements Mapper<OrderNotification, ReadableOrderNotification> {

  @Override
  public ReadableOrderNotification convert(
      OrderNotification source, MerchantStore store, Language language) {

    ReadableOrderNotification destination = new ReadableOrderNotification();
    return merge(source, destination, store, language);
  }

  @Override
  public ReadableOrderNotification merge(
      OrderNotification source,
      ReadableOrderNotification destination,
      MerchantStore store,
      Language language) {

    Validate.notNull(source, "OrderNotification cannot be null");
    Validate.notNull(destination, "ReadableOrderNotification cannot be null");

    destination.setId(source.getId());

    return destination;
  }
}
