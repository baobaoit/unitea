package com.salesmanager.shop.store.facade.security;

import com.salesmanager.shop.model.security.PersistableGoogleReCaptcha;
import com.salesmanager.shop.store.controller.security.facade.CaptchaFacade;
import com.salesmanager.shop.utils.CaptchaRequestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.salesmanager.shop.utils.CaptchaRequestUtils.USE_RECAPTCHA_V2;

@Service
public class CaptchaFacadeImpl implements CaptchaFacade {

	private static final double THRESHOLD_MIN = 0.0;
	private static final double THRESHOLD_MAX = 1.0;

	private CaptchaRequestUtils captchaRequestUtils;

	@Override
	public boolean verify(PersistableGoogleReCaptcha reCaptcha) throws Exception {
		validateReCaptchaRequest(reCaptcha);

		return captchaRequestUtils.checkCaptcha(reCaptcha.getToken(), !USE_RECAPTCHA_V2,
				score -> score.compareTo(reCaptcha.getThreshold()) >= 0);
	}

	private void validateReCaptchaRequest(PersistableGoogleReCaptcha reCaptcha) throws Exception {
		final String reCaptchaToken = reCaptcha.getToken();
		if (StringUtils.isBlank(reCaptchaToken)) {
			throw new Exception("The Google reCaptcha v3 token [" + reCaptchaToken + "] is invalid");
		}

		final double threshold = reCaptcha.getThreshold();
		if (Double.compare(threshold, THRESHOLD_MIN) < 0 || Double.compare(threshold, THRESHOLD_MAX) > 0) {
			throw new Exception("The threshold [" + threshold + "] is out of range [0.0, 1.0]");
		}
	}

	@Autowired
	public void setCaptchaRequestUtils(CaptchaRequestUtils captchaRequestUtils) {
		this.captchaRequestUtils = captchaRequestUtils;
	}

}
