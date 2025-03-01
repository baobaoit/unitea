package com.salesmanager.shop.model.catalog.product.inventory;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductDimentions implements Serializable {

    private static final long serialVersionUID = 1L;
    private BigDecimal length;
    private BigDecimal width;
    private BigDecimal height;
    private BigDecimal weight;


    public BigDecimal getLength() {
        return length;
    }
    public void setLength(BigDecimal length) {
        this.length = length;
    }
    public BigDecimal getWidth() {
        return width;
    }
    public void setWidth(BigDecimal width) {
        this.width = width;
    }
    public BigDecimal getHeight() {
        return height;
    }
    public void setHeight(BigDecimal height) {
        this.height = height;
    }
    public BigDecimal getWeight() {
        return weight;
    }
    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }
}
