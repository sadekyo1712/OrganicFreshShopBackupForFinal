package com.OrganicFreshShop.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by root on 11/22/16.
 */
public class Product {

    private String code;
    private String name;
    private double priceTag;
    private boolean newProduct = false;
    private CommonsMultipartFile productImage;
    private byte[] data;
    private Date createdDate;
    private Timestamp timestamp;
    private String description;
    private String uri;
    private String createdAccount;
    private ProductInfo productInfo = new ProductInfo();

    public Product() {

    }

    public Product( Product product ) {
        this.code = product.getCode();
        this.name = product.getName();
        this.priceTag = product.getPriceTag();
        this.productImage = product.getProductImage();
    }

    public Product( String code, String name, double priceTag ) {
        this.code = code;
        this.name = name;
        this.priceTag = priceTag;
    }

    public void setCode( String code ) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setName( String name ) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPriceTag( double priceTag ) {
        this.priceTag = priceTag;
    }

    public double getPriceTag() {
        return priceTag;
    }

    public void setNewProduct( boolean newProduct ) {
        this.newProduct = newProduct;
    }

    public boolean isNewProduct() {
        return newProduct;
    }

    public void setProductImage( CommonsMultipartFile productImage ) {
        this.productImage = productImage;
    }

    public CommonsMultipartFile getProductImage() {
        return productImage;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getCreatedAccount() {
        return createdAccount;
    }

    public void setCreatedAccount(String createdAccount) {
        this.createdAccount = createdAccount;
    }

    public ProductInfo getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(ProductInfo productInfo) {
        this.productInfo = productInfo;
    }



    @Override
    public String toString() {
        return "[ Product :" + "code : " + this.getCode() +
                ", name : " + this.getName() +
                ", price : " + this.getPriceTag() +
                ", created date : " + this.getCreatedDate() +
                ", timestamp : " + this.getTimestamp() +
                ", description : " +this.getDescription() +
                ", uri : " + this.getUri() + " ]";
    }
}
