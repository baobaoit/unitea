package com.salesmanager.shop.model.tip;

import java.math.BigDecimal;
import java.util.Objects;

public class PersistableTipRate extends TipRateEntity {

	private static final long serialVersionUID = 506301935747075856L;

	public PersistableTipRate() {
		this.setPercentage(BigDecimal.ZERO);
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		PersistableTipRate tipRate = (PersistableTipRate) o;
		return this.getPercentage().equals(tipRate.getPercentage());
	}

	@Override
	public int hashCode() {
		return Objects.hash(this.getPercentage());
	}
}
