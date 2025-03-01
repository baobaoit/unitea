package com.salesmanager.shop.model.security;

import java.io.Serializable;

public class GoogleReCaptchaEntity implements Serializable {

	private static final long serialVersionUID = 5132543989896763107L;

	private String token;
	private double threshold = 0.5;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public double getThreshold() {
		return threshold;
	}

	public void setThreshold(double threshold) {
		this.threshold = threshold;
	}

}
