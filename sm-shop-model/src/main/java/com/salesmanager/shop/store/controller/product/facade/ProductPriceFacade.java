package com.salesmanager.shop.store.controller.product.facade;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.catalog.product.PersistableProductPrice;
import com.salesmanager.shop.model.catalog.product.ReadableProductPrice;

public interface ProductPriceFacade {

    ReadableProductPrice create(PersistableProductPrice productPrice, Long productId, Long availabilityId, MerchantStore store,
                                Language language) throws Exception;

    ReadableProductPrice update(PersistableProductPrice productPrice, Long productId, Long availabilityId, MerchantStore store,
                                Language language) throws Exception;

    ReadableProductPrice get(Long productId, Long availabilityId , Long priceId, MerchantStore store, Language language) throws Exception;

    void delete(Long productId, Long availabilityId, Long priceId, MerchantStore store, Language language) throws Exception;
}
