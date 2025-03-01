package com.salesmanager.shop.model.tip;

public class ReadableOrderTip extends OrderTipEntity {

	private static final long serialVersionUID = -3020398353429517921L;

	private String tipAmount;

	public String getTipAmount() {
		return tipAmount;
	}

	public void setTipAmount(String tipAmount) {
		this.tipAmount = tipAmount;
	}

}
