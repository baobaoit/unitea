package com.salesmanager.core.business.repositories.order;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.order.OrderTotal;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.Date;

public interface OrderTotalRepository extends JpaRepository<OrderTotal, Long> {

	@Query("select case when sum(ot.value) is not null then sum(ot.value) else 0 end from OrderTotal ot " +
			"join ot.order o join o.merchant om where ot.module = 'tip' and o.status = 'DELIVERED' " +
			"and (o.datePurchased between ?1 and ?2) and om.id = ?3")
	BigDecimal getTotalTipsInRangeDate(Date startDate, Date endDate, Integer merchantId);

}
