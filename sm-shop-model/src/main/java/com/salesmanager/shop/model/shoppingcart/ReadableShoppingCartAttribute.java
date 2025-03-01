package com.salesmanager.shop.model.shoppingcart;

import com.salesmanager.shop.model.entity.ShopEntity;

public class ReadableShoppingCartAttribute extends ShopEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ReadableShoppingCartAttributeOption option;
	private ReadableShoppingCartAttributeOptionValue optionValue;
	private Long productOptionValueId;
	
	public ReadableShoppingCartAttributeOption getOption() {
		return option;
	}
	public void setOption(ReadableShoppingCartAttributeOption option) {
		this.option = option;
	}
	public ReadableShoppingCartAttributeOptionValue getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(ReadableShoppingCartAttributeOptionValue optionValue) {
		this.optionValue = optionValue;
	}
	public Long getProductOptionValueId() {
		return productOptionValueId;
	}
	public void setProductOptionValueId(Long productOptionValueId) {
		this.productOptionValueId = productOptionValueId;
	}
}
