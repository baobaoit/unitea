package com.salesmanager.shop.store.facade.product;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.catalog.product.availability.ProductAvailabilityService;
import com.salesmanager.core.business.services.catalog.product.price.ProductPriceService;
import com.salesmanager.core.business.services.reference.language.LanguageService;
import com.salesmanager.core.model.catalog.product.availability.ProductAvailability;
import com.salesmanager.core.model.catalog.product.price.ProductPrice;
import com.salesmanager.core.model.catalog.product.price.ProductPriceDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.inventory.PersistableProductPriceMapper;
import com.salesmanager.shop.model.catalog.product.PersistableProductPrice;
import com.salesmanager.shop.model.catalog.product.ReadableProductPrice;
import com.salesmanager.shop.populator.catalog.ReadableProductPricePopulator;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.controller.product.facade.ProductPriceFacade;
import com.salesmanager.shop.utils.DateUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import static com.salesmanager.core.business.utils.NumberUtils.isPositive;

@Service("productPriceFacade")
public class ProductPriceFacadeImpl implements ProductPriceFacade {

    @Inject
    private PricingService pricingService;

    @Inject
    private LanguageService languageService;

    @Inject
    private ProductAvailabilityService productAvailabilityService;

    @Inject
    private ProductPriceService productPriceService;

    @Inject
    private PersistableProductPriceMapper productPriceMapper;

    @Override
    public ReadableProductPrice create(PersistableProductPrice productPrice, Long productId, Long availabilityId,
                                       MerchantStore store, Language language) throws Exception {

        ProductAvailability availability = getAvailabilityById(store, availabilityId);

        checkAssociate(productId, availability.getProduct().getId());

        ProductPrice price = productPriceMapper.convert(productPrice, store, language);

        price.setProductAvailability(availability);

        if(Objects.nonNull(productPrice.getDiscountStartDate())) {
            Date startDate = DateUtil.getDate(productPrice.getDiscountStartDate());
            price.setProductPriceSpecialStartDate(startDate);
        }
        if(Objects.nonNull(productPrice.getDiscountEndDate())) {
            Date endDate = DateUtil.getDate(productPrice.getDiscountEndDate());
            price.setProductPriceSpecialEndDate(endDate);
        }

        Set<ProductPriceDescription> descs = getProductPriceDescriptions(price, productPrice.getDescriptions());
        price.setDescriptions(descs);

        availability.getPrices().add(price);

        price = productPriceService.saveAndReturn(price);

        ReadableProductPricePopulator populator = new ReadableProductPricePopulator();
        populator.setPricingService(pricingService);

        return populate(price, new ReadableProductPrice(), store, language);
    }

    @Override
    public ReadableProductPrice update(PersistableProductPrice productPrice, Long productId, Long availabilityId, MerchantStore store, Language language) throws Exception {

        ProductAvailability availability = getAvailabilityById(store, availabilityId);

        checkAssociate(productId, availability.getProduct().getId());

        ProductPrice price = availability.getPrices().stream().filter(p -> p.getId().equals(productPrice.getId()))
                .findAny()
                .orElseThrow(() -> new ResourceNotFoundException("Product price with id [" + productPrice.getId() + "] not found for product availability id [" + availabilityId + "]"));

        price = productPriceMapper.merge(productPrice, price, store, language);

        if(Objects.nonNull(productPrice.getDiscountStartDate())) {
            Date startDate = DateUtil.getDate(productPrice.getDiscountStartDate());
            price.setProductPriceSpecialStartDate(startDate);
        }
        if(Objects.nonNull(productPrice.getDiscountEndDate())) {
            Date endDate = DateUtil.getDate(productPrice.getDiscountEndDate());
            price.setProductPriceSpecialEndDate(endDate);
        }

        Set<ProductPriceDescription> descs = getProductPriceDescriptions(price, productPrice.getDescriptions());
        price.setDescriptions(descs);

        price = productPriceService.saveAndReturn(price);

        ReadableProductPricePopulator populator = new ReadableProductPricePopulator();
        populator.setPricingService(pricingService);

        return populate(price, new ReadableProductPrice(), store, language);
    }

