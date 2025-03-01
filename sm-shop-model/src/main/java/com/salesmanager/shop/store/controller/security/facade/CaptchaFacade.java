package com.salesmanager.shop.store.controller.security.facade;

import com.salesmanager.shop.model.security.PersistableGoogleReCaptcha;

public interface CaptchaFacade {
	/**
	 * Verify Google reCaptcha v3 token
	 *
	 * @param reCaptcha
	 * @return
	 * @throws Exception
	 */
	boolean verify(PersistableGoogleReCaptcha reCaptcha) throws Exception;
}
