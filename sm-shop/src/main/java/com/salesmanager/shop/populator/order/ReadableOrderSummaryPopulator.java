package com.salesmanager.shop.populator.order;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.services.tax.TaxRateDescriptionService;
import com.salesmanager.core.model.tip.OTTipRate;
import com.salesmanager.shop.model.order.total.ReadableOTTaxRate;
import com.salesmanager.shop.model.tip.ReadableOTTipRate;
import com.salesmanager.shop.populator.tip.ReadableOTTipRatePopulator;
import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTotal;
import com.salesmanager.core.model.order.OrderTotalSummary;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.order.ReadableOrderTotalSummary;
import com.salesmanager.shop.model.order.total.ReadableOrderTotal;
import com.salesmanager.shop.utils.LabelUtils;

public class ReadableOrderSummaryPopulator extends AbstractDataPopulator<OrderTotalSummary, ReadableOrderTotalSummary> {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(ReadableOrderSummaryPopulator.class);
	
	private PricingService pricingService;
	private LabelUtils messages;
	private TaxRateDescriptionService taxRateDescriptionService;
	


	@Override
	public ReadableOrderTotalSummary populate(OrderTotalSummary source, ReadableOrderTotalSummary target,
			MerchantStore store, Language language) throws ConversionException {
		
		Validate.notNull(pricingService,"PricingService must be set");
		Validate.notNull(messages,"LabelUtils must be set");
		
		if(target==null) {
			target = new ReadableOrderTotalSummary();
		}
		
		try {
		
			if(source.getSubTotal() != null) {
				target.setSubTotal(pricingService.getDisplayAmount(source.getSubTotal(), store));
			}
			if(source.getTaxTotal()!=null) {
				target.setTaxTotal(pricingService.getDisplayAmount(source.getTaxTotal(), store));
			}
			if(source.getTotal() != null) {
				target.setTotal(pricingService.getDisplayAmount(source.getTotal(), store));
			}
			
			if(!CollectionUtils.isEmpty(source.getTotals())) {
				ReadableOrderTotalPopulator orderTotalPopulator = new ReadableOrderTotalPopulator();
				orderTotalPopulator.setMessages(messages);
				orderTotalPopulator.setPricingService(pricingService);
				orderTotalPopulator.setTaxRateDescriptionService(taxRateDescriptionService);
				for(OrderTotal orderTotal : source.getTotals()) {
					ReadableOrderTotal t = new ReadableOrderTotal();
					if (Constants.OT_TAX_MODULE_CODE.equals(orderTotal.getModule())) {
						t = new ReadableOTTaxRate();
					}
					orderTotalPopulator.populate(orderTotal, t, store, language);
					target.getTotals().add(t);
				}
			}

			if (!CollectionUtils.isEmpty(source.getTipRates())) {
				ReadableOTTipRatePopulator otTipRatePopulator = new ReadableOTTipRatePopulator();
				otTipRatePopulator.setPricingService(pricingService);
				for (OTTipRate otTipRate : source.getTipRates()) {
					ReadableOTTipRate tipRate = new ReadableOTTipRate();
					otTipRatePopulator.populate(otTipRate, tipRate, store, language);
					target.getTipRates().add(tipRate);
				}
			}
			
		
		} catch(Exception e) {
			LOGGER.error("Error during amount formatting " + e.getMessage());
			throw new ConversionException(e);
		}
		
		return target;
		
	}

	@Override
	protected ReadableOrderTotalSummary createTarget() {
		// TODO Auto-generated method stub
		return null;
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
