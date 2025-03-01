package com.salesmanager.shop.store.facade.tax;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.tax.TaxService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.TaxConfiguration;
import com.salesmanager.shop.mapper.tax.ReadableTaxConfigurationMapper;
import com.salesmanager.shop.model.configuration.PersistableTaxConfiguration;
import com.salesmanager.shop.model.configuration.ReadableTaxConfiguration;
import com.salesmanager.shop.populator.tax.PersistableTaxConfigurationPopulator;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.configurations.TaxConfigurationsFacade;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service("taxConfigurationFacade")
public class TaxConfigurationFacadeImpl implements TaxConfigurationsFacade {

	@Inject
	private TaxService taxService;

	@Inject
	private ReadableTaxConfigurationMapper readableTaxConfigurationMapper;

	@Inject
	private PersistableTaxConfigurationPopulator persistableTaxConfigurationPopulator;

	@Override
	public ReadableTaxConfiguration getConfiguration(MerchantStore store, Language language) {
		try {

			ReadableTaxConfiguration config = new ReadableTaxConfiguration();
			TaxConfiguration taxConfiguration = taxService.getTaxConfiguration(store);

			if (taxConfiguration != null) {
				config = readableTaxConfigurationMapper.merge(taxConfiguration, config, store, language);
			}

			return config;

		} catch (ServiceException e) {
			throw new ServiceRuntimeException("Error while getting tax configuration", e);
		}
	}

	@Override
	public ReadableTaxConfiguration saveConfiguration(PersistableTaxConfiguration taxConfiguration, MerchantStore store, Language language) {
		try {

			TaxConfiguration taxConfigurationModel = taxService.getTaxConfiguration(store);
			if (taxConfigurationModel == null) {
				taxConfigurationModel = new TaxConfiguration();
			}

			persistableTaxConfigurationPopulator.populate(taxConfiguration, taxConfigurationModel, store, language);
			taxService.saveTaxConfiguration(taxConfigurationModel, store);

			return readableTaxConfigurationMapper.convert(taxConfigurationModel, store, language);

		} catch (Exception e) {
			throw new ServiceRuntimeException(e);
		}
	}
}
