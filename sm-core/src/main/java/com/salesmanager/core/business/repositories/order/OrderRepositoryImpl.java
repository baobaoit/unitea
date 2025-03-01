package com.salesmanager.core.business.repositories.order;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.salesmanager.core.model.order.OrderTipCriteria;
import org.apache.commons.lang3.StringUtils;

import com.salesmanager.core.business.utils.RepositoryHelper;
import com.salesmanager.core.model.common.CriteriaOrderBy;
import com.salesmanager.core.model.common.GenericEntityList;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderCriteria;
import com.salesmanager.core.model.order.OrderList;
import com.salesmanager.core.model.order.orderstatus.OrderStatus;

import java.util.List;


public class OrderRepositoryImpl implements OrderRepositoryCustom {
	private static final String CUSTOMER_EMAIL = "email";
	private static final String CUSTOMER_NAME = "name";
	private static final String CUSTOMER_PHONE = "phone";
	private static final String ORDER_ID = "id";
	private static final String ORDER_DATE_PURCHASED_FROM = "fromDate";
	private static final String ORDER_DATE_PURCHASED_TO = "toDate";
	private static final String ORDER_STATUS = "status";
	private static final String MERCHANT_CODE = "mCode";
	
    @PersistenceContext
    private EntityManager em;
    
    /**
     * @deprecated
     */
	@SuppressWarnings("unchecked")
	@Override
	public OrderList listByStore(MerchantStore store, OrderCriteria criteria) {
		

		OrderList orderList = new OrderList();
		StringBuilder countBuilderSelect = new StringBuilder();
		StringBuilder objectBuilderSelect = new StringBuilder();
		
		String orderByCriteria = " order by o.id desc";
		
		if(criteria.getOrderBy()!=null) {
			if(CriteriaOrderBy.ASC.name().equals(criteria.getOrderBy().name())) {
				orderByCriteria = " order by o.id asc";
			}
		}
		
		String countBaseQuery = "select count(o) from Order as o";
		String baseQuery = "select o from Order as o left join fetch o.orderTotal ot left join fetch o.orderProducts op left join fetch o.orderAttributes oa left join fetch op.orderAttributes opo left join fetch op.prices opp";
		countBuilderSelect.append(countBaseQuery);
		objectBuilderSelect.append(baseQuery);

		
		
		StringBuilder countBuilderWhere = new StringBuilder();
		StringBuilder objectBuilderWhere = new StringBuilder();
		String whereQuery = " where o.merchant.id=:mId";
		countBuilderWhere.append(whereQuery);
		objectBuilderWhere.append(whereQuery);
		

		if(!StringUtils.isBlank(criteria.getCustomerName())) {
			String nameQuery =" and o.billing.firstName like:nm or o.billing.lastName like:nm";
			countBuilderWhere.append(nameQuery);
			objectBuilderWhere.append(nameQuery);
		}
		
		if(!StringUtils.isBlank(criteria.getPaymentMethod())) {
			String paymentQuery =" and o.paymentModuleCode like:pm";
			countBuilderWhere.append(paymentQuery);
			objectBuilderWhere.append(paymentQuery);
		}
		
		if(criteria.getCustomerId()!=null) {
			String customerQuery =" and o.customerId =:cid";
			countBuilderWhere.append(customerQuery);
			objectBuilderWhere.append(customerQuery);
		}
		
		objectBuilderWhere.append(orderByCriteria);
		

		//count query
		Query countQ = em.createQuery(
				countBuilderSelect.toString() + countBuilderWhere.toString());
		
		//object query
		Query objectQ = em.createQuery(
				objectBuilderSelect.toString() + objectBuilderWhere.toString());

		countQ.setParameter("mId", store.getId());
		objectQ.setParameter("mId", store.getId());
		

		if(!StringUtils.isBlank(criteria.getCustomerName())) {
			String nameParam = new StringBuilder().append("%").append(criteria.getCustomerName()).append("%").toString();
			countQ.setParameter("nm",nameParam);
			objectQ.setParameter("nm",nameParam);
		}
		
		if(!StringUtils.isBlank(criteria.getPaymentMethod())) {
			String payementParam = new StringBuilder().append("%").append(criteria.getPaymentMethod()).append("%").toString();
			countQ.setParameter("pm",payementParam);
			objectQ.setParameter("pm",payementParam);
		}
		
		if(criteria.getCustomerId()!=null) {
			countQ.setParameter("cid", criteria.getCustomerId());
			objectQ.setParameter("cid",criteria.getCustomerId());
		}
		

		Number count = (Number) countQ.getSingleResult();

		orderList.setTotalCount(count.intValue());
		
        if(count.intValue()==0)
        	return orderList;
        
		//TO BE USED
        int max = criteria.getMaxCount();
        int first = criteria.getStartIndex();
        
        objectQ.setFirstResult(first);
        
        
        
    	if(max>0) {
    			int maxCount = first + max;

			objectQ.setMaxResults(Math.min(maxCount, count.intValue()));
    	}
		
    	orderList.setOrders(objectQ.getResultList());

		return orderList;
		
		
	}

