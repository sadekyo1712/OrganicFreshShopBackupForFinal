package com.OrganicFreshShop.mapper;

import com.OrganicFreshShop.model.Order;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by root on 11/22/16.
 */
public class OrderMapper implements RowMapper<Order> {

    @Override
    public Order mapRow(ResultSet resultSet, int i) throws SQLException {
        Order order = new Order();
        order.setId( resultSet.getString("ID") );
        order.setAmount( resultSet.getDouble("Amount") );
        order.setCustomerAddress( resultSet.getString("Customer_Address") );
        order.setCustomerEmail( resultSet.getString("Customer_Email") );
        order.setCustomerName( resultSet.getString("Customer_Name") );
        order.setCustomerPhone( resultSet.getString("Customer_Phone") );
        order.setOrderDate( resultSet.getDate("Order_Date") );
        order.setOrderNumber( resultSet.getInt("Order_Num") );
        return order;
    }
}
