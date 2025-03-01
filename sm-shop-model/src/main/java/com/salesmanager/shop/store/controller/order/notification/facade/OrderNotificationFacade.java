package com.salesmanager.shop.store.controller.order.notification.facade;

import java.util.List;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.order.v1.notification.PersistableOrderNotification;
import com.salesmanager.shop.model.order.v1.notification.ReadableOrderNotification;

public interface OrderNotificationFacade {
  void create(Order order) throws ServiceException;

  List<ReadableOrderNotification> getLatestOrder(MerchantStore store, Language language);

  void remove(
      PersistableOrderNotification orderNotification, MerchantStore store, Language language);
}
