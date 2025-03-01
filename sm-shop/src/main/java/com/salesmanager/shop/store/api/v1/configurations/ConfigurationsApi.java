package com.salesmanager.shop.store.api.v1.configurations;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.model.configuration.PersistableBusinessTimeConfiguration;
import com.salesmanager.shop.model.configuration.PersistableConvenienceFeeConfiguration;
import com.salesmanager.shop.model.configuration.PersistableCoordinateConfiguration;
import com.salesmanager.shop.model.configuration.PersistableTaxConfiguration;
import com.salesmanager.shop.model.configuration.PersistableTipConfiguration;
import com.salesmanager.shop.model.configuration.ReadableBusinessTimeConfiguration;
import com.salesmanager.shop.model.configuration.ReadableConvenienceFeeConfiguration;
import com.salesmanager.shop.model.configuration.ReadableCoordinateConfiguration;
import com.salesmanager.shop.model.configuration.ReadableTaxConfiguration;
import com.salesmanager.shop.model.configuration.ReadableTipConfiguration;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.api.exception.UnauthorizedException;
import com.salesmanager.shop.store.controller.configurations.BusinessTimeConfigurationFacade;
import com.salesmanager.shop.store.controller.configurations.ConvenienceFeeConfigurationFacade;
import com.salesmanager.shop.store.controller.configurations.CoordinateConfigurationFacade;
import com.salesmanager.shop.store.controller.configurations.TaxConfigurationsFacade;
import com.salesmanager.shop.store.controller.configurations.TipConfigurationFacade;
import com.salesmanager.shop.utils.AuthorizationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.configuration.ReadableConfiguration;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.SwaggerDefinition;
import io.swagger.annotations.Tag;
import springfox.documentation.annotations.ApiIgnore;

import javax.inject.Inject;

@RestController
@RequestMapping(value = "/api/v1")
@Api(tags = { "Configurations management" })
@SwaggerDefinition(tags = {
		@Tag(name = "Configurations management", description = "Configurations management for modules") })
public class ConfigurationsApi {

	@Inject
	private TaxConfigurationsFacade taxConfigurationsFacade;

	@Inject
	private TipConfigurationFacade tipConfigurationFacade;

	@Inject
	private AuthorizationUtils authorizationUtils;

	@Inject
	private BusinessTimeConfigurationFacade businessTimeConfigurationFacade;

	@Inject
	private CoordinateConfigurationFacade coordinateConfigurationFacade;

	@Inject
	private ConvenienceFeeConfigurationFacade convenienceFeeConfigurationFacade;
	
	  /** Configurations of modules */
	  @PostMapping("/private/configurations/payment")
	  @ApiOperation(
	      httpMethod = "POST",
	      value = "Manages payment configurations",
	      notes = "Requires administration access",
	      produces = "application/json",
	      response = Void.class)
	  @ApiImplicitParams({
	      @ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT")
	  })
	  public Void create(
	      @ApiIgnore MerchantStore merchantStore,
	      @ApiIgnore Language language) {
	      //return customerFacade.create(customer, merchantStore, language);
		  return null;

	  }
	  
	  
	  /** Configurations of payment modules */
	  @GetMapping("/private/configurations/payment")
	  @ApiOperation(
	      httpMethod = "GET",
	      value = "List payment configurations summary",
	      notes = "Requires administration access",
	      produces = "application/json",
	      response = List.class)
	  @ApiImplicitParams({
	      @ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT")
	  })
	  public List<ReadableConfiguration> listPaymentConfigurations(
	      @ApiIgnore MerchantStore merchantStore,
	      @ApiIgnore Language language) {
	      //return customerFacade.create(customer, merchantStore, language);
		  return null;

	  }
	  
	  
	  
	  
	  /** Configurations of shipping modules */
	  @GetMapping("/private/configurations/shipping")
	  @ApiOperation(
	      httpMethod = "GET",
	      value = "List shipping configurations summary",
	      notes = "Requires administration access",
	      produces = "application/json",
	      response = List.class)
	  @ApiImplicitParams({
	      @ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT")
	  })
	  public List<ReadableConfiguration> listShippingConfigurations(
	      @ApiIgnore MerchantStore merchantStore,
	      @ApiIgnore Language language) {
	      //return customerFacade.create(customer, merchantStore, language);
		  return null;

	  }

