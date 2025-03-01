package com.salesmanager.core.business.repositories.order;

import com.salesmanager.core.model.order.orderstatus.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.order.Order;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long>, OrderRepositoryCustom {

    @Query("select o from Order o join fetch o.merchant om "
    		+ "join fetch o.orderProducts op "
    		+ "left join fetch o.delivery od left join fetch od.country left join fetch od.zone "
    		+ "left join fetch o.billing ob left join fetch ob.country left join fetch ob.zone "
    		+ "left join fetch o.orderAttributes oa "
    		+ "join fetch o.orderTotal ot left "
    		+ "join fetch o.orderHistory oh left "
    		+ "join fetch op.downloads opd left "
    		+ "join fetch op.orderAttributes opa "
    		+ "left join fetch op.prices opp where o.id = ?1 and om.id = ?2")
	Order findOne(Long id, Integer merchantId);

    @Query("select count(o) from Order o left join o.merchant om where o.status in ?1 and om <> 1")
    int countAll(List<OrderStatus> orderStatusList);

    @Query("select count(o) from Order o left join o.merchant om " +
			"where om <> 1 and o.datePurchased = ?1 and o.status in ?2")
    int countAllInDay(Date date, List<OrderStatus> orderStatusList);

    @Query("select sum(o.total) from Order o left join o.merchant om where om <> 1 and o.status in ?1")
    BigDecimal getTotalRevenue(List<OrderStatus> orderStatusList);

	@Query("select sum(o.total) from Order o left join o.merchant om where om <> 1 and o.datePurchased = ?1 and o.status in ?2")
    BigDecimal getTotalRevenueInDay(Date date, List<OrderStatus> orderStatusList);
}
