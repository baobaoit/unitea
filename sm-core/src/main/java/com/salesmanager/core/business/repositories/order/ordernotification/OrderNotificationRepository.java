package com.salesmanager.core.business.repositories.order.ordernotification;

import java.util.List;

import com.salesmanager.core.model.order.notification.OrderNotification;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderNotificationRepository extends JpaRepository<OrderNotification, Long> {
  @Query(
      "select odn from OrderNotification odn "
          + "join fetch odn.order o "
          + "join fetch o.orderHistory osh "
          + "join fetch o.merchant om "
          + "where om.id = ?1 "
          + "order by osh.dateAdded asc")
  List<OrderNotification> findAllOrderByDatePurchasedAsc(Integer storeId);

  List<OrderNotification> findByIdInAndOrder_Merchant_Id(List<Long> ids, Integer storeId);
}