    @Override
    public ReadableProductPrice get(Long productId, Long availabilityId, Long priceId, MerchantStore store, Language language) throws Exception {
        ProductAvailability availability = getAvailabilityById(store, availabilityId);

        checkAssociate(productId, availability.getProduct().getId());

        ProductPrice price = availability.getPrices().stream().filter(p -> p.getId().equals(priceId))
                .findAny()
                .orElseThrow(() -> new ResourceNotFoundException("Product price with id [" + priceId + "] not found for product availability id [" + availabilityId + "]"));

        ReadableProductPricePopulator populator = new ReadableProductPricePopulator();
        populator.setPricingService(pricingService);

        return populate(price, new ReadableProductPrice(), store, language);
    }

    @Override
    public void delete(Long productId, Long availabilityId, Long priceId, MerchantStore store, Language language) throws Exception {
        ProductAvailability availability = getAvailabilityById(store, availabilityId);

        if (availability.getPrices().size() > 1) {
            checkAssociate(productId, availability.getProduct().getId());

            ProductPrice price = availability.getPrices().stream().filter(p -> p.getId().equals(priceId))
                    .findAny()
                    .orElseThrow(() -> new ResourceNotFoundException("Product price with id [" + priceId + "] not found for product availability id [" + availabilityId + "]"));

            availability.getPrices().remove(price);
            productPriceService.delete(price);
        } else {
            throw new ServiceException("Product availability must have at least 1 product price when deleting", null);
        }


    }

    private ReadableProductPrice populate(ProductPrice source, ReadableProductPrice destination, MerchantStore store, Language language) throws Exception {
        ReadableProductPricePopulator populator = new ReadableProductPricePopulator();
        populator.setPricingService(pricingService);

        return populator.populate(source, destination, store, language);
    }


    private void checkAssociate(Long productId, Long availabilityId) {
        if (!availabilityId.equals(productId)) {
            throw new ResourceNotFoundException(
                    "Availability with id [" + availabilityId + "] not found for product id [" + productId + "]");
        }
    }

    private ProductAvailability getAvailabilityById(MerchantStore store, Long id) {
        return productAvailabilityService.getById(id, store)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory with id [" + id + "] not found"));
    }

    private Set<ProductPriceDescription> getProductPriceDescriptions(ProductPrice price, List<com.salesmanager.shop.model.catalog.product.ProductPriceDescription> descriptions) throws ConversionException {
        if (CollectionUtils.isEmpty(descriptions)) {
            return Collections.emptySet();
        }
        Set<ProductPriceDescription> descs = new HashSet<ProductPriceDescription>();
        for(com.salesmanager.shop.model.catalog.product.ProductPriceDescription desc : descriptions) {
            ProductPriceDescription description = null;
            if(CollectionUtils.isNotEmpty(price.getDescriptions())) {
                for(ProductPriceDescription d : price.getDescriptions()) {
                    if(isPositive(desc.getId()) && desc.getId().equals(d.getId())) {
                        desc.setId(d.getId());
                    }
                }
            }
            description = getDescription(desc);
            description.setProductPrice(price);
            descs.add(description);
        }
        return descs;
    }

    private ProductPriceDescription getDescription(com.salesmanager.shop.model.catalog.product.ProductPriceDescription desc) throws ConversionException {
        ProductPriceDescription target = new ProductPriceDescription();
        target.setDescription(desc.getDescription());
        target.setName(desc.getName());
        target.setTitle(desc.getTitle());
        target.setId(null);
        if(isPositive(desc.getId())) {
            target.setId(desc.getId());
        }
        Language lang = getLanguage(desc);
        target.setLanguage(lang);
        return target;

    }

    private Language getLanguage(com.salesmanager.shop.model.catalog.product.ProductPriceDescription desc) throws ConversionException {
        try {
            return Optional.ofNullable(languageService.getByCode(desc.getLanguage()))
                    .orElseThrow(() -> new ConversionException("Language is null for code " + desc.getLanguage() + " use language ISO code [en, fr ...]"));
        } catch (ServiceException e) {
            throw new ConversionException(e);
        }
    }
}
