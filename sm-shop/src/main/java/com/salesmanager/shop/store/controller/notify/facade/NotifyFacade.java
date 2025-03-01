package com.salesmanager.shop.store.controller.notify.facade;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.IntegrationConfiguration;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

public interface NotifyFacade {

    void updatePaymentMethod(IntegrationConfiguration configuration, MerchantStore merchantStore,
                             Locale customerLocale, HttpServletRequest request) throws ServiceException;

    void updatePaymentMethod(String code, MerchantStore merchantStore, Locale customerLocale, HttpServletRequest request) throws ServiceException;

}
