package com.salesmanager.shop.utils;

import com.salesmanager.core.business.modules.email.Email;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.reference.country.CountryService;
import com.salesmanager.core.business.services.reference.zone.ZoneService;
import com.salesmanager.core.business.services.system.EmailService;
import com.salesmanager.core.business.services.tax.TaxRateDescriptionService;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.Order;
import com.salesmanager.core.model.order.OrderTotal;
import com.salesmanager.core.model.order.orderproduct.OrderProduct;
import com.salesmanager.core.model.order.orderproduct.OrderProductAttribute;
import com.salesmanager.core.model.order.orderstatus.OrderStatusHistory;
import com.salesmanager.core.model.reference.country.Country;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.reference.zone.Zone;
import com.salesmanager.core.model.system.IntegrationConfiguration;
import com.salesmanager.shop.constants.ApplicationConstants;
import com.salesmanager.shop.constants.EmailConstants;
import com.salesmanager.shop.mail.model.UpdatePaymentMethodInfo;
import com.salesmanager.shop.model.customer.PersistableCustomer;
import com.salesmanager.shop.model.shop.ContactForm;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;


@Component
public class EmailTemplatesUtils {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EmailTemplatesUtils.class);
	
	@Inject
	private EmailService emailService;

	@Inject
	private LabelUtils messages;
	
	@Inject
	private CountryService countryService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ZoneService zoneService;
	
	@Inject
	private PricingService pricingService;
	
	@Inject
	@Qualifier("img")
	private ImageFilePath imageUtils;
	
	@Inject
	private EmailUtils emailUtils;
	
	@Inject
	private FilePathUtils filePathUtils;

	@Inject
	private TaxRateDescriptionService taxRateDescriptionService;
	
	private static final String LINE_BREAK = "<br/>";
	private static final String TABLE = "<table width=\"100%\">";
	private static final String CLOSING_TABLE = "</table>";
	private static final String TR = "<tr>";
	private static final String TR_BORDER = "<tr class=\"border\">";
	private static final String CLOSING_TR = "</tr>";
	private static final String TD = "<td valign=\"top\">";
	private static final String TD_WITH_FOUR_SPACES = "<td valign=\"top\">&nbsp;&nbsp;&nbsp;&nbsp;";
	private static final String TD_FONT_WEIGHT_BOLD = "<td class=\"font-weight-bold\" valign=\"top\">";
	private static final String CLOSING_TD = "</td>";

	private static final String LABEL_GENERIC_HI = "label.generic.hi";
	private static final String LABEL_ORDER_DOT = "label.order.";

	private static final String OPTION_FREE = "OPTION_FREE";
	private static final String PRODUCT_ATTRIBUTE_VALUE_NAME_YES = "Yes";
	private static final String PRODUCT_ATTRIBUTE_VALUE_NAME_NO = "No";
	private static final String ORDER_ATTRIBUTE_ORDER_NOTES = "orderNotes";

	/**
	 * Sends an email to the customer after a completed order
	 * @param customer
	 * @param order
	 * @param customerLocale
	 * @param language
	 * @param merchantStore
	 * @param contextPath
	 */
	@Async
	public void sendOrderEmail(String toEmail, Customer customer, Order order, Locale customerLocale, Language language, MerchantStore merchantStore, String contextPath) {
			   /** issue with putting that elsewhere **/ 
		       LOGGER.info( "Sending welcome email to customer" );
		       try {
		    	   
		    	   Map<String,Zone> zones = zoneService.getZones(language);
		    	   
		    	   Map<String,Country> countries = countryService.getCountriesMap(language);
		    	   
		    	   //format Billing address
		    	   StringBuilder billing = new StringBuilder();
		    	   if(StringUtils.isBlank(order.getBilling().getCompany())) {
		    		   billing.append(order.getBilling().getFirstName()).append(" ")
		    		   .append(order.getBilling().getLastName()).append(LINE_BREAK);
		    	   } else {
		    		   billing.append(order.getBilling().getCompany()).append(LINE_BREAK);
		    	   }

		    	   final String billingTelephone = order.getBilling().getTelephone();
		    	   if (StringUtils.isNotBlank(billingTelephone)) {
		    	   		billing.append(billingTelephone).append(LINE_BREAK);
				   }

		    	   final String billingAddress = order.getBilling().getAddress();
		    	   if (StringUtils.isNotBlank(billingAddress)) {
					   billing.append(billingAddress).append(LINE_BREAK);
				   }

		    	   final String billingCity = order.getBilling().getCity();
		    	   if (StringUtils.isNotBlank(billingCity)) {
					   billing.append(billingCity).append(", ");
				   }
		    	   
		    	   if(order.getBilling().getZone()!=null) {
		    		   Zone zone = zones.get(order.getBilling().getZone().getCode());
		    		   if(zone!=null) {
		    			   billing.append(zone.getName());
		    		   }
		    		   billing.append(LINE_BREAK);
		    	   } else if(!StringUtils.isBlank(order.getBilling().getState())) {
		    		   billing.append(order.getBilling().getState()).append(LINE_BREAK); 
		    	   }
		    	   Country country = countries.get(order.getBilling().getCountry().getIsoCode());
		    	   if(country!=null) {
		    		   billing.append(country.getName()).append(" ");
		    	   }

		    	   final String billingPostalCode = order.getBilling().getPostalCode();
		    	   if (StringUtils.isNotBlank(billingPostalCode)) {
					   billing.append(billingPostalCode);
				   }
		    	   
		    	   
		    	   //format shipping address
		    	   StringBuilder shipping = null;
		    	   if(order.getDelivery()!=null && !StringUtils.isBlank(order.getDelivery().getFirstName())) {
		    		   shipping = new StringBuilder();
			    	   if(StringUtils.isBlank(order.getDelivery().getCompany())) {
			    		   shipping.append(order.getDelivery().getFirstName()).append(" ")
			    		   .append(order.getDelivery().getLastName()).append(LINE_BREAK);
			    	   } else {
			    		   shipping.append(order.getDelivery().getCompany()).append(LINE_BREAK);
			    	   }

					   final String deliveryTelephone = order.getDelivery().getTelephone();
					   if (StringUtils.isNotBlank(deliveryTelephone)) {
						   shipping.append(deliveryTelephone).append(LINE_BREAK);
					   }

					   final String deliveryAddress = order.getDelivery().getAddress();
					   if (StringUtils.isNotBlank(deliveryAddress)) {
						   shipping.append(deliveryAddress).append(LINE_BREAK);
					   }

					   final String deliveryCity = order.getDelivery().getCity();
					   if (StringUtils.isNotBlank(deliveryCity)) {
						   shipping.append(deliveryCity).append(", ");
					   }

			    	   if(order.getDelivery().getZone()!=null) {
			    		   Zone zone = zones.get(order.getDelivery().getZone().getCode());
			    		   if(zone!=null) {
			    			   shipping.append(zone.getName());
			    		   }
			    		   shipping.append(LINE_BREAK);
			    	   } else if(!StringUtils.isBlank(order.getDelivery().getState())) {
			    		   shipping.append(order.getDelivery().getState()).append(LINE_BREAK); 
			    	   }
			    	   Country deliveryCountry = countries.get(order.getDelivery().getCountry().getIsoCode());
			    	   if(country!=null) {
			    		   shipping.append(deliveryCountry.getName()).append(" ");
			    	   }

					   final String deliveryPostalCode = order.getDelivery().getPostalCode();
					   if (StringUtils.isNotBlank(deliveryPostalCode)) {
						   shipping.append(deliveryPostalCode);
					   }
		    	   }
		    	   
		    	   if(shipping==null && StringUtils.isNotBlank(order.getShippingModuleCode())) {
		    		   //TODO IF HAS NO SHIPPING
		    		   shipping = billing;
		    	   }
		    	   
		    	   //format order
		    	   //String storeUri = FilePathUtils.buildStoreUri(merchantStore, contextPath);
		    	   StringBuilder orderTable = new StringBuilder();
		    	   orderTable.append(TABLE);
		    	   for(OrderProduct product : order.getOrderProducts()) {
		    	   	   // Get the set of product attributes that belong to the OPTION_FREE group
					   Set<OrderProductAttribute> optionFrees = new HashSet<>();
					   Set<OrderProductAttribute> orderAttributes = new HashSet<>(product.getOrderAttributes());
					   if (CollectionUtils.isNotEmpty(orderAttributes)) {
					   		optionFrees.addAll(orderAttributes.stream()
									.map(oa -> productService.getProductOptionValueById(oa.getProductOptionValueId(), merchantStore))
									.filter(ov -> StringUtils.startsWithIgnoreCase(ov.getCode(), OPTION_FREE))
									.map(ov -> orderAttributes.stream()
											.filter(oa -> ov.getId().equals(oa.getProductOptionValueId()))
											.findFirst()
									)
									.filter(Optional::isPresent).map(Optional::get)
									.collect(Collectors.toList())
							);
					   		orderAttributes.removeAll(optionFrees);
					   }

		    		   //Product productModel = productService.getByCode(product.getSku(), language);
		    		   orderTable.append(TR);
			    		   orderTable.append(TD_FONT_WEIGHT_BOLD).append(product.getProductName());
			    		   for (OrderProductAttribute productAttribute : optionFrees) {
							   	final String productAttributeValueName = productAttribute.getProductAttributeValueName();
							   	if (StringUtils.equalsIgnoreCase(PRODUCT_ATTRIBUTE_VALUE_NAME_YES, productAttributeValueName)) {
									orderTable.append(" (").append(productAttribute.getProductAttributeName()).append(")");
								} else if (!StringUtils.equalsIgnoreCase(PRODUCT_ATTRIBUTE_VALUE_NAME_NO, productAttributeValueName)) {
									orderTable.append(" (").append(productAttributeValueName).append(")");
								}
						   }
			    		   orderTable.append(CLOSING_TD);
		    		   	   orderTable.append(TD).append(messages.getMessage("label.quantity", customerLocale)).append(": ").append(product.getProductQuantity()).append(CLOSING_TD);
	    		   		   orderTable.append(TD).append(pricingService.getDisplayAmount(product.getOneTimeCharge(), merchantStore)).append(CLOSING_TD);
    		   		   orderTable.append(CLOSING_TR);

    		   		   // Appending order attributes
					   for (OrderProductAttribute productAttribute : orderAttributes) {
					   		orderTable.append(TR)
									.append(TD_WITH_FOUR_SPACES).append(productAttribute.getProductAttributeValueName()).append(CLOSING_TD)
									.append(TD).append(CLOSING_TD)
									.append(TD).append(pricingService.getDisplayAmount(productAttribute.getProductAttributePrice(), merchantStore)).append(CLOSING_TD)
							.append(CLOSING_TR);
					   }
		    	   }

		    	   //order totals
		    	   for(OrderTotal total : order.getOrderTotal()) {
		    		   orderTable.append(TR_BORDER);
		    		   		//orderTable.append(TD);
		    		   		//orderTable.append(CLOSING_TD);
		    		   		orderTable.append(TD);
		    		   		orderTable.append(CLOSING_TD);
		    		   		orderTable.append(TD);
		    		   		orderTable.append("<strong>");
		    		   			if(total.getModule().equals("tax")) {
		    		   				orderTable.append("Tax Rate (")
											.append(getTaxRate(total, language)).append("%)")
											.append(": ");

		    		   			} else {
		    		   				//if(total.getModule().equals("total") || total.getModule().equals("subtotal")) {
		    		   				//}
		    		   				orderTable.append(messages.getMessage(total.getOrderTotalCode(), customerLocale)).append(": ");
		    		   				//if(total.getModule().equals("total") || total.getModule().equals("subtotal")) {
		    		   					
		    		   				//}
		    		   			}
		    		   		orderTable.append("</strong>");
		    		   		orderTable.append(CLOSING_TD);
		    		   		orderTable.append(TD);
		    		   			orderTable.append("<strong>");

		    		   			orderTable.append(pricingService.getDisplayAmount(total.getValue(), merchantStore));

	    		   				orderTable.append("</strong>");
		    		   		orderTable.append(CLOSING_TD);
		    		   orderTable.append(CLOSING_TR);
		    	   }
		    	   orderTable.append(CLOSING_TABLE);

		    	   // format order notes
				   StringBuilder orderNotes = new StringBuilder();
				   orderNotes.append(TABLE).append(TR);
				   for (com.salesmanager.core.model.order.attributes.OrderAttribute orderAttribute : order.getOrderAttributes()) {
				   		if (StringUtils.equalsIgnoreCase(ORDER_ATTRIBUTE_ORDER_NOTES, orderAttribute.getKey())) {
				   			orderNotes.append(TD)
									.append("Order notes: ").append(orderAttribute.getValue())
									.append(CLOSING_TD);
						}
				   }
				   orderNotes.append(CLOSING_TR).append(CLOSING_TABLE);

		           Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, customerLocale);
		           templateTokens.put(EmailConstants.LABEL_HI, messages.getMessage(LABEL_GENERIC_HI, customerLocale));
		           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_FIRSTNAME, order.getBilling().getFirstName());
		           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_LASTNAME, order.getBilling().getLastName());
		           
		           String[] params = {String.valueOf(order.getId())};
		           String[] dt = { new StringBuilder(DateUtil.formatDate(order.getDatePurchased()))
						   .append(" ").append(TimeUtils.formatMerchantTimeNow(merchantStore)).toString() };
		           templateTokens.put(EmailConstants.EMAIL_ORDER_NUMBER, messages.getMessage("email.order.confirmation", params, customerLocale));
		           templateTokens.put(EmailConstants.EMAIL_ORDER_DATE, messages.getMessage("email.order.ordered", dt, customerLocale));
		           templateTokens.put(EmailConstants.EMAIL_ORDER_THANKS, messages.getMessage("email.order.thanks",customerLocale));
		           templateTokens.put(EmailConstants.ADDRESS_BILLING, billing.toString());
		           templateTokens.put(EmailConstants.ORDER_NOTES, orderNotes.toString());
		           
		           templateTokens.put(EmailConstants.ORDER_PRODUCTS_DETAILS, orderTable.toString());
		           templateTokens.put(EmailConstants.EMAIL_ORDER_DETAILS_TITLE, messages.getMessage("label.order.details",customerLocale));
		           templateTokens.put(EmailConstants.ADDRESS_BILLING_TITLE, messages.getMessage("label.customer.billinginformation",customerLocale));
		           templateTokens.put(EmailConstants.PAYMENT_METHOD_TITLE, messages.getMessage("label.order.paymentmode",customerLocale));
		           templateTokens.put(EmailConstants.PAYMENT_METHOD_DETAILS, messages.getMessage(new StringBuilder().append("payment.type.").append(order.getPaymentType().name()).toString(),customerLocale,order.getPaymentType().name()));
		           
		           if(StringUtils.isNotBlank(order.getShippingModuleCode())) {
		        	   //templateTokens.put(EmailConstants.SHIPPING_METHOD_DETAILS, messages.getMessage(new StringBuilder().append("module.shipping.").append(order.getShippingModuleCode()).toString(),customerLocale,order.getShippingModuleCode()));
		        	   templateTokens.put(EmailConstants.SHIPPING_METHOD_DETAILS, messages.getMessage(new StringBuilder().append("module.shipping.").append(order.getShippingModuleCode()).toString(),new String[]{merchantStore.getStorename()},customerLocale));
		        	   templateTokens.put(EmailConstants.ADDRESS_SHIPPING_TITLE, messages.getMessage("label.order.shippingmethod",customerLocale));
		        	   templateTokens.put(EmailConstants.ADDRESS_DELIVERY_TITLE, messages.getMessage("label.customer.shippinginformation",customerLocale));
		        	   templateTokens.put(EmailConstants.SHIPPING_METHOD_TITLE, messages.getMessage("label.customer.shippinginformation",customerLocale));
		        	   templateTokens.put(EmailConstants.ADDRESS_DELIVERY, shipping.toString());
		           } else {
		        	   templateTokens.put(EmailConstants.SHIPPING_METHOD_DETAILS, "");
		        	   templateTokens.put(EmailConstants.ADDRESS_SHIPPING_TITLE, "");
		        	   templateTokens.put(EmailConstants.ADDRESS_DELIVERY_TITLE, "");
		        	   templateTokens.put(EmailConstants.SHIPPING_METHOD_TITLE, "");
		        	   templateTokens.put(EmailConstants.ADDRESS_DELIVERY, "");
		           }
		           
			       String status = messages.getMessage(LABEL_ORDER_DOT + order.getStatus().name(), customerLocale, order.getStatus().name());
			       String[] statusMessage = {DateUtil.formatDate(order.getDatePurchased()),status};
		           templateTokens.put(EmailConstants.ORDER_STATUS, messages.getMessage("email.order.status", statusMessage, customerLocale));
		           

		           String[] title = {merchantStore.getStorename(), String.valueOf(order.getId())};
		           Email email = new Email();
		           email.setFrom(merchantStore.getStorename());
		           email.setFromEmail(merchantStore.getStoreEmailAddress());
		           email.setSubject(messages.getMessage("email.order.title", title, customerLocale));
		           email.setTo(toEmail);
		           email.setTemplateName(EmailConstants.EMAIL_ORDER_TPL);
		           email.setTemplateTokens(templateTokens);

		           LOGGER.debug( "Sending email to {} for order id {} ",customer.getEmailAddress(), order.getId() );
		           emailService.sendHtmlEmail(merchantStore, email);

		       } catch (Exception e) {
		           LOGGER.error("Error occured while sending order confirmation email ",e);
		       }

	}

	private BigDecimal getTaxRate(OrderTotal total, Language language) {
		BigDecimal taxRate = taxRateDescriptionService.getTaxRateDescriptionByNameAndLanguage(total.getOrderTotalCode(), language)
				.map(com.salesmanager.core.model.tax.taxrate.TaxRateDescription::getTaxRate)
				.map(com.salesmanager.core.model.tax.taxrate.TaxRate::getTaxRate).orElse(BigDecimal.ZERO);
		taxRate = taxRate.setScale(2, RoundingMode.HALF_UP);

		return taxRate;
	}

	/**
	 * Sends an email to the customer after registration
	 * @param customer
	 * @param merchantStore
	 * @param customerLocale
	 * @param contextPath
	 */
	@Async
	public void sendRegistrationEmail(
		PersistableCustomer customer, MerchantStore merchantStore,
			Locale customerLocale, String contextPath) {
		   /** issue with putting that elsewhere **/ 
	       LOGGER.info( "Sending welcome email to customer" );
	       try {

	           Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, customerLocale);
	           templateTokens.put(EmailConstants.LABEL_HI, messages.getMessage(LABEL_GENERIC_HI, customerLocale));
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_FIRSTNAME, customer.getBilling().getFirstName());
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_LASTNAME, customer.getBilling().getLastName());
	           String[] greetingMessage = {merchantStore.getStorename(),filePathUtils.buildCustomerUri(merchantStore,contextPath),merchantStore.getStoreEmailAddress()};
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_GREETING, messages.getMessage("email.customer.greeting", greetingMessage, customerLocale));
	           templateTokens.put(EmailConstants.EMAIL_USERNAME_LABEL, messages.getMessage("label.generic.username",customerLocale));
	           templateTokens.put(EmailConstants.EMAIL_PASSWORD_LABEL, messages.getMessage("label.generic.password",customerLocale));
	           templateTokens.put(EmailConstants.CUSTOMER_ACCESS_LABEL, messages.getMessage("label.customer.accessportal",customerLocale));
	           templateTokens.put(EmailConstants.ACCESS_NOW_LABEL, messages.getMessage("label.customer.accessnow",customerLocale));
	           templateTokens.put(EmailConstants.EMAIL_USER_NAME, customer.getUserName());
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_PASSWORD, customer.getPassword());

	           //shop url
	           String customerUrl = filePathUtils.buildStoreUri(merchantStore, contextPath);
	           templateTokens.put(EmailConstants.CUSTOMER_ACCESS_URL, customerUrl);

	           Email email = new Email();
	           email.setFrom(merchantStore.getStorename());
	           email.setFromEmail(merchantStore.getStoreEmailAddress());
	           email.setSubject(messages.getMessage("email.newuser.title",customerLocale));
	           email.setTo(customer.getEmailAddress());
	           email.setTemplateName(EmailConstants.EMAIL_CUSTOMER_TPL);
	           email.setTemplateTokens(templateTokens);

	           LOGGER.debug( "Sending email to {} on their  registered email id {} ",customer.getBilling().getFirstName(),customer.getEmailAddress() );
	           emailService.sendHtmlEmail(merchantStore, email);

	       } catch (Exception e) {
	           LOGGER.error("Error occured while sending welcome email ",e);
	       }
		
	}
	
	@Async
	public void sendContactEmail(
			ContactForm contact, MerchantStore merchantStore,
				Locale storeLocale, String contextPath) {
			   /** issue with putting that elsewhere **/ 
		       LOGGER.info( "Sending email to store owner" );
		       try {

		           Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, storeLocale);
		           
		           templateTokens.put(EmailConstants.EMAIL_CONTACT_NAME, contact.getName());
		           templateTokens.put(EmailConstants.EMAIL_CONTACT_EMAIL, contact.getEmail());
		           templateTokens.put(EmailConstants.EMAIL_CONTACT_CONTENT, contact.getComment());
		           
		           String[] contactSubject = {contact.getSubject()};
		           
		           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_CONTACT, messages.getMessage("email.contact",contactSubject, storeLocale));
		           templateTokens.put(EmailConstants.EMAIL_CONTACT_NAME_LABEL, messages.getMessage("label.entity.name",storeLocale));
		           templateTokens.put(EmailConstants.EMAIL_CONTACT_EMAIL_LABEL, messages.getMessage("label.generic.email",storeLocale));



		           Email email = new Email();
		           email.setFrom(contact.getName());
		           //since shopizer sends email to store email, sender is store email
		           email.setFromEmail(merchantStore.getStoreEmailAddress());
		           email.setSubject(messages.getMessage("email.contact.title",storeLocale));
		           //contact has to be delivered to store owner, receiver is store email
		           email.setTo(merchantStore.getStoreEmailAddress());
		           email.setTemplateName(EmailConstants.EMAIL_CONTACT_TMPL);
		           email.setTemplateTokens(templateTokens);

		           LOGGER.debug( "Sending contact email");
		           emailService.sendHtmlEmail(merchantStore, email);

		       } catch (Exception e) {
		           LOGGER.error("Error occured while sending contact email ",e);
		       }
			
		}
	
	/**
	 * Send an email to the customer with last order status
	 * @param customer
	 * @param order
	 * @param lastHistory
	 * @param merchantStore
	 * @param customerLocale
	 * @param contextPath
	 */
	@Async
	public void sendUpdateOrderStatusEmail(
			Customer customer, Order order, OrderStatusHistory lastHistory, MerchantStore merchantStore,
			Locale customerLocale, String contextPath) {
		   /** issue with putting that elsewhere **/ 
	       LOGGER.info( "Sending order status email to customer" );
	       try {


				Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, customerLocale);
				
		        templateTokens.put(EmailConstants.LABEL_HI, messages.getMessage(LABEL_GENERIC_HI, customerLocale));
		        templateTokens.put(EmailConstants.EMAIL_CUSTOMER_FIRSTNAME, customer.getBilling().getFirstName());
		        templateTokens.put(EmailConstants.EMAIL_CUSTOMER_LASTNAME, customer.getBilling().getLastName());
				String formatpattern = "hh:mm a EEE, dd MMM";
			   	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formatpattern);
			   	LocalDateTime dateTime = LocalDateTime.now();
			   	StringBuilder stringBuilder = new StringBuilder(LINE_BREAK)
						.append(DateTimeUtils.formatDateTimeWithAdditionFormat(dateTime, formatter))
						.append(LINE_BREAK)
						.append("Pick up at:")
			   			.append(DateTimeUtils.formatDateTimeWithAdditionFormat(dateTime.plusMinutes(15), formatter));

		        String[] statusMessageText = {String.valueOf(order.getId()), stringBuilder.toString()};
		        String status = messages.getMessage(LABEL_ORDER_DOT + order.getStatus().name(), customerLocale, order.getStatus().name());
		        String[] statusMessage = {DateUtil.formatDate(lastHistory.getDateAdded()),status};
		        
		        String comments = lastHistory.getComments();
		        if(StringUtils.isBlank(comments)) {
		        	comments = messages.getMessage(LABEL_ORDER_DOT + order.getStatus().name(), customerLocale, order.getStatus().name());
		        }
		        
				templateTokens.put(EmailConstants.EMAIL_ORDER_STATUS_TEXT, messages.getMessage("email.order.statustext", statusMessageText, customerLocale));
				templateTokens.put(EmailConstants.EMAIL_TEXT_STATUS_COMMENTS, comments);
				
				
				Email email = new Email();
				email.setFrom(merchantStore.getStorename());
				email.setFromEmail(merchantStore.getStoreEmailAddress());
				email.setSubject(messages.getMessage("email.order.status.title",new String[]{String.valueOf(order.getId())},customerLocale));
				email.setTo(customer.getEmailAddress());
				email.setTemplateName(EmailConstants.ORDER_STATUS_TMPL);
				email.setTemplateTokens(templateTokens);
	
	
				
				emailService.sendHtmlEmail(merchantStore, email);

	       } catch (Exception e) {
	           LOGGER.error("Error occured while sending order download email ",e);
	       }
		
	}
	
	/**
	 * Send download email instructions to customer
	 * @param customer
	 * @param order
	 * @param merchantStore
	 * @param customerLocale
	 * @param contextPath
	 */
	@Async
	public void sendOrderDownloadEmail(
			Customer customer, Order order, MerchantStore merchantStore,
			Locale customerLocale, String contextPath) {
		   /** issue with putting that elsewhere **/ 
	       LOGGER.info( "Sending download email to customer" );
	       try {

	           Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, customerLocale);
	           templateTokens.put(EmailConstants.LABEL_HI, messages.getMessage(LABEL_GENERIC_HI, customerLocale));
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_FIRSTNAME, customer.getBilling().getFirstName());
	           templateTokens.put(EmailConstants.EMAIL_CUSTOMER_LASTNAME, customer.getBilling().getLastName());
	           String[] downloadMessage = {String.valueOf(ApplicationConstants.MAX_DOWNLOAD_DAYS), String.valueOf(order.getId()), filePathUtils.buildCustomerUri(merchantStore, contextPath), merchantStore.getStoreEmailAddress()};
	           templateTokens.put(EmailConstants.EMAIL_ORDER_DOWNLOAD, messages.getMessage("email.order.download.text", downloadMessage, customerLocale));
	           templateTokens.put(EmailConstants.CUSTOMER_ACCESS_LABEL, messages.getMessage("label.customer.accessportal",customerLocale));
	           templateTokens.put(EmailConstants.ACCESS_NOW_LABEL, messages.getMessage("label.customer.accessnow",customerLocale));

	           //shop url
	           String customerUrl = filePathUtils.buildStoreUri(merchantStore, contextPath);
	           templateTokens.put(EmailConstants.CUSTOMER_ACCESS_URL, customerUrl);

	           String[] orderInfo = {String.valueOf(order.getId())};
	           
	           Email email = new Email();
	           email.setFrom(merchantStore.getStorename());
	           email.setFromEmail(merchantStore.getStoreEmailAddress());
	           email.setSubject(messages.getMessage("email.order.download.title", orderInfo, customerLocale));
	           email.setTo(customer.getEmailAddress());
	           email.setTemplateName(EmailConstants.EMAIL_ORDER_DOWNLOAD_TPL);
	           email.setTemplateTokens(templateTokens);

	           LOGGER.debug( "Sending email to {} with download info",customer.getEmailAddress() );
	           emailService.sendHtmlEmail(merchantStore, email);

	       } catch (Exception e) {
	           LOGGER.error("Error occured while sending order download email ",e);
	       }
		
	}
	
	/**
	 * Sends a change password notification email to the Customer
	 * @param customer
	 * @param merchantStore
	 * @param customerLocale
	 * @param contextPath
	 */
	@Async
	public void changePasswordNotificationEmail(
			Customer customer, MerchantStore merchantStore,
			Locale customerLocale, String contextPath) {
	       LOGGER.debug( "Sending change password email" );
	       try {


				Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(contextPath, merchantStore, messages, customerLocale);
				
		        templateTokens.put(EmailConstants.LABEL_HI, messages.getMessage(LABEL_GENERIC_HI, customerLocale));
		        templateTokens.put(EmailConstants.EMAIL_CUSTOMER_FIRSTNAME, customer.getBilling().getFirstName());
		        templateTokens.put(EmailConstants.EMAIL_CUSTOMER_LASTNAME, customer.getBilling().getLastName());
				
		        String[] date = {DateUtil.formatLongDate(new Date())};
		        
		        templateTokens.put(EmailConstants.EMAIL_NOTIFICATION_MESSAGE, messages.getMessage("label.notification.message.passwordchanged", date, customerLocale));
		        

				Email email = new Email();
				email.setFrom(merchantStore.getStorename());
				email.setFromEmail(merchantStore.getStoreEmailAddress());
				email.setSubject(messages.getMessage("label.notification.title.passwordchanged",customerLocale));
				email.setTo(customer.getEmailAddress());
				email.setTemplateName(EmailConstants.EMAIL_NOTIFICATION_TMPL);
				email.setTemplateTokens(templateTokens);
	
	
				
				emailService.sendHtmlEmail(merchantStore, email);

	       } catch (Exception e) {
	           LOGGER.error("Error occured while sending change password email ",e);
	       }
		
	}


	/**
	 * Sends an update payment method notification to the Super admin users.
	 * @param info
	 * @param merchantStore
	 * @param customerLocale
	 */
	@Async
	public void sendUpdatePaymentMethodEmail(UpdatePaymentMethodInfo info, MerchantStore merchantStore, Locale customerLocale) {

		LOGGER.info("Sending update payment email");
		try {
			IntegrationConfiguration configuration = info.getConfiguration();
			List<String> toEmails = info.getToEmails();

			Map<String, String> templateTokens = emailUtils.createEmailObjectsMap(merchantStore, messages, customerLocale);

			templateTokens.put(EmailConstants.PAYMENT_METHOD, messages.getMessage("module.payment." + configuration.getModuleCode(), customerLocale, "Error"));


			templateTokens.put(EmailConstants.EMAIL_UPDATE_PAYMENT_NOTIFICATION, "Payment method has been updated:");

			templateTokens.put(EmailConstants.IS_ACTIVE, configuration.isActive() ? "Yes" : "No");
			templateTokens.put(EmailConstants.IS_DEFAULT, configuration.isDefaultSelected() ? "Yes" : "No");
			templateTokens.put(EmailConstants.USER_NAME, info.getUsername());
			templateTokens.put(EmailConstants.IP_ADDRESS, info.getIpAddress());

			Email email = new Email();
			email.setFrom(merchantStore.getStorename());
			email.setFromEmail(merchantStore.getStoreEmailAddress());
			email.setSubject(messages.getMessage("email.payment.title", new String[]{merchantStore.getStorename()}, customerLocale));

			email.setTemplateName(EmailConstants.EMAIL_PAYMENT_NOTIFICATION_TPL);
			email.setTemplateTokens(templateTokens);

			for (String toEmail : toEmails) {
				email.setTo(toEmail);
				emailService.sendHtmlEmail(merchantStore, email);
			}


		} catch (Exception e) {
			LOGGER.error("Error occurred while sending update payment email ", e);
		}

	}

}