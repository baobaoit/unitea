package com.salesmanager.core.model.order;

import java.util.List;

import com.salesmanager.core.model.common.Criteria;

public class OrderCriteria extends Criteria {
	
	private String customerName = null;
	private String customerPhone = null;
	private String status = null;
	private List<Long> id = null;
	private String paymentMethod;
	private Long customerId;
	private String email;
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerName() {
		return customerName;
	}
    public Long getCustomerId()
    {
        return customerId;
    }
    public void setCustomerId( Long customerId )
    {
        this.customerId = customerId;
    }
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Long> getId() {
		return id;
	}
	public void setId(List<Long> id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
   
	
	
	

}
