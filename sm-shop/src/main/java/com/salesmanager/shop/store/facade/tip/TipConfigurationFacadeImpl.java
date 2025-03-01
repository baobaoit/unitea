package com.salesmanager.shop.store.facade.tip;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.tip.TipService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tip.TipConfiguration;
import com.salesmanager.shop.mapper.tip.ReadableTipConfigurationMapper;
import com.salesmanager.shop.model.configuration.PersistableTipConfiguration;
import com.salesmanager.shop.model.configuration.ReadableTipConfiguration;
import com.salesmanager.shop.populator.tip.PersistableTipConfigurationPopulator;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.configurations.TipConfigurationFacade;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service("tipConfigurationFacade")
public class TipConfigurationFacadeImpl implements TipConfigurationFacade {

	@Inject
	private TipService tipService;

	@Inject
	private ReadableTipConfigurationMapper readableTipConfigurationMapper;

	@Inject
	private PersistableTipConfigurationPopulator persistableTipConfigurationPopulator;

	@Override
	public ReadableTipConfiguration getConfiguration(MerchantStore store, Language language) {
		try {

			ReadableTipConfiguration config = new ReadableTipConfiguration();
			TipConfiguration tipConfiguration = tipService.getConfiguration(store);

			config = readableTipConfigurationMapper.merge(tipConfiguration, config, store, language);

			return config;

		} catch (ServiceException e) {
			throw new ServiceRuntimeException("Error while getting tip configuration", e);
		}
	}

	@Override
	public ReadableTipConfiguration saveConfiguration(PersistableTipConfiguration tipConfiguration, MerchantStore store, Language language) {
		try {

			TipConfiguration tipConfigurationModel = tipService.getConfiguration(store);
			if (tipConfigurationModel == null) {
				tipConfigurationModel = new TipConfiguration();
			}

			persistableTipConfigurationPopulator.populate(tipConfiguration, tipConfigurationModel, store, language);
			tipService.saveConfiguration(tipConfigurationModel, store);

			return readableTipConfigurationMapper.convert(tipConfigurationModel, store, language);

		} catch (Exception e) {
			throw new ServiceRuntimeException(String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
		}
	}
}
