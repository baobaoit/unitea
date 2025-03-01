package com.salesmanager.core.business.services.business;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.businesstime.BusinessTimeConfiguration;

public interface BusinessTimeService {

    void saveConfiguration(BusinessTimeConfiguration businessTimeConfiguration, MerchantStore store);

    BusinessTimeConfiguration getConfiguration(MerchantStore store) throws ServiceException;

}
