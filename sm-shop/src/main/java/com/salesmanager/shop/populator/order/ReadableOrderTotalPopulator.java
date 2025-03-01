package com.salesmanager.shop.populator.order;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Locale;

import com.salesmanager.core.business.services.tax.TaxRateDescriptionService;
import com.salesmanager.core.model.tax.taxrate.TaxRate;
import com.salesmanager.core.model.tax.taxrate.TaxRateDescription;
import com.salesmanager.shop.model.order.total.ReadableOTTaxRate;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTotal;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.order.total.ReadableOrderTotal;
import com.salesmanager.shop.utils.LabelUtils;
import com.salesmanager.shop.utils.LocaleUtils;

public class ReadableOrderTotalPopulator extends
		AbstractDataPopulator<OrderTotal, ReadableOrderTotal> {
	
	
	private PricingService pricingService;
	private LabelUtils messages;
	private TaxRateDescriptionService taxRateDescriptionService;




	@Override
	public ReadableOrderTotal populate(OrderTotal source,
			ReadableOrderTotal target, MerchantStore store, Language language)
			throws ConversionException {
		
			Validate.notNull(pricingService,"PricingService must be set");
			Validate.notNull(messages,"LabelUtils must be set");
			Validate.notNull(taxRateDescriptionService, "TaxRateDescriptionService must be set");
			
			Locale locale = LocaleUtils.getLocale(language);
		
			try {
				
				target.setCode(source.getOrderTotalCode());
				target.setId(source.getId());
				target.setModule(source.getModule());
				target.setOrder(source.getSortOrder());
				

				target.setTitle(messages.getMessage(source.getOrderTotalCode(), locale, source.getOrderTotalCode()));
				target.setText(source.getText());
				
				target.setValue(source.getValue());
				target.setTotal(pricingService.getDisplayAmount(source.getValue(), store));
				
				if(!StringUtils.isBlank(source.getOrderTotalCode())) {
					if(Constants.OT_DISCOUNT_TITLE.equals(source.getOrderTotalCode())) {
						target.setDiscounted(true);
					}
				}

				populatorReadableOTTTaxRate(source, target, language);
				
			} catch(Exception e) {
				throw new ConversionException(e);
			}
			
			return target;
		
	}

	private void populatorReadableOTTTaxRate(OrderTotal source, ReadableOrderTotal target, Language language) {
		if (!(target instanceof ReadableOTTaxRate)) {
			return;
		}

		ReadableOTTaxRate taxRateTarget = (ReadableOTTaxRate) target;

		BigDecimal taxRate = taxRateDescriptionService.getTaxRateDescriptionByNameAndLanguage(source.getOrderTotalCode(), language)
				.map(TaxRateDescription::getTaxRate)
				.map(TaxRate::getTaxRate).orElse(BigDecimal.ZERO);
		taxRate.setScale(2, RoundingMode.HALF_UP);

		taxRateTarget.setTaxRate(taxRate);
	}

	@Override
	protected ReadableOrderTotal createTarget() {
		return new ReadableOrderTotal();
	}
	
	public PricingService getPricingService() {
		return pricingService;
	}

	public void setPricingService(PricingService pricingService) {
		this.pricingService = pricingService;
	}
	
	public LabelUtils getMessages() {
		return messages;
	}

	public void setMessages(LabelUtils messages) {
		this.messages = messages;
	}

	public void setTaxRateDescriptionService(TaxRateDescriptionService taxRateDescriptionService) {
		this.taxRateDescriptionService = taxRateDescriptionService;
	}
}