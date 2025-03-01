package com.salesmanager.shop.model.order.total;

import java.math.BigDecimal;

public class ReadableOTTaxRate extends ReadableOrderTotal {

	private static final long serialVersionUID = -1835628913818109696L;

	private BigDecimal taxRate;

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}
}
