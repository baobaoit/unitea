package com.salesmanager.shop.store.api.v1.product;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.model.catalog.product.PersistableProductPrice;
import com.salesmanager.shop.model.catalog.product.ReadableProductPrice;
import com.salesmanager.shop.store.api.exception.UnauthorizedException;
import com.salesmanager.shop.store.controller.product.facade.ProductPriceFacade;
import com.salesmanager.shop.store.controller.user.facade.UserFacade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.catalog.product.inventory.PersistableInventory;
import com.salesmanager.shop.model.catalog.product.inventory.ReadableInventory;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.store.controller.product.facade.ProductInventoryFacade;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.SwaggerDefinition;
import io.swagger.annotations.Tag;
import springfox.documentation.annotations.ApiIgnore;

import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/api/v1")
@Api(tags = {"Product inventory resource (Product Inventory Api)"})
@SwaggerDefinition(tags = {
    @Tag(name = "Product inventory resource", description = "Manage inventory for a given product")
})
public class ProductInventoryApi {
  
  @Autowired
  private ProductInventoryFacade productInventoryFacade;

  @Inject
  private ProductPriceFacade productPriceFacade;

  @Inject
  private UserFacade userFacade;
  
  private static final Logger LOGGER = LoggerFactory.getLogger(ProductInventoryApi.class);

  @ResponseStatus(HttpStatus.CREATED)
  @RequestMapping(
      value = {"/private/product/inventory"},
      method = RequestMethod.POST)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public @ResponseBody ReadableInventory create(
      @Valid @RequestBody PersistableInventory inventory,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language) {
    return productInventoryFacade.add(inventory.getProductId(), inventory, merchantStore, language);
  }
  
  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
      value = {"/private/product/{productId}/inventory/{id}"},
      method = RequestMethod.PUT)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public void update(
      @PathVariable Long productId,
      @PathVariable Long id,
      @Valid @RequestBody PersistableInventory inventory,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language,
      HttpServletRequest request,
      HttpServletResponse response) {
      inventory.setId(id);
      inventory.setProductId(productId);
      productInventoryFacade.update(productId, inventory, merchantStore, language);

  }
  
  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
      value = {"/private/product/inventory/{id}"},
      method = RequestMethod.DELETE)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public void delete(
            @PathVariable Long id,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language,
      HttpServletRequest request,
      HttpServletResponse response) {

    productInventoryFacade.delete(id, merchantStore);


  }
  
  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
      value = {"/private/product/{id}/inventory"},
      method = RequestMethod.GET)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public @ResponseBody
  ReadableEntityList<ReadableInventory> get(
            @PathVariable Long id,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language,
            @RequestParam(value = "child", required = false) String child,
            @RequestParam(value = "page", required = false, defaultValue="0") Integer page,
            @RequestParam(value = "count", required = false, defaultValue="10") Integer count) {
    
    
      return productInventoryFacade.getInventory(id, merchantStore, child, language, page, count);

  }
  
  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
      value = {"/private/product/{id}/inventory/{inventoryId}"},
      method = RequestMethod.GET)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public @ResponseBody ReadableInventory get(
            @PathVariable Long id,
            @PathVariable Long inventoryId,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language,
      HttpServletRequest request,
      HttpServletResponse response) {
    
    
      return productInventoryFacade.get(id, inventoryId, merchantStore, language);

  }
  
  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
      value = {"/private/product/{id}/inventory/store/{code}"},
      method = RequestMethod.GET)
  @ApiImplicitParams({
      @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
      @ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en")
  })
  public @ResponseBody ReadableInventory get(
            @PathVariable Long id,
            @PathVariable String code,
            @ApiIgnore MerchantStore merchantStore,
            @ApiIgnore Language language,
      HttpServletRequest request,
      HttpServletResponse response) {
    
    
      return productInventoryFacade.get(id, code, language);

  }


  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
          value = {"/private/product/{productId}/inventory/{inventoryId}/price"},
          method = RequestMethod.POST)
  public @ResponseBody ReadableProductPrice createProductPrice(@RequestBody PersistableProductPrice productPrice,
                                                               @PathVariable Long productId,
                                                               @PathVariable Long inventoryId,
                                                               @ApiIgnore MerchantStore merchantStore,
                                                               @ApiIgnore Language language) throws Exception {
    String authenticatedUser = userFacade.authenticatedUser();
    if (authenticatedUser == null) {
      throw new UnauthorizedException();
    }

    userFacade.authorizedGroup(authenticatedUser, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN).collect(Collectors.toList()));

    return productPriceFacade.create(productPrice, productId, inventoryId, merchantStore, language);

  }

  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
          value = {"/private/product/{productId}/inventory/{inventoryId}/price"},
          method = RequestMethod.PUT)
  public @ResponseBody ReadableProductPrice updateProductPrice(@RequestBody PersistableProductPrice productPrice,
                                                               @PathVariable Long productId,
                                                               @PathVariable Long inventoryId,
                                                               @ApiIgnore MerchantStore merchantStore,
                                                               @ApiIgnore Language language) throws Exception {

    String authenticatedUser = userFacade.authenticatedUser();
    if (authenticatedUser == null) {
      throw new UnauthorizedException();
    }

    userFacade.authorizedGroup(authenticatedUser, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN).collect(Collectors.toList()));

    return productPriceFacade.update(productPrice, productId, inventoryId, merchantStore, language);

  }

  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
          value = {"/private/product/{productId}/inventory/{inventoryId}/price/{priceId}"},
          method = RequestMethod.GET)
  public @ResponseBody ReadableProductPrice getProductPrice( @PathVariable Long productId,
                                                             @PathVariable Long inventoryId,
                                                             @PathVariable Long priceId,
                                                             @ApiIgnore MerchantStore merchantStore,
                                                             @ApiIgnore Language language) throws Exception {

    String authenticatedUser = userFacade.authenticatedUser();
    if (authenticatedUser == null) {
      throw new UnauthorizedException();
    }

    userFacade.authorizedGroup(authenticatedUser, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN).collect(Collectors.toList()));

    return productPriceFacade.get(productId, inventoryId, priceId, merchantStore, language);

  }

  @ResponseStatus(HttpStatus.OK)
  @RequestMapping(
          value = {"/private/product/{productId}/inventory/{inventoryId}/price/{priceId}"},
          method = RequestMethod.DELETE)
  public void deleteProductPrice( @PathVariable Long productId,
                                                             @PathVariable Long inventoryId,
                                                             @PathVariable Long priceId,
                                                             @ApiIgnore MerchantStore merchantStore,
                                                             @ApiIgnore Language language) throws Exception {

    String authenticatedUser = userFacade.authenticatedUser();
    if (authenticatedUser == null) {
      throw new UnauthorizedException();
    }

    userFacade.authorizedGroup(authenticatedUser, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN).collect(Collectors.toList()));

    productPriceFacade.delete(productId, inventoryId, priceId, merchantStore, language);

  }

}
