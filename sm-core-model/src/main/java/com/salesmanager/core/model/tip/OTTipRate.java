package com.salesmanager.core.model.tip;

import java.io.Serializable;
import java.math.BigDecimal;

public class OTTipRate implements Serializable {

	private static final long serialVersionUID = 7806011305047381346L;

	private BigDecimal percentage;
	private boolean activated;
	private BigDecimal value;
	private boolean customTip;

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

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public boolean isCustomTip() {
		return customTip;
	}

	public void setCustomTip(boolean customTip) {
		this.customTip = customTip;
	}
}
