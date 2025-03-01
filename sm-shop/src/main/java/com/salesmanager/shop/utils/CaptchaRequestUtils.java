package com.salesmanager.shop.utils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.salesmanager.core.business.utils.CoreConfiguration;
import com.salesmanager.shop.constants.ApplicationConstants;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

/**
 * Creates a request to reCaptcha 2
 * https://www.google.com/recaptcha/api/siteverify
 * Throws an exception if it can't connect to reCaptcha
 * returns true or false if validation has passed
 *
 * @author carlsamson
 */
@Component
public class CaptchaRequestUtils {
	
	@Inject
	private CoreConfiguration configuration; //for reading public and secret key
	
	private static final String SUCCESS_INDICATOR = "success";
	private static final String SCORE = "score";
	public static final boolean USE_RECAPTCHA_V2 = true;
	
	@Value("${config.recaptcha.secretKey}")
	private String secretKey;

	@Value("${config.recaptcha.secretKey.v3}")
	private String secretKeyV3;

	public boolean checkCaptcha(String gRecaptchaResponse) throws Exception {
		return checkCaptcha(gRecaptchaResponse, USE_RECAPTCHA_V2, null);
	}

	public boolean checkCaptcha(String gRecaptchaResponse, boolean isUseReCaptchaV2, Predicate<Double> checkThreshold) throws Exception {

		HttpClient client = HttpClientBuilder.create().build();

		String url = configuration.getProperty(ApplicationConstants.RECAPTCHA_URL);

		List<NameValuePair> data = new ArrayList<NameValuePair>();
		data.add(new BasicNameValuePair("secret", isUseReCaptchaV2 ? secretKey : secretKeyV3));
		data.add(new BasicNameValuePair("response", gRecaptchaResponse));


		// Create a method instance.
		HttpPost post = new HttpPost(url);
		post.setEntity(new UrlEncodedFormEntity(data, StandardCharsets.UTF_8));

		boolean checkCaptcha = false;


		try {
			// Execute the method.
			HttpResponse httpResponse = client.execute(post);
			int statusCode = httpResponse.getStatusLine().getStatusCode();

			if (statusCode != HttpStatus.SC_OK) {
				throw new Exception("Got an invalid response from reCaptcha " + url + " [" + httpResponse.getStatusLine() + "]");
			}

			// Read the response body.
			HttpEntity entity = httpResponse.getEntity();
			byte[] responseBody = EntityUtils.toByteArray(entity);


			// Deal with the response.
			// Use caution: ensure correct character encoding and is not binary data
			//System.out.println(new String(responseBody));

			String json = new String(responseBody);

			ObjectMapper mapper = new ObjectMapper();

			Map<String, Object> map = mapper.readValue(json, new TypeReference<HashMap<String, Object>>() {});

			Boolean successInd = (Boolean) map.get(SUCCESS_INDICATOR);

			if (successInd == null) {
				throw new Exception("Unreadable response from reCaptcha " + json);
			}

			checkCaptcha = successInd;

			if (checkThreshold != null) {
				Double score = (Double) map.get(SCORE);

				if (score == null) {
					throw new Exception("Unreadable response from reCaptcha " + json);
				}

				checkCaptcha = checkCaptcha && checkThreshold.test(score);
			}

		} finally {
			// Release the connection.
			post.releaseConnection();
		}

		return checkCaptcha;

	}


}
