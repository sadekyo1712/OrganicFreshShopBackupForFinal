package com.OrganicFreshShop.model;

/**
 * Created by root on 11/22/16.
 */
public class CartEntriesProduct {

    private Product product;
    private int quantity;

    public CartEntriesProduct() {
        this.quantity = 0;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getAmount() {
        return product.getPriceTag() * quantity ;
    }

    @Override
    public String toString() {
        return "[ Cart Entries Product : " + " product info : " + this.product +
                " , quantity : " + this.quantity + " ]";
    }
}
