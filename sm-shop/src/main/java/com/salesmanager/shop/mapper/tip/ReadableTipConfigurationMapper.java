package com.salesmanager.shop.mapper.tip;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tip.TipConfiguration;
import com.salesmanager.core.model.tip.TipRate;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.configuration.ReadableTipConfiguration;
import com.salesmanager.shop.model.tip.ReadableTipRate;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class ReadableTipConfigurationMapper implements Mapper<TipConfiguration, ReadableTipConfiguration> {
	@Override
	public ReadableTipConfiguration convert(TipConfiguration source, MerchantStore store, Language language) {
		ReadableTipConfiguration tipConfiguration = new ReadableTipConfiguration();
		tipConfiguration.setTipRates(source.getTipRates().stream()
				.map(this::convertToReadableTipRate)
				.collect(Collectors.toList()));

		return tipConfiguration;
	}

	@Override
	public ReadableTipConfiguration merge(TipConfiguration source, ReadableTipConfiguration destination, MerchantStore store, Language language) {
		if (destination == null) {
			destination = new ReadableTipConfiguration();
		}

		destination.setTipRates(source.getTipRates().stream()
				.map(this::convertToReadableTipRate)
				.collect(Collectors.toList()));

		return destination;
	}

	private ReadableTipRate convertToReadableTipRate(TipRate tipRate) {
		if (tipRate == null) {
			return null;
		}

		ReadableTipRate readableTipRate = new ReadableTipRate();
		readableTipRate.setPercentage(tipRate.getPercentage());
		readableTipRate.setActivated(tipRate.isDefaultTipRate());

		return readableTipRate;
	}
}
