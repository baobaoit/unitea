package com.salesmanager.shop.model.tip;

import com.salesmanager.shop.model.entity.ReadableList;

import java.util.List;

public class ReadableOrderTipList extends ReadableList {

	private static final long serialVersionUID = 4667145205159304125L;

	private String totalTipAmount;
	private List<ReadableOrderTip> orderTips;

	public List<ReadableOrderTip> getOrderTips() {
		return orderTips;
	}

	public void setOrderTips(List<ReadableOrderTip> orderTips) {
		this.orderTips = orderTips;
	}

	public String getTotalTipAmount() {
		return totalTipAmount;
	}

	public void setTotalTipAmount(String totalTipAmount) {
		this.totalTipAmount = totalTipAmount;
	}
}
