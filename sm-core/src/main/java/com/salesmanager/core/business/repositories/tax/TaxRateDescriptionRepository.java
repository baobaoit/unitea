package com.salesmanager.core.business.repositories.tax;

import com.salesmanager.core.model.tax.taxrate.TaxRateDescription;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TaxRateDescriptionRepository extends JpaRepository<TaxRateDescription, Long> {

	Optional<TaxRateDescription> findByNameAndLanguage_Id(String name, Integer languageId);
}
