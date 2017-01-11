package com.OrganicFreshShop.mapper;

import com.OrganicFreshShop.model.ProductInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by sadekyo1712
 * Desc : yolo, code & code for fun :D
 * KSCLC K57 - PFIEV - BKHN
 * Project : OrganicFreshShop
 * Package : com.OrganicFreshShop.mapper
 * Time : 8:52 PM
 * Date : 1/11/17/January
 * Year : 2017
 */
public class ProductsAdditionDetailMapper implements RowMapper<ProductInfo> {

    @Override
    public ProductInfo mapRow(ResultSet resultSet, int i) throws SQLException {

        ProductInfo productInfo = new ProductInfo();
        productInfo.setCode( resultSet.getString("Code") );
        productInfo.setCategory( resultSet.getString("Category") );
        productInfo.setDiscount( resultSet.getInt("Discount") );
        productInfo.setRate( resultSet.getInt("Rate") );
        productInfo.setSource( resultSet.getString("Source") );
        productInfo.setType( resultSet.getString("Type") );
        productInfo.setSeqcComment( resultSet.getString("Comment") );
        return productInfo;
    }
}
