package com.salesmanager.shop.model.order.v1.notification;

public class ReadableOrderNotification extends OrderNotificationEntity {
  private static final long serialVersionUID = 2768096903279906906L;

  private Long id;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }
}
