package com.salesmanager.shop.utils;

import com.salesmanager.core.model.merchant.MerchantStore;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.Optional;

public final class TimeUtils {

	private static final Logger LOGGER = LoggerFactory.getLogger(TimeUtils.class);

	private static final String HH_MM_FORMAT = "HH:mm";
	private static final String DEFAULT_ZONE_ID_STRING = "US/Michigan";
	private static final ZoneId DEFAULT_ZONE_ID = ZoneId.of(DEFAULT_ZONE_ID_STRING);
	private static final String ZONE_ID_STRING_FORMAT = "%s/%s";

	/**
	 * Format with the pattern {@value HH_MM_FORMAT} and the current time at <code>merchantStore</code>
	 * @param merchantStore
	 * @return
	 */
	public static String formatMerchantTimeNow(MerchantStore merchantStore) {
		return formatMerchantTimeNow(merchantStore, HH_MM_FORMAT);
	}

	public static String formatMerchantTimeNow(MerchantStore merchantStore, String formatTimePattern) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern(Optional.ofNullable(formatTimePattern).orElse(HH_MM_FORMAT));

		com.salesmanager.core.model.reference.country.Country country = merchantStore.getCountry();
		com.salesmanager.core.model.reference.zone.Zone zone = merchantStore.getZone();
		if (Objects.isNull(country) || Objects.isNull(zone)) {
			LOGGER.warn("Country or zone is null so it will get the default time.");
			return formatDefaultTimeNow();
		}

		String countryCode = country.getIsoCode();
		String zoneName = zone.getName();
		if (StringUtils.isBlank(countryCode) || StringUtils.isBlank(zoneName)) {
			LOGGER.warn("Country code or zone name is blank so it will get the default time.");
			return formatDefaultTimeNow();
		}

		String storeZoneIdValue = String.format(ZONE_ID_STRING_FORMAT, countryCode, zoneName);
		ZoneId storeZoneId = ZoneId.of(storeZoneIdValue);
		LocalTime now = LocalTime.now(Optional.of(storeZoneId).orElse(DEFAULT_ZONE_ID));

		return format.format(now);
	}

	/**
	 * Format with the pattern {@value HH_MM_FORMAT} and the current time at {@value DEFAULT_ZONE_ID_STRING}
	 * @return
	 */
	public static String formatDefaultTimeNow() {
		DateTimeFormatter format = DateTimeFormatter.ofPattern(HH_MM_FORMAT);

		return format.format(LocalTime.now(DEFAULT_ZONE_ID));
	}
}
