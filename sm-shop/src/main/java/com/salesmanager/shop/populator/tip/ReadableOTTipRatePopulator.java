package com.salesmanager.shop.populator.tip;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tip.OTTipRate;
import com.salesmanager.shop.model.tip.ReadableOTTipRate;
import org.apache.commons.lang3.Validate;

public class ReadableOTTipRatePopulator extends
		AbstractDataPopulator<OTTipRate, ReadableOTTipRate>  {

	private PricingService pricingService;

	@Override
	protected ReadableOTTipRate createTarget() {
		return null;
	}

	@Override
	public ReadableOTTipRate populate(OTTipRate source, ReadableOTTipRate target,
									  MerchantStore store, Language language) throws ConversionException {

		Validate.notNull(pricingService,"PricingService must be set");

		try {

			target.setPercentage(source.getPercentage());
			target.setActivated(source.isActivated());
			target.setValue(source.getValue());
			target.setTotal(pricingService.getDisplayAmount(source.getValue(), store));
			target.setCustomTip(source.isCustomTip());

		} catch(Exception e) {
			throw new ConversionException(e.getMessage());
		}

		return target;
	}

	public void setPricingService(PricingService pricingService) {
		this.pricingService = pricingService;
	}
}
