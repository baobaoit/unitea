package com.salesmanager.core.business.services.tax;

import com.salesmanager.core.business.services.common.generic.SalesManagerEntityService;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.taxrate.TaxRateDescription;

import java.util.Optional;

public interface TaxRateDescriptionService extends SalesManagerEntityService<Long, TaxRateDescription> {

	Optional<TaxRateDescription> getTaxRateDescriptionByNameAndLanguage(String name, Language language);
}
