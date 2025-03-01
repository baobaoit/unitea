package com.salesmanager.core.model.tip;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import java.math.BigDecimal;

public class TipRate implements JSONAware {

	private BigDecimal percentage;
	private boolean defaultTipRate = false;

	public static final TipRate NONE = new TipRate(0);

	@SuppressWarnings("unchecked")
	@Override
	public String toJSONString() {
		JSONObject data = new JSONObject();
		data.put("percentage", percentage);
		data.put("defaultTipRate", defaultTipRate);

		return data.toJSONString();
	}

	public TipRate() {
	}

	public TipRate(int percentage) {
		this.percentage = new BigDecimal(percentage);
	}

	public BigDecimal getPercentage() {
		return percentage;
	}

	public void setPercentage(BigDecimal percentage) {
		this.percentage = percentage;
	}

	public boolean isDefaultTipRate() {
		return defaultTipRate;
	}

	public void setDefaultTipRate(boolean defaultTipRate) {
		this.defaultTipRate = defaultTipRate;
	}
}
