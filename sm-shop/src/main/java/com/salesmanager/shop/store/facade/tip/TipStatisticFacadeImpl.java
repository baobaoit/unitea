package com.salesmanager.shop.store.facade.tip;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.order.OrderService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.order.OrderList;
import com.salesmanager.core.model.order.OrderTipCriteria;
import com.salesmanager.core.model.order.orderstatus.OrderStatus;
import com.salesmanager.shop.model.statistic.ReadableTipsToday;
import com.salesmanager.shop.model.tip.ReadableOrderTip;
import com.salesmanager.shop.model.tip.ReadableOrderTipList;
import com.salesmanager.shop.populator.tip.ReadableOrderTipPopulator;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.tip.facade.TipStatisticFacade;
import com.salesmanager.shop.utils.DateUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service("tipStatisticFacade")
public class TipStatisticFacadeImpl implements TipStatisticFacade {

	@Inject
	private OrderService orderService;

	@Inject
	private PricingService pricingService;

	@Inject
	private ReadableOrderTipPopulator readableOrderTipPopulator;

	@Override
	public ReadableOrderTipList getReadableOrderTipList(OrderTipCriteria criteria, MerchantStore store) {
		try {
			ReadableOrderTipList returnList = getReadableOrderTipListInRageDates(criteria, store);

			BigDecimal totalTips = orderService.getTotalTipsInRangeDate(criteria.getFromDate(), criteria.getToDate(), store);

			returnList.setTotalTipAmount(pricingService.getDisplayAmount(totalTips, store));

			return returnList;

		} catch (Exception e) {
			throw new ServiceRuntimeException("Error while getting orders", e);
		}
	}

	@Override
	public ReadableTipsToday getTipsToday(MerchantStore store) {
		try {
			BigDecimal totalTips = orderService.getTotalTips(store);

			ReadableOrderTipList tipsToday = getReadableOrderTipListToday(store);

			ReadableTipsToday result = new ReadableTipsToday();
			result.setTotalTip(pricingService.getDisplayAmount(totalTips, store));
			result.setTipsToday(tipsToday.getTotalTipAmount());

			return result;

		} catch (Exception e) {
			throw new ServiceRuntimeException("Error while getting tips today", e);
		}
	}

	private ReadableOrderTipList getReadableOrderTipListInRageDates(OrderTipCriteria criteria, MerchantStore store)
			throws ConversionException, ServiceException {

		final String DEFAULT_DISPLAY_AMOUNT = pricingService.getDisplayAmount(BigDecimal.ZERO, store);

		criteria.setLegacyPagination(false);
		criteria.setStatus(String.valueOf(OrderStatus.DELIVERED));

		OrderList orderList = orderService.getOrders(criteria, store);

		List<Order> orders = orderList.getOrders();
		ReadableOrderTipList returnList = new ReadableOrderTipList();

		if (CollectionUtils.isEmpty(orders)) {
			returnList.setRecordsTotal(0);
			returnList.setOrderTips(Collections.emptyList());
			returnList.setTotalTipAmount(DEFAULT_DISPLAY_AMOUNT);

			return returnList;
		}

		List<ReadableOrderTip> readableOrderTips = new ArrayList<>();
		readableOrderTipPopulator.setPricingService(pricingService);
		for (Order order : orders) {
			ReadableOrderTip readableOrderTip = new ReadableOrderTip();
			readableOrderTipPopulator.populate(order, readableOrderTip, store, null);

			if (StringUtils.isEmpty(readableOrderTip.getTipAmount())) {
				readableOrderTip.setTipAmount(DEFAULT_DISPLAY_AMOUNT);
			}

			readableOrderTips.add(readableOrderTip);
		}
		returnList.setOrderTips(readableOrderTips);

		returnList.setRecordsTotal(orderList.getTotalCount());
		returnList.setTotalPages(orderList.getTotalPages());
		returnList.setNumber(orderList.getOrders().size());
		returnList.setRecordsFiltered(orderList.getOrders().size());

		return returnList;
	}

	private ReadableOrderTipList getReadableOrderTipListToday(MerchantStore store)
			throws ConversionException, ServiceException {

		OrderTipCriteria criteria = new OrderTipCriteria();
		criteria.setFromDate(DateUtil.getDate());

		return getReadableOrderTipListInRageDates(criteria, store);
	}

}
