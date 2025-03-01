package com.salesmanager.shop.store.api.v1.statistic;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderTipCriteria;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.model.statistic.ReadableStatisticInfo;
import com.salesmanager.shop.model.statistic.ReadableTipsToday;
import com.salesmanager.shop.model.tip.ReadableOrderTipList;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.statistic.facade.StatisticFacade;
import com.salesmanager.shop.store.controller.tip.facade.TipStatisticFacade;
import com.salesmanager.shop.utils.AuthorizationUtils;
import com.salesmanager.shop.utils.DateUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.SwaggerDefinition;
import io.swagger.annotations.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.inject.Inject;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RestController
@RequestMapping("/api/v1")
@Api(tags = { "Statistic and Reports API" })
@SwaggerDefinition(tags = {
		@Tag(name = "Statistic and Reports resource", description = "The Statistic and Reports of a Merchant store") })
public class StatisticApi {

	@Inject
	private TipStatisticFacade tipStatisticFacade;

	@Inject
	private AuthorizationUtils authorizationUtils;

	@Inject
	private StatisticFacade statisticFacade;

	@GetMapping("/private/tip-reports")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the tip reports data",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableOrderTipList.class)
	@ApiImplicitParams({@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en")})
	public ReadableOrderTipList tipReports(@RequestParam(required = false, defaultValue = "25") Integer count,
										   @RequestParam(required = false, defaultValue = "0") Integer page,
										   @RequestParam(required = false) String fromDate,
										   @RequestParam(required = false) String toDate,
										   @RequestParam(required = false) List<Long> orderId,
										   @ApiIgnore MerchantStore merchantStore,
										   @ApiIgnore Language language) {

		try {
			OrderTipCriteria orderTipCriteria = new OrderTipCriteria();
			orderTipCriteria.setPageSize(count);
			orderTipCriteria.setStartPage(page);

			orderTipCriteria.setId(orderId);
			validateOrderTipDateCriteria(orderTipCriteria, fromDate, toDate);

			String user = authorizationUtils.authenticatedUser();
			authorizationUtils.authorizeUser(user, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN,
					Constants.GROUP_ADMIN_ORDER, Constants.GROUP_ADMIN_RETAIL).collect(Collectors.toList()), merchantStore);

			return tipStatisticFacade.getReadableOrderTipList(orderTipCriteria, merchantStore);

		} catch (Exception e) {
			throw new ServiceRuntimeException(String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
		}
	}

	private void validateOrderTipDateCriteria(OrderTipCriteria orderTipCriteria, String fromDate, String toDate) throws Exception {
		java.util.Date dToDate = toDate == null ? DateUtil.getDate() : DateUtil.getDate(toDate);
		java.util.Date dFromDate = fromDate == null ? dToDate : DateUtil.getDate(fromDate);

		orderTipCriteria.setFromDate(dFromDate);
		orderTipCriteria.setToDate(dToDate);
	}

	@GetMapping("/private/statistic")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the summary of the brand (total revenue, orders, stores, customers)",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableStatisticInfo.class)
	@ApiImplicitParams({@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT")})
	public ReadableStatisticInfo getStatistic(@RequestParam(required = false) String date,
											  @ApiIgnore MerchantStore merchantStore) {

		try {

			String user = authorizationUtils.authenticatedUser();
			authorizationUtils.authorizeUser(user, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN,
					Constants.GROUP_ADMIN_ORDER, Constants.GROUP_ADMIN_RETAIL).collect(Collectors.toList()), merchantStore);

			return statisticFacade.getStatistic(date, merchantStore);

		} catch (Exception e) {
			throw new ServiceRuntimeException(String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
		}
	}

	@GetMapping("/private/tips-today")
	@ApiOperation(
			httpMethod = "GET",
			value = "Get the total tips today",
			notes = "Requires administration access",
			produces = "application/json",
			response = ReadableTipsToday.class)
	@ApiImplicitParams({@ApiImplicitParam(name = "store", dataType = "string", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "string", defaultValue = "en")})
	public ReadableTipsToday tipsToday(@ApiIgnore MerchantStore merchantStore,
									   @ApiIgnore Language language) {

		try {

			String user = authorizationUtils.authenticatedUser();
			authorizationUtils.authorizeUser(user, Stream.of(Constants.GROUP_SUPERADMIN, Constants.GROUP_ADMIN,
					Constants.GROUP_ADMIN_ORDER, Constants.GROUP_ADMIN_RETAIL).collect(Collectors.toList()), merchantStore);

			return tipStatisticFacade.getTipsToday(merchantStore);

		} catch (Exception e) {
			throw new ServiceRuntimeException(String.valueOf(HttpStatus.BAD_REQUEST.value()), e.getMessage());
		}
	}

}
