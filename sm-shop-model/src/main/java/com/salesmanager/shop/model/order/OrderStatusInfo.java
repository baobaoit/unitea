package com.salesmanager.shop.model.order;

import java.io.Serializable;

public class OrderStatusInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String message;

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
}
