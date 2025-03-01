package com.salesmanager.shop.store.facade.businesstime;

import com.google.gson.Gson;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.business.BusinessTimeService;
import com.salesmanager.core.business.services.coordinate.CoordinateService;
import com.salesmanager.core.model.businesstime.BusinessTimeConfiguration;
import com.salesmanager.core.model.coordinate.CoordinateConfiguration;
import com.salesmanager.core.model.coordinate.StoreCoordinate;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.businesstime.BusinessTimeMapper;
import com.salesmanager.shop.model.configuration.PersistableBusinessTimeConfiguration;
import com.salesmanager.shop.model.configuration.ReadableBusinessTimeConfiguration;
import com.salesmanager.shop.model.google.GTimeZone;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.configurations.BusinessTimeConfigurationFacade;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.Instant;
import java.util.Objects;

@Service("businessTimeConfigurationFacade")
public class BusinessTimeConfigurationFacadeImpl implements BusinessTimeConfigurationFacade {

    private static final String METHOD_GET = "GET";

    @Value("${config.googleTimeZoneKey}")
    private String googleTimeZoneKey;

    @Inject
    private BusinessTimeMapper businessTimeMapper;

    @Inject
    private BusinessTimeService businessTimeService;

    @Inject
    private CoordinateService coordinateService;

    @Override
    public ReadableBusinessTimeConfiguration getConfiguration(MerchantStore store, Language language) {


        try {
            BusinessTimeConfiguration businessTimeConfiguration = businessTimeService.getConfiguration(store);

            ReadableBusinessTimeConfiguration configuration = new ReadableBusinessTimeConfiguration();

            if (Objects.nonNull(businessTimeConfiguration) && Objects.nonNull(businessTimeConfiguration.getBusinessSchedules())) {
                configuration = businessTimeMapper.toReadableBusinessTimeConfiguration(businessTimeConfiguration);
            }

            getTimeZone(configuration, store);

            return configuration;
        } catch (Exception e) {
            throw new ServiceRuntimeException(e.getMessage());
        }
    }

    @Override
    public ReadableBusinessTimeConfiguration saveConfiguration(PersistableBusinessTimeConfiguration configuration, MerchantStore store, Language language) {

        try {
            BusinessTimeConfiguration businessTimeConfiguration = businessTimeMapper.toBusinessTimeConfig(configuration);

            businessTimeService.saveConfiguration(businessTimeConfiguration, store);
            ReadableBusinessTimeConfiguration config = businessTimeMapper.toReadableBusinessTimeConfiguration(businessTimeConfiguration);

            getTimeZone(config, store);
            return config;
        } catch (Exception e) {
            throw new ServiceRuntimeException(e.getMessage());
        }
    }

    private void getTimeZone(ReadableBusinessTimeConfiguration config, MerchantStore store) throws ServiceException {
        CoordinateConfiguration coordinateConfiguration = coordinateService.getConfiguration(store);
        StoreCoordinate coordinate = coordinateConfiguration.getCoordinate();
        long timestamp = Instant.now().toEpochMilli() / 1000;
        StringBuilder url = new StringBuilder("https://maps.googleapis.com/maps/api/timezone/json?location=")
                .append(coordinate.getLatitude()).append(",").append(coordinate.getLongitude())
                .append("&timestamp=").append(timestamp)
                .append("&key=").append(googleTimeZoneKey);
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(url.toString())
                .method(METHOD_GET, null)
                .build();
        try {
            Response response = client.newCall(request).execute();
            if (response.body() != null) {
                String result = response.body().string();
                Gson gson = new Gson();
                GTimeZone gTimeZone = gson.fromJson(result, GTimeZone.class);
                config.setTimeZone(gTimeZone.getTimeZoneId());
            }
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }

    }

}
