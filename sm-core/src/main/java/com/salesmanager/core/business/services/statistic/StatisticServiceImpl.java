package com.salesmanager.core.business.services.statistic;

import com.google.common.collect.ImmutableList;
import com.salesmanager.core.business.repositories.customer.CustomerRepository;
import com.salesmanager.core.business.repositories.merchant.MerchantRepository;
import com.salesmanager.core.business.repositories.order.OrderRepository;
import com.salesmanager.core.model.order.orderstatus.OrderStatus;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("statisticService")
public class StatisticServiceImpl implements StatisticService {

    private MerchantRepository merchantRepository;

    private OrderRepository orderRepository;

    private CustomerRepository customerRepository;

    private static final List<OrderStatus> orderStatuses = ImmutableList.of(OrderStatus.ORDERED, OrderStatus.DELIVERED, OrderStatus.PROCESSED);

    private static final List<OrderStatus> successOrderStatuses = ImmutableList.of(OrderStatus.DELIVERED);

    @Override
    public int getTotalStores() {
        return merchantRepository.countAll();
    }

    @Override
    public int getTotalCustomers() {
        return customerRepository.countAll();
    }

    @Override
    public int getTotalCustomersInDay(Date date) {
        Date fromDate = DateUtils.truncate(date, Calendar.DATE);
        Date toDate = DateUtils.ceiling(date, Calendar.DATE);

        return customerRepository.countAllInDay(fromDate, toDate);
    }

    @Override
    public int getTotalOrders() {
        return orderRepository.countAll(orderStatuses);
    }

    @Override
    public int getTotalOrdersInDay(Date date) {
        return orderRepository.countAllInDay(date, orderStatuses);
    }

    @Override
    public BigDecimal getTotalRevenue() {
        return orderRepository.getTotalRevenue(successOrderStatuses);
    }

    @Override
    public BigDecimal getTotalRevenueInDay(Date date) {
        return orderRepository.getTotalRevenueInDay(date, successOrderStatuses);
    }

    @Inject
    public void setMerchantRepository(MerchantRepository merchantRepository) {
        this.merchantRepository = merchantRepository;
    }

    @Inject
    public void setOrderRepository(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Inject
    public void setCustomerRepository(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

}
