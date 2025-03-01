package com.salesmanager.shop.populator.tip;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.utils.AbstractDataPopulator;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tip.TipConfiguration;
import com.salesmanager.core.model.tip.TipRate;
import com.salesmanager.shop.model.configuration.PersistableTipConfiguration;
import com.salesmanager.shop.model.tip.PersistableTipRate;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Component
public class PersistableTipConfigurationPopulator extends
		AbstractDataPopulator<PersistableTipConfiguration, TipConfiguration> {

	@Override
	protected TipConfiguration createTarget() {
		return null;
	}

	@Override
	public TipConfiguration populate(PersistableTipConfiguration source,
									 TipConfiguration target,
									 MerchantStore store, Language language) throws ConversionException {

		Validate.notNull(target,"Tip configuration must not be null");
		Validate.notNull(source,"PersistableTipConfiguration must not be null");
		Validate.notNull(source.getTipRates(), "Tip rate list must not be null");

		try {

			List<TipRate> tipRates = new ArrayList<>();
			for (PersistableTipRate persistableTipRate : source.getTipRates()) {
				tipRates.add(convertToTipRate(persistableTipRate));
			}

			if (!tipRates.isEmpty()) {
				if (tipRates.stream().filter(TipRate::isDefaultTipRate).count() != 1) {
					throw new ConversionException("Exists only 1 default tip rate");
				}

				tipRates.sort(Comparator.comparing(TipRate::getPercentage));
				target.setTipRates(tipRates);
			}

			return target;

		} catch (Exception e) {
			throw new ConversionException(e.getMessage());
		}
	}

	private TipRate convertToTipRate(PersistableTipRate persistableTipRate) throws ConversionException {
		BigDecimal tipRatePercentage = persistableTipRate.getPercentage();

		if (tipRatePercentage.intValue() < 0) {
			throw new ConversionException("Tip rate must be positive");
		}


		TipRate tipRate = new TipRate();
		if (tipRatePercentage.intValue() == 0) {
			tipRate = TipRate.NONE;
		} else {
			tipRate.setPercentage(tipRatePercentage);
		}
		tipRate.setDefaultTipRate(persistableTipRate.isActivated());

		return tipRate;
	}
}
