package com.OrganicFreshShop.mapper;

import com.OrganicFreshShop.model.OrderDetail;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by root on 11/22/16.
 */
public class OrderDetailMapper implements RowMapper<OrderDetail> {

    @Override
    public OrderDetail mapRow(ResultSet resultSet, int i) throws SQLException {

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId( resultSet.getString("ID") );
        orderDetail.setQuantity( resultSet.getInt("Quantity") );
        orderDetail.setAmount( resultSet.getDouble("Amount") );
        orderDetail.setPrice( resultSet.getDouble("Price") );
        orderDetail.setProductCode( resultSet.getString("PRODUCT_ID") );
        orderDetail.setOrderCode( resultSet.getString("ORDER_ID") );
        return orderDetail;
    }
}
