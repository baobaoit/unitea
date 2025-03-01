package com.salesmanager.shop.store.api.exception;

public class MissingFieldException extends RuntimeException{

    public MissingFieldException(String message, Throwable cause) {
        super(message, cause);
    }

    public MissingFieldException(String message) {
        this(message, null);
    }

}
