package com.salesmanager.shop.model.tip;

import java.io.Serializable;
import java.math.BigDecimal;

public class CustomerTipEntity implements Serializable {

	private static final long serialVersionUID = -7911706276885125319L;

	private BigDecimal tipAmount;
	private PersistableCustomerTipType type;

	public BigDecimal getTipAmount() {
		return tipAmount;
	}

	public void setTipAmount(BigDecimal tipAmount) {
		this.tipAmount = tipAmount;
	}

	public PersistableCustomerTipType getType() {
		return type;
	}

	public void setType(PersistableCustomerTipType type) {
		this.type = type;
	}

}
