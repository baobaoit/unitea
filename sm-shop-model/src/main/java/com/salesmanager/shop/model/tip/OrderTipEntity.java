package com.salesmanager.shop.model.tip;

import java.io.Serializable;

public class OrderTipEntity implements Serializable {

	private static final long serialVersionUID = 90689977242597521L;

	private Long orderId;
	private String datePurchased;
	private String totalAmount;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getDatePurchased() {
		return datePurchased;
	}

	public void setDatePurchased(String datePurchased) {
		this.datePurchased = datePurchased;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

}
