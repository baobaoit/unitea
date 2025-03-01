package com.salesmanager.shop.store.controller.configurations;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;

public interface GenericConfigurationsFacade<PersistableConfiguration, ReadableConfiguration> {
	ReadableConfiguration getConfiguration(MerchantStore store, Language language);

	ReadableConfiguration saveConfiguration(PersistableConfiguration persistableConfiguration, MerchantStore store, Language language);
}
