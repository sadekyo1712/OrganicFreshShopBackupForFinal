package com.OrganicFreshShop.model;

import org.springframework.security.access.method.P;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by root on 11/22/16.
 */
public class Cart {

    private int orderNum;
    private Customer customer;
    private List<CartEntriesProduct> cartEntriesProducts = new ArrayList<CartEntriesProduct>();

    public Cart() {

    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum( int orderNum ) {
        this.orderNum = orderNum;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer( Customer customer ) {
        this.customer = customer;
    }

    public void setCustomer( Account account ) {
        customer = new Customer();
        customer.setName( account.getName() );
        customer.setPhone( account.getPhone() );
        customer.setEmail( account.getEmail() );
        customer.setAddress( account.getAddress() );
    }

    public void setCartEntriesProducts(List<CartEntriesProduct> cartEntriesProducts) {
        this.cartEntriesProducts = cartEntriesProducts;
    }

    public List<CartEntriesProduct> getCartEntriesProducts() {
        return cartEntriesProducts;
    }

    public CartEntriesProduct findCartEntryProductByCode( String code) {
        for ( CartEntriesProduct entriesProduct : cartEntriesProducts ) {
            if ( entriesProduct.getProduct().getCode().equals( code ) )
                return entriesProduct;
        }
        return null;
    }

    public void addProduct( Product product, int quantity ) {

        CartEntriesProduct entriesProduct = findCartEntryProductByCode( product.getCode() );

        if ( entriesProduct == null ) {
            entriesProduct = new CartEntriesProduct();
            entriesProduct.setProduct( product );
            cartEntriesProducts.add( entriesProduct );
        }

        int newQuantity = entriesProduct.getQuantity() + quantity;
        if ( newQuantity > 0  )
            entriesProduct.setQuantity( newQuantity );
        else
            cartEntriesProducts.remove( entriesProduct );
    }

    public void removeProduct( Product product ) {

        CartEntriesProduct entriesProduct = findCartEntryProductByCode( product.getCode() );
        if( entriesProduct != null )
            cartEntriesProducts.remove( entriesProduct );
    }

    public void updateProduct( String code, int quantity ) {

        CartEntriesProduct entriesProduct = findCartEntryProductByCode( code );

        if ( entriesProduct != null ) {
            if ( quantity > 0 )
                entriesProduct.setQuantity( quantity );
            else
                cartEntriesProducts.remove( entriesProduct );
        }
    }

    public void validate() {

    }

    public boolean isEmptyCart() {
        return cartEntriesProducts.isEmpty();
    }

    public boolean isValidCustomer() {
        return ( customer != null ) && ( customer.isValidCustomer() );
    }

    public boolean isValidCart() {
        return ( customer != null ) && ( customer.isFullCustomerInfo() ) && ( !cartEntriesProducts.isEmpty() );
    }

    public int getQuantityTotalInCart() {

        int totalQuantity = 0;
        for ( CartEntriesProduct entriesProduct : cartEntriesProducts ) {
            totalQuantity += entriesProduct.getQuantity();
        }
        return totalQuantity;
    }

    public double getAmountTotalInCart() {

        double totalAmount = 0d;
        for ( CartEntriesProduct entriesProduct : cartEntriesProducts ) {
            totalAmount += entriesProduct.getAmount();
        }
        return totalAmount;
    }

    public void updateQuantityThroughCartForm( Cart cart ) {
        if( cart != null ) {
            List<CartEntriesProduct> cartEntriesProductsInForm = cart.getCartEntriesProducts();
            for ( CartEntriesProduct entriesProductInForm : cartEntriesProductsInForm ) {
                this.updateProduct( entriesProductInForm.getProduct().getCode(), entriesProductInForm.getQuantity() );
            }
        }
    }

    public String getFirstProduct() {
        return this.getCartEntriesProducts().get( cartEntriesProducts.size() - 1 ).getProduct().getName();
    }

    @Override
    public String toString() {
        return "[ Cart : " + "order number : " + this.orderNum + " , custome : " + this.customer +
                " , cart detail : " + this.cartEntriesProducts + " ]" ;
    }
}
