package com.salesmanager.shop.store.facade.statistic;

import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.statistic.StatisticService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.shop.model.statistic.ReadableStatisticInfo;
import com.salesmanager.shop.store.controller.statistic.facade.StatisticFacade;
import com.salesmanager.shop.utils.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

@Service("statisticFacade")
public class StatisticFacadeImpl implements StatisticFacade {

    @Inject
    private StatisticService statisticService;

    @Inject
    private PricingService pricingService;

    @Override
    public ReadableStatisticInfo getStatistic(String date, MerchantStore store) throws Exception {

        Date date1 = StringUtils.isEmpty(date) ? null : DateUtil.getDate(date);
        ReadableStatisticInfo statisticInfo = new ReadableStatisticInfo();

        statisticInfo.setTotalStores(statisticService.getTotalStores());

        BigDecimal totalRevenueValue;

        if (Objects.nonNull(date)) {

            totalRevenueValue = statisticService.getTotalRevenueInDay(date1);
            statisticInfo.setTotalCustomer(statisticService.getTotalCustomersInDay(date1));
            statisticInfo.setTotalRevenue(pricingService.getDisplayAmount(totalRevenueValue, store));
            statisticInfo.setTotalOrders(statisticService.getTotalOrdersInDay(date1));
        } else {

            totalRevenueValue = statisticService.getTotalRevenue();
            statisticInfo.setTotalCustomer(statisticService.getTotalCustomers());
            statisticInfo.setTotalRevenue(pricingService.getDisplayAmount(totalRevenueValue, store));
            statisticInfo.setTotalOrders(statisticService.getTotalOrders());
        }

        statisticInfo.setTotalRevenueValue(totalRevenueValue);

        return statisticInfo;
    }

}
