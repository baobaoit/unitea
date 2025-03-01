package com.salesmanager.shop.store.facade.order.notification;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.inject.Inject;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.order.ordernotification.OrderNotificationService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.order.notification.OrderNotification;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.order.notification.ReadableOrderNotificationMapper;
import com.salesmanager.shop.model.order.v1.notification.PersistableOrderNotification;
import com.salesmanager.shop.model.order.v1.notification.ReadableOrderNotification;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.controller.order.notification.facade.OrderNotificationFacade;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

@Service("orderNotificationFacade")
public class OrderNotificationFacadeImpl implements OrderNotificationFacade {
  @Inject private OrderNotificationService orderNotificationService;

  @Inject private ReadableOrderNotificationMapper readableOrderNotificationMapper;

  @Override
  public void create(Order order) throws ServiceException {
    if (order == null) {
      throw new ResourceNotFoundException("Resource order not found");
    }

    OrderNotification orderNotification = new OrderNotification();
    orderNotification.setOrder(order);

    orderNotificationService.save(orderNotification);
  }

  @Override
  public List<ReadableOrderNotification> getLatestOrder(MerchantStore store, Language language) {
    List<OrderNotification> latestOrders = orderNotificationService.getLatest(store);

    return latestOrders.stream()
        .map(source -> readableOrderNotificationMapper.convert(source, store, language))
        .collect(Collectors.toList());
  }

  @Override
  public void remove(
      PersistableOrderNotification orderNotification, MerchantStore store, Language language) {
    if (orderNotification == null || CollectionUtils.isEmpty(orderNotification.getOrderIds())) {
      return;
    }

    List<Long> orderIds =
        orderNotification.getOrderIds().stream()
            .filter(Objects::nonNull)
            .collect(Collectors.toList());

    orderNotificationService.remove(orderIds, store);
  }
}
