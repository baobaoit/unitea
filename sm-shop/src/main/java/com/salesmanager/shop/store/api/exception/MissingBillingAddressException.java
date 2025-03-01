package com.salesmanager.shop.store.api.exception;

public class MissingBillingAddressException extends RuntimeException{

    public MissingBillingAddressException(String message, Throwable cause) {
        super(message, cause);
    }

    public MissingBillingAddressException(String message) {
        this(message, null);
    }

}
