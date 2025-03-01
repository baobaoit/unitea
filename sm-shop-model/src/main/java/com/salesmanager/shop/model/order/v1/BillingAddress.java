package com.salesmanager.shop.model.order.v1;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/*
* */
public class BillingAddress implements Serializable {

    private static final long serialVersionUID = -1485387612852971961L;

    private String firstName;

    @ApiModelProperty(notes = "Customer billing last name")
    //@NotEmpty(message="{NotEmpty.customer.lastName}")
    private String lastName;

    private String phone;

    @ApiModelProperty(notes = "Customer billing or shipping address")
    private String address;

    @ApiModelProperty(notes = "Customer billing or shipping city")
    private String city;

    @ApiModelProperty(notes = "Customer billing or shipping state / province (2 letter code CA, ON...)")
    private String zone;//code

    @ApiModelProperty(notes = "Customer billing or shipping country code (2 letter code US, CA, UK, IT, IN, CN...)")
    //@NotEmpty(message="{NotEmpty.customer.billing.country}")
    private String country;//code

    private String postalCode;

    public String getPostalCode() {
        return postalCode;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getZone() {
        return zone;
    }

    public String getCountry() {
        return country;
    }

    public BillingAddress() { }

    public BillingAddress(com.salesmanager.shop.model.customer.address.Address address) {
        this.firstName = address.getFirstName();
        this.lastName = address.getLastName();
        this.address = address.getAddress();
        this.city = address.getCity();
        this.zone = address.getZone();
        this.country = address.getCountry();
        this.phone = address.getPhone();
        this.postalCode = address.getPostalCode();
    }
}
