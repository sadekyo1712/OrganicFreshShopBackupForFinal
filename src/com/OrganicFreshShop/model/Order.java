package com.OrganicFreshShop.model;

import java.util.Date;
import java.util.List;

/**
 * Created by root on 11/22/16.
 */
public class Order {

    private String id;
    private Date orderDate;
    private int orderNumber;
    private double amount;
    private String customerName;
    private String customerAddress;
    private String customerEmail;
    private String customerPhone;
    private List<OrderDetail> orderDetails;

    public Order() {

    }

    public Order( String id, Date orderDate, int orderNumber, double amount,
                  String customerName, String customerAddress, String customerEmail,
                  String customerPhone) {
        this.id = id;
        this.orderDate = orderDate;
        this.orderNumber = orderNumber;
        this.amount = amount;
        this.customerName = customerName;
        this.customerAddress = customerAddress;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @Override
    public String toString() {
        return "[ Order : " + " id : " + this.id + " , order created date : " + this.orderDate +
                " , order number : " + this.orderNumber + " , total amount : " + this.amount +
                " , customer name : " + this.customerName + " , customer phone : " + this.customerPhone +
                " , customer email : " + this.customerEmail +
                " , customer address : " + this.customerAddress +
                " , order detail : " + this.orderDetails + " ]";
    }
}
