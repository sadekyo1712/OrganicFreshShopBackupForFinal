package com.OrganicFreshShop.config;

import com.OrganicFreshShop.authentication.DBAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Created by root on 11/22/16.
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DBAuthenticationService dbAuthenticationService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder
                .userDetailsService( dbAuthenticationService )
                .passwordEncoder( passwordEncoder() );
    }

    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    protected void configure(HttpSecurity httpSecurity) throws Exception {

        httpSecurity.csrf().disable();

        httpSecurity.authorizeRequests().antMatchers("/account_info", "/account_change_info")
                .access("hasAnyRole('ROLE_EMPLOYEE','ROLE_MANAGER','ROLE_USER','ROLE_SUPPLIER')");
        httpSecurity.authorizeRequests().antMatchers("/order_list", "/order")
                .access("hasAnyRole('ROLE_EMPLOYEE','ROLE_MANAGER')");
        httpSecurity.authorizeRequests().antMatchers("/product_admin", "/supplier_product_list",
                "/create_product", "/empty")
                .access("hasRole('ROLE_SUPPLIER')");

        httpSecurity.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
        httpSecurity.authorizeRequests().and().formLogin()
                .loginProcessingUrl("/j_spring_security_check")
                .loginPage("/login")
                .defaultSuccessUrl("/account_info")
                .failureUrl("/login?error=true")
                .usernameParameter("username")
                .passwordParameter("password")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/index");
    }
}
