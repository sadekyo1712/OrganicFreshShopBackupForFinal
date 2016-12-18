package com.OrganicFreshShop.dao;

import com.OrganicFreshShop.model.Account;
import com.OrganicFreshShop.model.PaginatorResult;

/**
 * Created by root on 11/22/16.
 */
public interface AccountDAO {

    public Account fetchAccount( String username );
    public PaginatorResult<Account> listAccountPaginatorResult( int page, int resultEachPage, int maxNavigationPage );
    public boolean createAccount( Account account );
    public boolean updateAccount( Account account );
    public boolean deleteAccount( String username );
}
