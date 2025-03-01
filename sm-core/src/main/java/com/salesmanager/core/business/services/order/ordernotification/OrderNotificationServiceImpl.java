package com.salesmanager.core.business.services.order.ordernotification;

import java.util.List;

import javax.inject.Inject;

import com.salesmanager.core.business.repositories.order.ordernotification.OrderNotificationRepository;
import com.salesmanager.core.business.services.common.generic.SalesManagerEntityServiceImpl;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.notification.OrderNotification;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

@Service("orderNotificationService")
public class OrderNotificationServiceImpl
    extends SalesManagerEntityServiceImpl<Long, OrderNotification>
    implements OrderNotificationService {

  private final OrderNotificationRepository orderNotificationRepository;

  @Inject
  public OrderNotificationServiceImpl(OrderNotificationRepository orderNotificationRepository) {
    super(orderNotificationRepository);
    this.orderNotificationRepository = orderNotificationRepository;
  }

  @Override
  public List<OrderNotification> getLatest(MerchantStore store) {
    return orderNotificationRepository.findAllOrderByDatePurchasedAsc(store.getId());
  }

  @Override
  public void remove(List<Long> orderIds, MerchantStore store) {
    List<OrderNotification> orderNotifications =
        orderNotificationRepository.findByIdInAndOrder_Merchant_Id(orderIds, store.getId());

    if (CollectionUtils.isNotEmpty(orderNotifications)) {
      orderNotificationRepository.deleteAll(orderNotifications);
    }
  }
}
