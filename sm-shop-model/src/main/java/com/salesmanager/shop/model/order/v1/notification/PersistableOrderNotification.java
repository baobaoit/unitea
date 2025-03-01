package com.salesmanager.shop.model.order.v1.notification;

import java.util.List;

public class PersistableOrderNotification extends OrderNotificationEntity {
  private static final long serialVersionUID = -5398106728598409486L;

  private List<Long> orderIds;

  public List<Long> getOrderIds() {
    return orderIds;
  }

  public void setOrderIds(List<Long> orderIds) {
    this.orderIds = orderIds;
  }
}
