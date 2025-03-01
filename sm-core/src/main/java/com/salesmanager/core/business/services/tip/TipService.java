package com.salesmanager.core.business.services.tip;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.model.CustomerTip;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTotalSummary;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tip.OTTipRate;
import com.salesmanager.core.model.tip.TipConfiguration;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface TipService {

	/**
	 * Retrieves tip configurations (TipConfiguration) for a given MerchantStore
	 * @param store
	 * @return
	 * @throws ServiceException
	 */
	TipConfiguration getConfiguration(MerchantStore store) throws ServiceException;

	/**
	 * Saves TipConfiguration to MerchantConfiguration table
	 * @param tipConfiguration
	 * @param store
	 * @throws ServiceException
	 */
	void saveConfiguration(TipConfiguration tipConfiguration, MerchantStore store) throws ServiceException;

	/**
	 * Calculates tip over an OrderTotalSummary with CustomerTip
	 * @param orderTotalSummary
	 * @param customerTip
	 * @param store
	 * @param language
	 * @return
	 * @throws ServiceException
	 */
	List<OTTipRate> calculateTip(OrderTotalSummary orderTotalSummary, CustomerTip customerTip,
								 MerchantStore store, Language language) throws ServiceException;

	/**
	 * Returns the total tip of the {@code store} since the first delivered order.
	 * @param store
	 * @return
	 */
	BigDecimal getTotalTips(MerchantStore store);

	/**
	 * Returns the total tips of the {@code store} from {@code startDate} to {@code endDate}
	 * @param startDate
	 * @param endDate
	 * @param store
	 * @return
	 */
	BigDecimal getTotalTipsInRangeDate(Date startDate, Date endDate, MerchantStore store);

}
