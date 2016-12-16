package com.OrganicFreshShop.model;

/**
 * Created by root on 11/22/16.
 */
public class Customer {

    private String name;
    private String address;
    private String email;
    private String phone;
    private boolean validCustomer;

    public boolean isValidCustomer() {
        return validCustomer;
    }

    public void setValidCustomer(boolean validCustomer) {
        this.validCustomer = validCustomer;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isFullCustomerInfo() {
        return ( name.length() > 0 ) && ( email.length() > 0 ) && ( address.length() > 0 ) && ( phone.length() > 0 );
    }

    @Override
    public String toString() {
        return "[ Customer : " + " name : " + this.name + " , address : " + this.address +
                " , email :" + this.email + " , phone : " + this.phone + " ]";
    }
}