	@GetMapping("/private/configurations/taxes")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get current tax basis calculation",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableTaxConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableTaxConfiguration getTaxConfiguration(@ApiIgnore MerchantStore merchantStore, @ApiIgnore Language language) throws ServiceException {
		checkUserPermissions(merchantStore);

		return taxConfigurationsFacade.getConfiguration(merchantStore, language);
	}

	@PutMapping("/private/configurations/taxes")
	@ApiOperation(
			httpMethod = "PUT",
			value = "Modify current tax basis calculation",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableTaxConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableTaxConfiguration updateTaxConfiguration(@RequestBody PersistableTaxConfiguration taxConfiguration,
														   @ApiIgnore MerchantStore merchantStore,
														   @ApiIgnore Language language) {

		checkUserPermissions(merchantStore);

		return taxConfigurationsFacade.saveConfiguration(taxConfiguration, merchantStore, language);
	}

	@GetMapping("/private/configurations/tip")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the tip configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableTipConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableTipConfiguration getTipConfiguration(@ApiIgnore MerchantStore merchantStore, @ApiIgnore Language language) throws ServiceException {
		try {

			checkUserPermissions(merchantStore);

			return tipConfigurationFacade.getConfiguration(merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
			}
			throw new ServiceRuntimeException("Error during retrieves tip configuration: " + message, e);
		}
	}

	@PutMapping("/private/configurations/tip")
	@ApiOperation(
			httpMethod = "PUT",
			value = "Modify current tip configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableTipConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableTipConfiguration updateTipConfiguration(@RequestBody PersistableTipConfiguration tipConfiguration,
														   @ApiIgnore MerchantStore merchantStore,
														   @ApiIgnore Language language) {

	  	try {

	  		checkUserPermissions(merchantStore);

			return tipConfigurationFacade.saveConfiguration(tipConfiguration, merchantStore, language);

	  	} catch (Exception e) {
	  		String message = e.getMessage();
	  		String errorCode = String.valueOf(HttpStatus.BAD_REQUEST.value());
	  		if (e instanceof ServiceRuntimeException) {
	  			message = ((ServiceRuntimeException) e).getErrorMessage();
	  			errorCode = ((ServiceRuntimeException) e).getErrorCode();
			}
			throw new ServiceRuntimeException(errorCode, "Error during saves tip configuration: " + message, e);
		}
	}

	@GetMapping("/private/configurations/business-time")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the business time configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableBusinessTimeConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableBusinessTimeConfiguration getBusinessTimeConfiguration(@ApiIgnore MerchantStore merchantStore, @ApiIgnore Language language) throws ServiceException {
		try {

			checkUserPermissions(merchantStore);

			return businessTimeConfigurationFacade.getConfiguration(merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
			}
			throw new ServiceRuntimeException("Error during retrieves business time configuration: " + message, e);
		}
	}

	@GetMapping("/configurations/business-time")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the business time configuration (Shop site)",
			produces = "application/json",
			response = ReadableBusinessTimeConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableBusinessTimeConfiguration getBusinessTimeConfigurationShop(@ApiIgnore MerchantStore merchantStore, 
																			  @ApiIgnore Language language) throws ServiceException {

		try {

			return businessTimeConfigurationFacade.getConfiguration(merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
			}
			throw new ServiceRuntimeException("Error during retrieves business time configuration: " + message, e);
		}
	}

	@PutMapping("/private/configurations/business-time")
	@ApiOperation(
			httpMethod = "PUT",
			value = "Modify the business time configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableBusinessTimeConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableBusinessTimeConfiguration updateBusinessTimeConfiguration(@RequestBody PersistableBusinessTimeConfiguration configuration,
																			 @ApiIgnore MerchantStore merchantStore,
																			 @ApiIgnore Language language) {

		try {

			checkUserPermissions(merchantStore);

			return businessTimeConfigurationFacade.saveConfiguration(configuration, merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			String errorCode = String.valueOf(HttpStatus.BAD_REQUEST.value());
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
				errorCode = ((ServiceRuntimeException) e).getErrorCode();
			}
			throw new ServiceRuntimeException(errorCode, "Error during saves business time configuration: " + message, e);
		}
	}

	@GetMapping("/private/configurations/coordinate")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the store's coordinate configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableCoordinateConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableCoordinateConfiguration getCoordinateConfiguration(@ApiIgnore MerchantStore merchantStore, @ApiIgnore Language language) {
		try {

			checkUserPermissions(merchantStore);

			return coordinateConfigurationFacade.getConfiguration(merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
			}
			throw new ServiceRuntimeException("Error during retrieves coordinate time configuration: " + message, e);
		}
	}

	@PutMapping("/private/configurations/coordinate")
	@ApiOperation(
			httpMethod = "PUT",
			value = "Modify the store's coordinate configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableCoordinateConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableCoordinateConfiguration updateCoordinateConfiguration(@RequestBody PersistableCoordinateConfiguration configuration,
																		 @ApiIgnore MerchantStore merchantStore,
																		 @ApiIgnore Language language) {

		  try {

			  checkUserPermissions(merchantStore);

			  return coordinateConfigurationFacade.saveConfiguration(configuration, merchantStore, language);

		  } catch (Exception e) {
			  String message = e.getMessage();
			  String errorCode = String.valueOf(HttpStatus.BAD_REQUEST.value());
			  if (e instanceof ServiceRuntimeException) {
				  message = ((ServiceRuntimeException) e).getErrorMessage();
				  errorCode = ((ServiceRuntimeException) e).getErrorCode();
			  }
			  throw new ServiceRuntimeException(errorCode, "Error during saves coordinate configuration: " + message, e);
		  }
	}

	@GetMapping("/private/configurations/convenience-fee")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the store's convenience fee configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableConvenienceFeeConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableConvenienceFeeConfiguration getConvenienceFeeConfiguration(@ApiIgnore MerchantStore merchantStore,
																			  @ApiIgnore Language language) {

		try {

			checkUserPermissions(merchantStore);

			return convenienceFeeConfigurationFacade.getConfiguration(merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
			}
			throw new ServiceRuntimeException("Error during retrieves convenience fee configuration: " + message, e);
		}
	}

	@PutMapping("/private/configurations/convenience-fee")
	@ApiOperation(
			httpMethod = "PUT",
			value = "Modify the store's convenience fee configuration",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableConvenienceFeeConfiguration.class)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en") })
	public ReadableConvenienceFeeConfiguration updateConvenienceFeeConfiguration(
			@RequestBody PersistableConvenienceFeeConfiguration configuration,
			@ApiIgnore MerchantStore merchantStore,
			@ApiIgnore Language language) {

		try {

			checkUserPermissions(merchantStore);

			return convenienceFeeConfigurationFacade.saveConfiguration(configuration, merchantStore, language);

		} catch (Exception e) {
			String message = e.getMessage();
			String errorCode = String.valueOf(HttpStatus.BAD_REQUEST.value());
			if (e instanceof ServiceRuntimeException) {
				message = ((ServiceRuntimeException) e).getErrorMessage();
				errorCode = ((ServiceRuntimeException) e).getErrorCode();
			}
			throw new ServiceRuntimeException(errorCode, "Error during saves convenience fee configuration: " + message, e);
		}
	}

	private void checkUserPermissions(MerchantStore merchantStore) {
		String user = authorizationUtils.authenticatedUser();

		if (user == null) {
			throw new UnauthorizedException();
		}

		authorizationUtils.authorizeUser(user, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN)
				.collect(Collectors.toList()), merchantStore);
	}

}
