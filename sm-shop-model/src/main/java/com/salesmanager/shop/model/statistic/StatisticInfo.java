package com.salesmanager.shop.model.statistic;

import java.io.Serializable;
import java.math.BigDecimal;

public class StatisticInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String totalRevenue;
    private BigDecimal totalRevenueValue;
    private int totalOrders;
    private int totalStores;
    private int totalCustomer;

    public BigDecimal getTotalRevenueValue() {
        return totalRevenueValue;
    }
    public void setTotalRevenueValue(BigDecimal totalRevenueValue) {
        this.totalRevenueValue = totalRevenueValue;
    }
    public String getTotalRevenue() {
        return totalRevenue;
    }
    public void setTotalRevenue(String totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
    public int getTotalOrders() {
        return totalOrders;
    }
    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }
    public int getTotalStores() {
        return totalStores;
    }
    public void setTotalStores(int totalStores) {
        this.totalStores = totalStores;
    }
    public int getTotalCustomer() {
        return totalCustomer;
    }
    public void setTotalCustomer(int totalCustomer) {
        this.totalCustomer = totalCustomer;
    }
}
