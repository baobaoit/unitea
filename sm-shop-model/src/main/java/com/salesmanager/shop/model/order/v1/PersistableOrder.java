package com.salesmanager.shop.model.order.v1;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.salesmanager.shop.model.order.transaction.PersistablePayment;
import com.salesmanager.shop.model.tip.PersistableCustomerTip;


/**
 * This object is used when processing an order from the API
 * It will be used for processing the payment and as Order meta data
 * @author c.samson
 *
 */
public class PersistableOrder extends Order {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private PersistablePayment payment;
	private Long shippingQuote;
	@JsonIgnore
	private Long shoppingCartId;
	@JsonIgnore
	private Long customerId;

	private BillingAddress billingAddress;

	private PersistableCustomerTip customerTip;

	public BillingAddress getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}

	public Long getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(Long shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public PersistablePayment getPayment() {
		return payment;
	}

	public void setPayment(PersistablePayment payment) {
		this.payment = payment;
	}

	public Long getShippingQuote() {
		return shippingQuote;
	}

	public void setShippingQuote(Long shippingQuote) {
		this.shippingQuote = shippingQuote;
	}

	public PersistableCustomerTip getCustomerTip() {
		return customerTip;
	}

	public void setCustomerTip(PersistableCustomerTip customerTip) {
		this.customerTip = customerTip;
	}

}
