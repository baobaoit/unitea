package com.salesmanager.shop.store.controller.notify.facade;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.user.UserService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.IntegrationConfiguration;
import com.salesmanager.core.model.user.User;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.mail.model.UpdatePaymentMethodInfo;
import com.salesmanager.shop.utils.AuthorizationUtils;
import com.salesmanager.shop.utils.EmailTemplatesUtils;
import com.salesmanager.shop.utils.LocaleUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service("notifyFacade")
public class NotifyFacadeImpl implements NotifyFacade {

	@Inject
	private UserService userService;

	@Inject
	private EmailTemplatesUtils emailTemplatesUtils;

	@Inject
	private AuthorizationUtils authorizationUtils;

    @Override
	public void updatePaymentMethod(IntegrationConfiguration configuration, MerchantStore merchantStore,
                                    Locale customerLocale, HttpServletRequest request) throws ServiceException {

		String user = authorizationUtils.authenticatedUser();
		String ipAddress = getClientIP(request);

		List<String> toEmails = userService.listByGroupsAndStore(Collections.singletonList(Constants.GROUP_SUPERADMIN), merchantStore).stream()
				.map(User::getAdminEmail)
				.collect(Collectors.toList());

		emailTemplatesUtils.sendUpdatePaymentMethodEmail(UpdatePaymentMethodInfo.builder()
				.username(user)
				.ipAddress(ipAddress)
				.toEmails(toEmails)
				.configuration(configuration)
				.build(), merchantStore, customerLocale);
	}

    @Override
    public void updatePaymentMethod(String code, MerchantStore merchantStore, Locale customerLocale, HttpServletRequest request) throws ServiceException {
        IntegrationConfiguration configuration = new IntegrationConfiguration();
        configuration.setActive(false);
        configuration.setModuleCode(code);
        configuration.setDefaultSelected(false);

        updatePaymentMethod(configuration, merchantStore, LocaleUtils.getLocale(merchantStore.getDefaultLanguage()), request);
    }

    private String getClientIP(HttpServletRequest request) {

		String remoteAddr = "";

		if (request != null) {
			remoteAddr = request.getHeader("X-FORWARDED-FOR");
			if (StringUtils.isEmpty(remoteAddr)) {
				remoteAddr = request.getRemoteAddr();
			}
		}
		return remoteAddr;
	}
}
