package com.salesmanager.shop.mapper.inventory;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.catalog.product.PersistableProductPrice;
import com.salesmanager.core.model.catalog.product.price.ProductPrice;
import org.springframework.stereotype.Component;

@Component
public class PersistableProductPriceMapper implements Mapper<PersistableProductPrice, ProductPrice> {
    @Override
    public ProductPrice convert(PersistableProductPrice source, MerchantStore store, Language language) {
        ProductPrice price = new ProductPrice();
        return merge(source, price, store, language);
    }

    @Override
    public ProductPrice merge(PersistableProductPrice source, ProductPrice destination, MerchantStore store, Language language) {

        destination.setDefaultPrice(source.isDefaultPrice());
        destination.setProductPriceAmount(source.getOriginalPrice());
        destination.setCode(source.getCode());
        destination.setProductPriceSpecialAmount(source.getDiscountedPrice());

        return destination;
    }
}
