package com.salesmanager.core.business.services.tax;

import com.salesmanager.core.business.repositories.tax.TaxRateDescriptionRepository;
import com.salesmanager.core.business.services.common.generic.SalesManagerEntityServiceImpl;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.taxrate.TaxRateDescription;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Optional;

@Service("taxRateDescriptionService")
public class TaxRateDescriptionServiceImpl extends SalesManagerEntityServiceImpl<Long, TaxRateDescription>
		implements TaxRateDescriptionService {

	private TaxRateDescriptionRepository taxRateDescriptionRepository;

	@Inject
	public TaxRateDescriptionServiceImpl(TaxRateDescriptionRepository taxRateDescriptionRepository) {
		super(taxRateDescriptionRepository);
		this.taxRateDescriptionRepository = taxRateDescriptionRepository;
	}

	@Override
	public Optional<TaxRateDescription> getTaxRateDescriptionByNameAndLanguage(String name, Language language) {
		return taxRateDescriptionRepository.findByNameAndLanguage_Id(name, language.getId());
	}
}
