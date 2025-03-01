package com.salesmanager.core.business.services.statistic;

import java.math.BigDecimal;
import java.util.Date;

public interface StatisticService {
    int getTotalStores();

    int getTotalCustomers();

    int getTotalCustomersInDay(Date date);

    int getTotalOrders();

    int getTotalOrdersInDay(Date date);

    BigDecimal getTotalRevenue();

    BigDecimal getTotalRevenueInDay(Date date);
}
