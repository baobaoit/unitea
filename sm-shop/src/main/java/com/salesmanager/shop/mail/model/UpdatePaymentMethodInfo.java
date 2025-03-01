package com.salesmanager.shop.mail.model;

import com.salesmanager.core.model.system.IntegrationConfiguration;

import java.util.List;

public class UpdatePaymentMethodInfo {
	private final String username;
	private final String ipAddress;
	private final IntegrationConfiguration configuration;
	private final List<String> toEmails;

	private UpdatePaymentMethodInfo(UpdatePaymentMethodInfoBuilder builder) {
		this.username = builder.username;
		this.ipAddress = builder.ipAddress;
		this.configuration = builder.configuration;
		this.toEmails = builder.toEmails;
	}

	public String getUsername() {
		return username;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public IntegrationConfiguration getConfiguration() {
		return configuration;
	}

	public List<String> getToEmails() {
		return toEmails;
	}

	public static UpdatePaymentMethodInfoBuilder builder() {
		return new UpdatePaymentMethodInfoBuilder();
	}

	public static class UpdatePaymentMethodInfoBuilder {
		private String username;
		private String ipAddress;
		private IntegrationConfiguration configuration;
		private List<String> toEmails;

		public UpdatePaymentMethodInfoBuilder username(String username) {
			this.username = username;
			return this;
		}

		public UpdatePaymentMethodInfoBuilder ipAddress(String ipAddress) {
			this.ipAddress = ipAddress;
			return this;
		}

		public UpdatePaymentMethodInfoBuilder configuration(IntegrationConfiguration configuration) {
			this.configuration = configuration;
			return this;
		}

		public UpdatePaymentMethodInfoBuilder toEmails(List<String> toEmails) {
			this.toEmails = toEmails;
			return this;
		}

		public UpdatePaymentMethodInfo build() {
			return new UpdatePaymentMethodInfo(this);
		}
	}

}
