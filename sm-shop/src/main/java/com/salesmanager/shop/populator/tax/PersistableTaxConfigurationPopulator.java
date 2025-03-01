package com.salesmanager.shop.populator.tax;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.TaxBasisCalculation;
import com.salesmanager.core.model.tax.TaxConfiguration;
import com.salesmanager.shop.model.configuration.PersistableTaxConfiguration;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

@Component
public class PersistableTaxConfigurationPopulator extends
		AbstractDataPopulator<PersistableTaxConfiguration, TaxConfiguration> {

	@Override
	protected TaxConfiguration createTarget() {
		return null;
	}

	@Override
	public TaxConfiguration populate(PersistableTaxConfiguration source,
									 TaxConfiguration target,
									 MerchantStore store, Language language) throws ConversionException {

		Validate.notNull(target,"Tax configuration must not be null");

		try {

			target.setTaxBasisCalculation(TaxBasisCalculation.valueOf(source.getTaxBasis().name()));

			return target;

		} catch (Exception e) {
			throw new ConversionException(e);
		}
	}
}
