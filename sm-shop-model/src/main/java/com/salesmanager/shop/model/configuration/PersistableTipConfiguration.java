package com.salesmanager.shop.model.configuration;

import com.salesmanager.shop.model.tip.PersistableTipRate;

import java.util.Set;

public class PersistableTipConfiguration extends TipConfigurationEntity {

	private static final long serialVersionUID = -477942806997230891L;

	private Set<PersistableTipRate> tipRates;

	public Set<PersistableTipRate> getTipRates() {
		return tipRates;
	}

	public void setTipRates(Set<PersistableTipRate> tipRates) {
		this.tipRates = tipRates;
	}
}