	@Override
	public OrderList listOrders(MerchantStore store, OrderCriteria criteria) {
		OrderList orderList = new OrderList();
		StringBuilder countBuilderSelect = new StringBuilder();
		StringBuilder objectBuilderSelect = new StringBuilder();

		StringBuilder orderByCriteria = new StringBuilder(" order by o.");

		if (!StringUtils.isEmpty(criteria.getCriteriaOrderByField())) {
			orderByCriteria.append(criteria.getCriteriaOrderByField());
		} else {
			orderByCriteria.append(ORDER_ID);
		}

		if(criteria.getOrderBy() != null && CriteriaOrderBy.ASC.equals(criteria.getOrderBy())) {
			orderByCriteria.append(" asc");
		} else {
			orderByCriteria.append(" desc");
		}
		
		String baseQuery = "select o from Order as o left join fetch o.delivery.country left join fetch o.delivery.zone left join fetch o.billing.country left join fetch o.billing.zone left join fetch o.orderTotal ot left join fetch o.orderProducts op left join fetch o.orderAttributes oa left join fetch op.orderAttributes opo left join fetch op.prices opp";
		String countBaseQuery = "select count(o) from Order as o";
		
		countBuilderSelect.append(countBaseQuery);
		objectBuilderSelect.append(baseQuery);

		StringBuilder objectBuilderWhere = new StringBuilder();

		String storeQuery = String.format(" where o.merchant.code=:%s", MERCHANT_CODE);
		objectBuilderWhere.append(storeQuery);
		countBuilderSelect.append(storeQuery);

		String customerName = criteria.getCustomerName();
		boolean isHavingNameQuery = StringUtils.isNotEmpty(customerName);
		if(isHavingNameQuery) {
			String nameQuery = String.format(" and o.billing.firstName like:%s or o.billing.lastName like:%s",
					CUSTOMER_NAME, CUSTOMER_NAME);
			objectBuilderWhere.append(nameQuery);
			countBuilderSelect.append(nameQuery);
		}

		String customerEmail = criteria.getEmail();
		boolean isHavingEmailQuery = StringUtils.isNotEmpty(customerEmail);
		if(isHavingEmailQuery) {
			String emailQuery = String.format(" and o.customerEmailAddress like:%s", CUSTOMER_EMAIL);
			objectBuilderWhere.append(emailQuery);
			countBuilderSelect.append(emailQuery);
		}
		
		//id
		List<Long> orderIds = criteria.getId();
		boolean isHavingOrderIdsQuery = orderIds != null && orderIds.size() >= 1;
		if(isHavingOrderIdsQuery) {
			String orderIdsQuery = String.format(" and str(o.id) like:%s", ORDER_ID);
			if (orderIds.size() > 1) {
				orderIdsQuery = String.format(" and o.id in(:%s)", ORDER_ID);
			}
			objectBuilderWhere.append(orderIdsQuery);
			countBuilderSelect.append(orderIdsQuery);
		}
		
		//phone
		String customerPhone = criteria.getCustomerPhone();
		boolean isHavingPhoneQuery = StringUtils.isNotEmpty(customerPhone);
		if(isHavingPhoneQuery) {
			String phoneQuery = String.format(" and o.billing.telephone like:phone or o.delivery.telephone like:%s",
					CUSTOMER_PHONE);
			objectBuilderWhere.append(phoneQuery);
			countBuilderSelect.append(phoneQuery);
		}
		
		//status
		String orderStatus = criteria.getStatus();
		boolean isHavingOrderStatusQuery = StringUtils.isNotEmpty(orderStatus);
		if(isHavingOrderStatusQuery) {
			String orderStatusQuery = String.format(" and o.status =:%s", ORDER_STATUS);
			objectBuilderWhere.append(orderStatusQuery);
			countBuilderSelect.append(orderStatusQuery);
		}

		boolean isHavingFromDateQuery = false;
		boolean isHavingToDateQuery = false;
		java.util.Date fromDate = null;
		java.util.Date toDate = null;
		if (criteria instanceof OrderTipCriteria) {
			OrderTipCriteria orderTipCriteria = (OrderTipCriteria) criteria;

			//from date
			fromDate = orderTipCriteria.getFromDate();
			isHavingFromDateQuery = fromDate != null;
			if (isHavingFromDateQuery) {
				String fromDateQuery = String.format(" and o.datePurchased >= :%s", ORDER_DATE_PURCHASED_FROM);
				objectBuilderWhere.append(fromDateQuery);
				countBuilderSelect.append(fromDateQuery);
			}

			//to date
			toDate = orderTipCriteria.getToDate();
			isHavingToDateQuery = toDate != null;
			if (isHavingToDateQuery) {
				String toDateQuery = String.format(" and o.datePurchased <= :%s", ORDER_DATE_PURCHASED_TO);
				objectBuilderWhere.append(toDateQuery);
				countBuilderSelect.append(toDateQuery);
			}
		}
	
		objectBuilderWhere.append(orderByCriteria);

		//count query
		Query countQ = em.createQuery(
				countBuilderSelect.toString());

		//object query
		Query objectQ = em.createQuery(
				objectBuilderSelect.toString() + objectBuilderWhere.toString());
		
		//customer name
		if(isHavingNameQuery) {
			countQ.setParameter(CUSTOMER_NAME, like(customerName));
			objectQ.setParameter(CUSTOMER_NAME, like(customerName));
		}
		
		//email
		if(isHavingEmailQuery) {
			countQ.setParameter(CUSTOMER_EMAIL, like(customerEmail));
			objectQ.setParameter(CUSTOMER_EMAIL, like(customerEmail));
		}
		
		//id
		if(isHavingOrderIdsQuery) {
			if (orderIds.size() > 1) {
				countQ.setParameter(ORDER_ID, orderIds);
				objectQ.setParameter(ORDER_ID, orderIds);
			} else {
				String id = String.valueOf(orderIds.get(0));
				countQ.setParameter(ORDER_ID, like(id));
				objectQ.setParameter(ORDER_ID, like(id));
			}
		}
		
		//phone
		if(isHavingPhoneQuery) {
			countQ.setParameter(CUSTOMER_PHONE, like(customerPhone));
			objectQ.setParameter(CUSTOMER_PHONE, like(customerPhone));
		}
		
		//status
		if(isHavingOrderStatusQuery) {
			countQ.setParameter(ORDER_STATUS, OrderStatus.valueOf(orderStatus.toUpperCase()));
			objectQ.setParameter(ORDER_STATUS, OrderStatus.valueOf(orderStatus.toUpperCase()));
		}

		if (criteria instanceof OrderTipCriteria) {
			//from date
			if (isHavingFromDateQuery) {
				countQ.setParameter(ORDER_DATE_PURCHASED_FROM, fromDate);
				objectQ.setParameter(ORDER_DATE_PURCHASED_FROM, fromDate);
			}

			//to date
			if (isHavingToDateQuery) {
				countQ.setParameter(ORDER_DATE_PURCHASED_TO, toDate);
				objectQ.setParameter(ORDER_DATE_PURCHASED_TO, toDate);
			}
		}
		

		countQ.setParameter(MERCHANT_CODE, store.getCode());
		objectQ.setParameter(MERCHANT_CODE, store.getCode());


		Number count = (Number) countQ.getSingleResult();

		if(count.intValue()==0)
			return orderList;

	    @SuppressWarnings("rawtypes")
		GenericEntityList entityList = new GenericEntityList();
	    entityList.setTotalCount(count.intValue());
		
		objectQ = RepositoryHelper.paginateQuery(objectQ, count, entityList, criteria);
		
		//TODO use GenericEntityList

		orderList.setTotalCount(entityList.getTotalCount());
		orderList.setTotalPages(entityList.getTotalPages());

		orderList.setOrders(objectQ.getResultList());

		return orderList;
	}
	
	private String like(String q) {
		return '%' + q + '%';
	}


}
