package com.salesmanager.shop.model.tip;

import java.math.BigDecimal;

public class ReadableOTTipRate extends ReadableTipRate {

	private static final long serialVersionUID = -4394229159067126822L;

	private String total;
	private BigDecimal value;
	private boolean customTip;

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
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
