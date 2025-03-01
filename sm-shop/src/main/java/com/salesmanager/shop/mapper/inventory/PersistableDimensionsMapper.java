package com.salesmanager.shop.mapper.inventory;

import com.salesmanager.core.model.catalog.product.ProductDimensions;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.catalog.product.inventory.PersistableProductDimensions;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class PersistableDimensionsMapper implements Mapper<PersistableProductDimensions, ProductDimensions> {

    @Override
    public ProductDimensions convert(PersistableProductDimensions source, MerchantStore store, Language language) {
        ProductDimensions productDimensions = new ProductDimensions();

        return merge(source, productDimensions, store, language);
    }

    @Override
    public ProductDimensions merge(PersistableProductDimensions source, ProductDimensions destination, MerchantStore store, Language language) {
        if (Objects.nonNull(source)) {
            destination.setLength(source.getLength());
            destination.setHeight(source.getHeight());
            destination.setWeight(source.getWeight());
            destination.setWidth(source.getWidth());
        }

        return destination;
    }
}
