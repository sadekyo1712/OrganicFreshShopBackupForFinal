package com.OrganicFreshShop.util;

import com.OrganicFreshShop.model.Cart;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by root on 11/23/16.
 */
public class Utils {

    public static Cart getCartInSession( HttpServletRequest request ) {

        Cart cart = ( Cart ) request.getSession().getAttribute("userCart");
        if ( cart == null ) {
            cart = new Cart();
            request.getSession().setAttribute( "userCart", cart );
        }
        System.out.println( "Cart in session : " + cart );
        return cart;
    }

    public static void removeCartInSession( HttpServletRequest request ) {
        request.getSession().removeAttribute( "userCart" );
    }

    public static void storeLastCartInSession( HttpServletRequest request, Cart cart ) {
        request.getSession().setAttribute( "lastCart", cart );
    }

    public static Cart getLastCartSession( HttpServletRequest request ) {
        return ( Cart )request.getSession().getAttribute( "lastCart" );
    }
}
