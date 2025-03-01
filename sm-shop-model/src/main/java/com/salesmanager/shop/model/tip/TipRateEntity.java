package com.salesmanager.shop.model.tip;

import java.io.Serializable;
import java.math.BigDecimal;

public class TipRateEntity implements Serializable {

	private static final long serialVersionUID = -7506723728813790606L;

	private BigDecimal percentage;
	private boolean activated = false;

	public BigDecimal getPercentage() {
		return percentage;
	}

	public void setPercentage(BigDecimal percentage) {
		this.percentage = percentage;
	}

	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}
}
