package com.salesmanager.shop.mapper.tax;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.TaxConfiguration;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.configuration.ReadableTaxConfiguration;
import com.salesmanager.shop.model.configuration.TaxBasis;
import org.springframework.stereotype.Component;

@Component
public class ReadableTaxConfigurationMapper implements Mapper<TaxConfiguration, ReadableTaxConfiguration> {
	@Override
	public ReadableTaxConfiguration convert(TaxConfiguration source, MerchantStore store, Language language) {
		ReadableTaxConfiguration taxConfiguration = new ReadableTaxConfiguration();
		taxConfiguration.setTaxBasis(TaxBasis.valueOf(source.getTaxBasisCalculation().name()));

		return taxConfiguration;
	}

	@Override
	public ReadableTaxConfiguration merge(TaxConfiguration source, ReadableTaxConfiguration destination, MerchantStore store, Language language) {
		if (destination == null) {
			destination = new ReadableTaxConfiguration();
		}

		destination.setTaxBasis(TaxBasis.valueOf(source.getTaxBasisCalculation().name()));

		return destination;
	}
}
