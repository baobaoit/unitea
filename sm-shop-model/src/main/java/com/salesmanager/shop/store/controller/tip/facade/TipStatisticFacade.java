package com.salesmanager.shop.store.controller.tip.facade;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTipCriteria;
import com.salesmanager.shop.model.statistic.ReadableTipsToday;
import com.salesmanager.shop.model.tip.ReadableOrderTipList;

public interface TipStatisticFacade {

	/**
	 * The method used to get the tip reports.
	 * @param criteria
	 * @param store
	 * @return
	 */
	ReadableOrderTipList getReadableOrderTipList(OrderTipCriteria criteria, MerchantStore store);

	/**
	 * The method used to get the tips today
	 * @param store
	 * @return
	 */
	ReadableTipsToday getTipsToday(MerchantStore store);

}
