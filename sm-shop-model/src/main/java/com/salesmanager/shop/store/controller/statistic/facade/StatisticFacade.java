package com.salesmanager.shop.store.controller.statistic.facade;


import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.shop.model.statistic.ReadableStatisticInfo;


public interface StatisticFacade {
    ReadableStatisticInfo getStatistic(String date, MerchantStore store) throws Exception;
}
