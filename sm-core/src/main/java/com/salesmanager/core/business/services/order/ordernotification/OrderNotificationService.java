package com.salesmanager.core.business.services.order.ordernotification;

import java.util.List;

import com.salesmanager.core.business.services.common.generic.SalesManagerEntityService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.notification.OrderNotification;

public interface OrderNotificationService
    extends SalesManagerEntityService<Long, OrderNotification> {

  List<OrderNotification> getLatest(MerchantStore store);

  void remove(List<Long> orderIds, MerchantStore store);
}
