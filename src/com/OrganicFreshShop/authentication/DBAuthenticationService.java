package com.OrganicFreshShop.authentication;

import com.OrganicFreshShop.daoImplements.AccountDAOImplement;
import com.OrganicFreshShop.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by root on 11/22/16.
 */
@Service
public class DBAuthenticationService implements UserDetailsService {

    @Autowired
    public AccountDAOImplement accountDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = accountDAO.fetchAccount( username );
        System.out.println( account );

        if ( account == null )
            throw new UsernameNotFoundException( "User " + username +
                    "was not found in the databases" );
        String role = account.getUserRole();
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority( "ROLE_" + role );
        grantedAuthorityList.add( grantedAuthority );
        boolean enable = account.isActive();
        boolean accountNonExpried = true;
        boolean credentialNonExpried = true;
        boolean accountNonLocked = true;

        UserDetails userDetails = new User( account.getUsername(), account.getPassword(),
                enable, accountNonExpried, credentialNonExpried,accountNonLocked,grantedAuthorityList);
        return userDetails;
    }
}
