package com.salesmanager.shop.store.api.v1.security;

import com.salesmanager.shop.model.security.PersistableGoogleReCaptcha;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.security.facade.CaptchaFacade;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * API for processing the captcha token.
 *
 * @author Bao Le
 */
@RestController
@RequestMapping("/api/v1/captchas")
@Api(tags = {"Captcha API"})
public class CaptchaApi {

	private static final Logger log = LoggerFactory.getLogger(CaptchaApi.class);

	private static final String HTTP_STATUS_BAD_REQUEST_ERROR_CODE = String.valueOf(HttpStatus.BAD_REQUEST.value());

	private CaptchaFacade captchaFacade;

	@PostMapping("/verify")
	@ApiOperation(
			httpMethod = "POST",
			value = "Verify Google reCaptcha v3 token",
			produces = "application/json",
			response = Boolean.class)
	public boolean verify(@RequestBody @Valid PersistableGoogleReCaptcha reCaptcha) {
		try {
			return captchaFacade.verify(reCaptcha);
		} catch (Exception e) {
			log.error("An error occurred during the verify Google reCaptcha token: {}", e.getMessage(), e);
			throw new ServiceRuntimeException(HTTP_STATUS_BAD_REQUEST_ERROR_CODE, e.getMessage());
		}
	}

	@Autowired
	public void setCaptchaFacade(CaptchaFacade captchaFacade) {
		this.captchaFacade = captchaFacade;
	}
}
