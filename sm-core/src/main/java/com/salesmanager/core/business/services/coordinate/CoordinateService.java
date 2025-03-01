package com.salesmanager.core.business.services.coordinate;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.merchant.MerchantStore;

public interface CoordinateService {

    /**
     * Retrieves coordinate configurations (CoordinateConfiguration) for a given MerchantStore
     * @param store
     * @return
     * @throws ServiceException
     */
    CoordinateConfiguration getConfiguration(MerchantStore store) throws ServiceException;

    /**
     * Saves CoordinateConfiguration to MerchantConfiguration table
     * @param coordinateConfiguration
     * @param store
     * @throws ServiceException
     */
    void saveConfiguration(CoordinateConfiguration coordinateConfiguration, MerchantStore store) throws ServiceException;

}
