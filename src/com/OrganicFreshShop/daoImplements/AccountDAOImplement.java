package com.OrganicFreshShop.daoImplements;

import com.OrganicFreshShop.dao.AccountDAO;
import com.OrganicFreshShop.mapper.AccountMapper;
import com.OrganicFreshShop.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

/**
 * Created by root on 11/22/16.
 */
public class AccountDAOImplement implements AccountDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    private PasswordEncoder encoder;

    @Autowired
    public AccountDAOImplement( DataSource dataSource ) {
        this.dataSource = dataSource;
        jdbcTemplate = new JdbcTemplate( dataSource );
        encoder = new BCryptPasswordEncoder();
    }

    @Override
    public Account fetchAccount(String username) {
        String SQL_FETCH_ACCOUNT =
                "Select * " +
                "From Account " +
                "Where User_Name = ?";

        try {
            return jdbcTemplate.queryForObject( SQL_FETCH_ACCOUNT, new Object[]{ username }, new AccountMapper() );
        } catch ( Exception ex ) {
            System.out.println("Error when fetch Account in fetchAccount()");
        }
        return null;
    }

    @Override
    public boolean createAccount( Account account ) {
        String SQL_INSERT_ACCOUNT_USER =
                "insert into Account( User_Name, Active, Password, User_Role, Name, Address, Email, Phone )" +
                "values ( ?, ?, ?, ?, ?, ?, ?, ? )";
        String username = account.getUsername();
        Account accountTemp = null;
        accountTemp = this.fetchAccount( username );
        if ( accountTemp != null )
            return false;
        try {
            jdbcTemplate.update( SQL_INSERT_ACCOUNT_USER,
                    account.getUsername(),
                    account.isActive(),
                    encoder.encode( account.getPassword() ),
                    account.getUserRole(),
                    account.getName(),
                    account.getAddress(),
                    account.getEmail(),
                    account.getPhone() );
            System.out.println("Create account :" + account + " successfully !");
        } catch ( Exception ex ) {
            System.out.println("Error when create Account in createAccount()");
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean updateAccount( Account account ) {

        String SQL_UPDATE_ACCOUNT_USER =
                "update Account " +
                "set Active = ?, Password = ?, User_Role = ?, Name = ?, Address = ?, Email = ?, Phone = ? " +
                "where User_Name = ?";
        String username = account.getUsername();
        Account accountTemp = null;
        accountTemp = this.fetchAccount( username );
        if ( accountTemp == null )
            return false;
        try {
            if ( account.getPassword().contains("$2a$10$") ) {
                jdbcTemplate.update( SQL_UPDATE_ACCOUNT_USER,
                        account.isActive(),
                        account.getPassword(),
                        account.getUserRole(),
                        account.getName(),
                        account.getAddress(),
                        account.getEmail(),
                        account.getPhone(),
                        username );
            } else {
                jdbcTemplate.update( SQL_UPDATE_ACCOUNT_USER,
                        account.isActive(),
                        encoder.encode( account.getPassword() ),
                        account.getUserRole(),
                        account.getName(),
                        account.getAddress(),
                        account.getEmail(),
                        account.getPhone(),
                        username );
            }
            System.out.println("Update account :" + account + " successfully");
        } catch ( Exception ex ) {
            System.out.println("Error when update account in create account");
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteAccount(String username) {
        String SQL_DELETE_ACCOUNT_ASSOCIATE_PRODUCT = "delete from Products where Create_Account = ?";
        String SQL_DELETE_ACCOUNT = "delete from Account where User_Name = ?";
        Account account = this.fetchAccount( username );
        if ( account == null )
            return false;
        try {
            jdbcTemplate.update( SQL_DELETE_ACCOUNT_ASSOCIATE_PRODUCT, username );
            jdbcTemplate.update( SQL_DELETE_ACCOUNT, username );
        } catch ( Exception ex ) {
            System.out.println( "Error when delete account" );
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
