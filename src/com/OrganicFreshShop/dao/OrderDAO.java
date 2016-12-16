package com.OrganicFreshShop.dao;

import com.OrganicFreshShop.model.Cart;
import com.OrganicFreshShop.model.Order;
import com.OrganicFreshShop.model.OrderDetail;
import com.OrganicFreshShop.model.PaginatorResult;

import java.util.List;

/**
 * Created by root on 11/22/16.
 */
public interface OrderDAO {

    public void saveOrder(Cart cart);
    public Order getOrder( String orderID );
    public List<OrderDetail> getListOrderDetailByOrderID( String orderID );
    public PaginatorResult<Order> listOrderPaginatorResult( int page, int resultEachPage, int maxNavigationPage );
    public List<Order> listOrder();
}
