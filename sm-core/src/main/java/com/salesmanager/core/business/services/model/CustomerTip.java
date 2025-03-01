package com.salesmanager.core.business.services.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class CustomerTip implements Serializable {

	private static final long serialVersionUID = -2551584392142657853L;

	private BigDecimal tipAmount;
	private CustomerTipType type;

	public BigDecimal getTipAmount() {
		return tipAmount;
	}

	public void setTipAmount(BigDecimal tipAmount) {
		this.tipAmount = tipAmount;
	}

	public CustomerTipType getType() {
		return type;
	}

	public void setType(CustomerTipType type) {
		this.type = type;
	}
}
