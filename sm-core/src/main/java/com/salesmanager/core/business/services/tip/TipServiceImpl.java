package com.salesmanager.core.business.services.tip;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.order.OrderTotalRepository;
import com.salesmanager.core.business.services.model.CustomerTip;
import com.salesmanager.core.business.services.model.CustomerTipType;
import com.salesmanager.core.business.services.system.MerchantConfigurationService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTotalSummary;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.system.MerchantConfiguration;
import com.salesmanager.core.model.tip.OTTipRate;
import com.salesmanager.core.model.tip.TipConfiguration;
import com.salesmanager.core.model.tip.TipRate;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.salesmanager.core.business.constants.Constants.TIP_CONFIG;

@Service("tipService")
public class TipServiceImpl implements TipService {

	@Inject
	private MerchantConfigurationService merchantConfigurationService;

	@Inject
	private OrderTotalRepository orderTotalRepository;

	@Override
	public TipConfiguration getConfiguration(MerchantStore store) throws ServiceException {

		MerchantConfiguration configuration = merchantConfigurationService.getMerchantConfiguration(TIP_CONFIG, store);
		TipConfiguration tipConfiguration = new TipConfiguration();
		if (configuration != null) {
			String value = configuration.getValue();

			ObjectMapper mapper = new ObjectMapper();
			try {
				tipConfiguration = mapper.readValue(value, TipConfiguration.class);
			} catch(Exception e) {
				throw new ServiceException("Cannot parse json string " + value);
			}
		}

		return tipConfiguration;
	}

	@Override
	public void saveConfiguration(TipConfiguration tipConfiguration, MerchantStore store) throws ServiceException {

		MerchantConfiguration configuration = merchantConfigurationService.getMerchantConfiguration(TIP_CONFIG, store);

		if (configuration == null) {
			configuration = new MerchantConfiguration();
			configuration.setMerchantStore(store);
			configuration.setKey(TIP_CONFIG);
		}

		String value = tipConfiguration.toJSONString();
		configuration.setValue(value);
		merchantConfigurationService.saveOrUpdate(configuration);

	}

	private List<OTTipRate> calculateTip(OrderTotalSummary orderTotalSummary, MerchantStore store) throws ServiceException {

		List<OTTipRate> tipRates = new ArrayList<>();

		BigDecimal subTotal = orderTotalSummary.getSubTotal();
		if (subTotal == null) {
			return tipRates;
		}

		TipConfiguration tipConfiguration = this.getConfiguration(store);
		List<TipRate> tcTipRates = tipConfiguration.getTipRates();

		for (TipRate tipRate : tcTipRates) {
			BigDecimal percentage = tipRate.getPercentage();
			double percentageDoubleValue = percentage.doubleValue() / 100;

			double value = subTotal.doubleValue() * percentageDoubleValue;
			BigDecimal tipTotal = BigDecimal.valueOf(value)
					.setScale(2, RoundingMode.HALF_UP);

			OTTipRate tip = new OTTipRate();
			tip.setPercentage(percentage);
			tip.setActivated(tipRate.isDefaultTipRate());
			tip.setValue(tipTotal);
			tip.setCustomTip(false);
			tipRates.add(tip);
		}

		return tipRates;
	}

	@Override
	public List<OTTipRate> calculateTip(OrderTotalSummary orderTotalSummary, CustomerTip customerTip,
										MerchantStore store, Language language) throws ServiceException {

		List<OTTipRate> tipRates = this.calculateTip(orderTotalSummary, store);

		BigDecimal subTotal = orderTotalSummary.getSubTotal();
		if (subTotal == null || customerTip == null || customerTip.getType() == null) {
			return tipRates;
		}

		BigDecimal tipAmount = customerTip.getTipAmount();

		// calculate by custom tip amount when type = CUSTOM && tipAmount > 0
		// else calculate by percentage
		if (CustomerTipType.CUSTOM.equals(customerTip.getType())) {
			// custom tip amount
			if (tipAmount == null || tipAmount.negate().doubleValue() >= 0.00) {
				return tipRates;
			}

			calculateByCustomTipAmount(tipRates, subTotal, tipAmount);

		} else {
			// percentage
			if (tipAmount == null || tipAmount.negate().doubleValue() > 0 ||
					tipRates.stream().map(OTTipRate::getPercentage).noneMatch(tipAmount::equals)) {

				return tipRates;
			}

			calculateByPercentage(tipRates, tipAmount);
		}

		return tipRates;
	}

	@Override
	public BigDecimal getTotalTips(MerchantStore store) {
		return getTotalTipsInRangeDate(store.getInBusinessSince(), new Date(), store);
	}

	@Override
	public BigDecimal getTotalTipsInRangeDate(Date startDate, Date endDate, MerchantStore store) {
		return orderTotalRepository.getTotalTipsInRangeDate(startDate, endDate, store.getId());
	}

	private void calculateByPercentage(List<OTTipRate> tipRates, BigDecimal customTipPercentage) {
		tipRates.stream()
				.filter(OTTipRate::isActivated)
				.findFirst()
				.ifPresent(oldTip -> oldTip.setActivated(false));

		tipRates.stream()
				.filter(tip -> tip.getPercentage().equals(customTipPercentage))
				.findFirst()
				.ifPresent(newTip -> newTip.setActivated(true));
	}

	private void calculateByCustomTipAmount(List<OTTipRate> tipRates, BigDecimal subTotal, BigDecimal customTipAmount) {
		double percentageValue = customTipAmount.doubleValue() / subTotal.doubleValue() * 100;
		BigDecimal percentage = BigDecimal.valueOf(percentageValue)
				.setScale(2, RoundingMode.HALF_UP);

		tipRates.stream()
				.filter(OTTipRate::isActivated)
				.findFirst()
				.ifPresent(oldTip -> oldTip.setActivated(false));

		OTTipRate tip = new OTTipRate();
		tip.setPercentage(percentage);
		tip.setActivated(true);
		tip.setValue(customTipAmount);
		tip.setCustomTip(true);
		tipRates.add(tip);
	}
}
