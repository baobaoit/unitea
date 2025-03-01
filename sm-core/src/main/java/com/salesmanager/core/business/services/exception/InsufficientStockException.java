package com.salesmanager.core.business.services.exception;

public class InsufficientStockException extends RuntimeException{
    public InsufficientStockException(String message) {
        this(message, null);
    }

    public InsufficientStockException(String message, Throwable cause) {
        super(message, cause);
    }
}
