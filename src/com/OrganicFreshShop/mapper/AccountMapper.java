package com.OrganicFreshShop.mapper;

import com.OrganicFreshShop.model.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by root on 11/22/16.
 */
public class AccountMapper implements RowMapper<Account> {

    @Override
    public Account mapRow(ResultSet resultSet, int i) throws SQLException {

        Account account = new Account();
        account.setUsername( resultSet.getString("User_Name") );
        account.setPassword( resultSet.getString("Password") );
        account.setActive( resultSet.getBoolean("Active") );
        account.setUserRole( resultSet.getString("User_Role") );
        account.setName( resultSet.getString("Name") );
        account.setAddress( resultSet.getString("Address") );
        account.setEmail( resultSet.getString("Email") );
        account.setPhone( resultSet.getString("Phone") );
        return account ;
    }
}
