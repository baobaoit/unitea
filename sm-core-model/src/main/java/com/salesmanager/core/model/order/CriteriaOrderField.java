package com.salesmanager.core.model.order;

public enum CriteriaOrderField {
	DATE("datePurchased"),
	ID("id"),
	PAYMENT_TYPE("paymentType"),
	STATUS("status"),
	TOTAL("total"),
	;

	private final String value;

	CriteriaOrderField(String value) {
		this.value = value;
	}

	public String value() {
		return value;
	}
}
