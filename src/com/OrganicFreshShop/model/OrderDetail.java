package com.OrganicFreshShop.model;

/**
 * Created by root on 11/22/16.
 */
public class OrderDetail {

    private String id;
    private String productCode;
    private String productName;
    private String orderCode;
    private String uri;
    private int quantity;
    private double price;
    private double amount;

    public OrderDetail() {

    }

    public OrderDetail( String id, String productCode, String productName,
                        int quantity, double price, double amount) {
        this.amount = amount;
        this.id = id;
        this.price = price;
        this.productCode = productCode;
        this.productName = productName;
        this.quantity = quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    @Override
    public String toString() {
        return "[ Order detail : " + " id : " + this.id + " , product ID : " + this.productCode +
                " , product name : " + this.productName + " , order ID :" + this.orderCode +
                " , quantity : " + this.quantity + " , price : " + this.price +
                " , sub-amount : " + this.amount + " ]";
    }
}
