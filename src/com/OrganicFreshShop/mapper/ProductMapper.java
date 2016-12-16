package com.OrganicFreshShop.mapper;

import com.OrganicFreshShop.model.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by root on 11/22/16.
 */
public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product mapRow(ResultSet resultSet, int i) throws SQLException {

        Product product = new Product();
        product.setCode( resultSet.getString("Code") );
        product.setName( resultSet.getString("Name") );
        product.setPriceTag( resultSet.getDouble("Price") );
        product.setData( resultSet.getBytes("Image") );
        product.setCreatedDate( resultSet.getDate("Create_Date") );
        product.setTimestamp( resultSet.getTimestamp("Create_Date") );
        product.setDescription( resultSet.getString("Description") );
        product.setUri( resultSet.getString("URI") );
        product.setCreatedAccount( resultSet.getString("Create_Account") );
        return product;
    }
}
