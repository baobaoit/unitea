package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.tip.ReadableTipRate;

import java.util.List;

public class ReadableTipConfiguration extends TipConfigurationEntity {

	private static final long serialVersionUID = 5606718722877897504L;

	private List<ReadableTipRate> tipRates;

	public List<ReadableTipRate> getTipRates() {
		return tipRates;
	}

	public void setTipRates(List<ReadableTipRate> tipRates) {
		this.tipRates = tipRates;
	}
}
