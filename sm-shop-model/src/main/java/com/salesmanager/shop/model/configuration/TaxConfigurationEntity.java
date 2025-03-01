package com.salesmanager.shop.model.configuration;

import java.io.Serializable;

public class TaxConfigurationEntity implements Serializable {

	private static final long serialVersionUID = 483511361069893864L;

	private TaxBasis taxBasis = TaxBasis.SHIPPINGADDRESS;

	public TaxBasis getTaxBasis() {
		return taxBasis;
	}

	public void setTaxBasis(TaxBasis taxBasis) {
		this.taxBasis = taxBasis;
	}
}
