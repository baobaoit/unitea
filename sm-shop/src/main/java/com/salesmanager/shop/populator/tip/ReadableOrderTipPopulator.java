package com.salesmanager.shop.populator.tip;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.order.OrderTotalType;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.tip.ReadableOrderTip;
import com.salesmanager.shop.utils.DateUtil;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Optional;

@Component
public class ReadableOrderTipPopulator extends
		AbstractDataPopulator<Order, ReadableOrderTip> {

	private PricingService pricingService;

	@Override
	protected ReadableOrderTip createTarget() {
		return null;
	}

	@Override
	public ReadableOrderTip populate(Order source, ReadableOrderTip target,
									 MerchantStore store, Language language) throws ConversionException {

		try {
			if (target == null) {
				target = new ReadableOrderTip();
			}

			target.setOrderId(source.getId());
			target.setDatePurchased(DateUtil.formatDate(source.getDatePurchased()));

			for (com.salesmanager.core.model.order.OrderTotal t : source.getOrderTotal()) {
				if (t.getOrderTotalType() == null) {
					continue;
				}

				OrderTotalType orderType = t.getOrderTotalType();
				BigDecimal amount = Optional.ofNullable(t.getValue()).orElse(BigDecimal.ZERO);
				String displayAmount = pricingService.getDisplayAmount(amount, store);

				if (OrderTotalType.TOTAL.equals(orderType)) {
					target.setTotalAmount(displayAmount);
				} else if (OrderTotalType.TIP.equals(orderType)) {
					target.setTipAmount(displayAmount);
				}
			}

			return target;

		} catch (Exception e) {
			throw new ConversionException(e.getMessage());
		}
	}

	public void setPricingService(PricingService pricingService) {
		this.pricingService = pricingService;
	}
}
