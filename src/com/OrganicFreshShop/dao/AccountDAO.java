package com.OrganicFreshShop.dao;

import com.OrganicFreshShop.model.Account;

/**
 * Created by root on 11/22/16.
 */
public interface AccountDAO {

    public Account fetchAccount( String username );
    public boolean createAccount( Account account );
    public boolean updateAccount( Account account );
    public boolean deleteAccount( String username );
}
