package com.OrganicFreshShop.controller;

import com.OrganicFreshShop.daoImplements.AccountDAOImplement;
import com.OrganicFreshShop.daoImplements.OrderDAOImplement;
import com.OrganicFreshShop.daoImplements.ProductDAOImplement;
import com.OrganicFreshShop.model.*;
import com.OrganicFreshShop.util.Utils;
import com.OrganicFreshShop.validator.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by root on 11/23/16.
 */
@Controller
public class AdminController {

    @Autowired
    private AccountDAOImplement accountDAOImplement;

    @Autowired
    private OrderDAOImplement orderDAOImplement;

    @Autowired
    private ProductDAOImplement productDAOImplement;

    @Autowired
    private ProductValidator productValidator;

    @Autowired
    private ResourceBundleMessageSource resourceBundleMessageSource;

    @InitBinder
    public void initBinder( WebDataBinder dataBinder ) {
        Object target = dataBinder.getTarget();
        if ( target == null )
            return;
        if ( target.getClass() == Product.class ) {
            System.out.println( "Target : " + target );
            dataBinder.setValidator( productValidator );
            dataBinder.registerCustomEditor( byte[].class, new ByteArrayMultipartFileEditor() );
            System.out.println("--------------------------------------------");
        }
    }

    /**
     * Thong tin tai khoan hien tai
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping( value = "/account_info", method = RequestMethod.GET )
    public String accountInfo(ModelMap modelMap, HttpServletRequest request) {

        UserDetails userDetails = ( UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println("-----------Spring Security support :-------");
        System.out.println( "* Password : " + userDetails.getPassword() );
        System.out.println( "* Username : " + userDetails.getUsername() );
        System.out.println( "* Enabled user : " + userDetails.isEnabled() );
        System.out.println("---------------------------------------------");
        System.out.println("In account info page");
        Account account = accountDAOImplement.fetchAccount( userDetails.getUsername() );
        modelMap.addAttribute( "account", account );
        modelMap.addAttribute( "userDetail", userDetails );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "account_info";
    }

    /**
     * Thay doi thong tin tai khoan
     * @param modelMap
     * @param request
     * @param userName
     * @return
     */
    @RequestMapping( value = "/account_change_info", method = RequestMethod.GET )
    public String accountChangeInfo( ModelMap modelMap, HttpServletRequest request,
                                     @RequestParam( value = "user_name") String userName ) {
        Account account = accountDAOImplement.fetchAccount( userName );
        System.out.println( account );
        modelMap.addAttribute( "account", account );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In account change info HTTP_GET");
        return "account_change_info";
    }

    /**
     * Luu thong tin tai khoan bi thay doi
     * @param modelMap
     * @param request
     * @param account
     * @return
     */
    @RequestMapping( value = "/account_change_info", method = RequestMethod.POST )
    public String saveAccountChange( ModelMap modelMap, HttpServletRequest request,
                                     @ModelAttribute( "account" ) Account account ) {
        try {
            accountDAOImplement.updateAccount( account );
        } catch ( Exception ex ) {
            System.out.println( "Error when save account change info" );
            ex.printStackTrace();
            return "redirect:/account_change_info";
        }
        System.out.println( account );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In account_change_info HTTP_POST and is redirecting to home page.....");
        return "successful";
    }

    /**
     * Xem danh sach hoa don
     * @param modelMap
     * @param request
     * @param pageString
     * @return
     */
    @RequestMapping( value = "/order_list", method = RequestMethod.GET )
    public String orderList( ModelMap modelMap, HttpServletRequest request,
                             @RequestParam( value = "page", defaultValue = "1") String pageString ) {
        int page;
        try {
            page = Integer.parseInt( pageString );
        } catch ( Exception ex ) {
            System.out.println("Error when cast page number in order_list and is redirecting to index.........");
            ex.printStackTrace();
            return "error";
        }
        final int maxResult = 7;
        final int maxNavigationPage = 10;
        PaginatorResult<Order> result =
                orderDAOImplement.listOrderPaginatorResult( page, maxResult, maxNavigationPage );
        modelMap.addAttribute( "paginatorResult", result );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In order_list page with order list : " + result ) ;
        return "order_list";
    }

    /**
     * Xem danh sach tai khoan
     * @param modelMap
     * @param request
     * @param pageString
     * @return
     */
    @RequestMapping( value = "/account_list", method = RequestMethod.GET )
    public String accountList( ModelMap modelMap, HttpServletRequest request,
                               @RequestParam( value = "page", defaultValue = "1") String pageString ) {
        int page;
        try {
            page = Integer.parseInt( pageString );
        } catch ( Exception ex ) {
            System.out.println("Error when cast page number in account_list");
            ex.printStackTrace();
            return "error";
        }
        final int maxResult = 7;
        final int maxNavigationPage = 10;
        PaginatorResult<Account> result =
                accountDAOImplement.listAccountPaginatorResult( page, maxResult, maxNavigationPage );
        modelMap.addAttribute( "offset", ( ( page - 1 ) * maxResult ) );
        modelMap.addAttribute( "paginatorResult", result );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In account_list page with account list : " + result ) ;
        return "account_list";
    }

    /**
     * Xem thong tin chi tiet cua mot tai khoan
     * @param modelMap
     * @param request
     * @param username
     * @return
     */
    @RequestMapping( value = "/account_detail_info", method = RequestMethod.GET )
    public String accountDetail( ModelMap modelMap, HttpServletRequest request,
                                 @RequestParam( value = "username") String username ) {

        Account account = null;
        if ( username != null ) {
            account = accountDAOImplement.fetchAccount( username );
        }
        if ( account == null )
            return "error";
        modelMap.addAttribute( "user", account );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "admin_account_detail";
    }

    /**
     * Thay doi trang thai tai khoan
     * @param modelMap
     * @param request
     * @param username
     * @param active
     * @return
     */
    @RequestMapping( value = "/account_detail_info", method = RequestMethod.POST )
    public String changeStateAccount( ModelMap modelMap, HttpServletRequest request,
                                      @RequestParam( value = "username") String username,
                                      @RequestParam( value = "active") String active ) {
        Account account;
        try {
            account = accountDAOImplement.fetchAccount( username );
        } catch ( Exception ex ) {
            ex.printStackTrace();
            return "error";
        }
        boolean state = Boolean.parseBoolean( active );
        boolean accountState = account.isActive();
        if ( state != accountState ) {
            account.setActive( state );
            try {
                accountDAOImplement.updateAccount( account );
            } catch ( Exception ex ) {
                ex.printStackTrace();
                return "error";
            }
        }
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "redirect:/account_list";
    }

    /**
     * Xem danh sach san pham duoc cung cap boi nha cung cap san pham
     * @param modelMap
     * @param request
     * @param searchName
     * @param page
     * @param username
     * @return
     */
    @RequestMapping( value = "/supplier_product_list")
    public String listProduct( ModelMap modelMap, HttpServletRequest request,
                               @RequestParam( value = "name", defaultValue = "") String searchName,
                               @RequestParam( value = "page", defaultValue = "1") int page,
                               @RequestParam( value = "user_name") String username ) {

        final int maxResult = 12;
        final int maxNavigationPage = 6;
        PaginatorResult<Product> result = productDAOImplement.
                fetchAllProductsCreatedByAccountPaginatorResult( page, maxResult, maxNavigationPage, username);
        int totalProduct = result.getTotalRecord();
        if ( totalProduct == 0 ) {
            modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
            return "empty";
        }
        modelMap.addAttribute( "paginatorProduct", result );
        modelMap.addAttribute( "totalProduct", totalProduct );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("Product list : " + result + "\n\n");
        return "supplier_product_list";
    }

    /**
     * Chinh sua thong tin cua san pham
     * @param modelMap
     * @param request
     * @param code
     * @param username
     * @return
     */
    @RequestMapping( value = "/product_admin", method = RequestMethod.GET )
    public String product( ModelMap modelMap, HttpServletRequest request,
                           @RequestParam( value = "code", defaultValue = "S1")String code,
                           @RequestParam( value = "user_name") String username) {
        Product product = null;
        if ( code != null && code.length() > 0 )
            product = productDAOImplement.fetchProduct( code );
        if ( product == null ) {
            product = new Product();
        }
        modelMap.addAttribute( "user_name", username );
        modelMap.addAttribute( "productForm", product );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In product_admin HTTP_GET page");
        return "product_admin";
    }

    /**
     * Luu thong tin san pham bi chinh sua
     * @param modelMap
     * @param request
     * @param user_name
     * @param product
     * @param bindingResult
     * @return
     */
    @RequestMapping( value = "/product_admin", method = RequestMethod.POST )
    public String productSave( ModelMap modelMap, HttpServletRequest request,
                               @RequestParam( value = "user_name" ) String user_name,
                               @ModelAttribute( "productForm" ) @Validated Product product,
                               BindingResult bindingResult ) {
        if ( bindingResult.hasErrors() ) {
            System.out.println("Error when binding result");
        }
        try {
            productDAOImplement.saveProduct( product );
        } catch ( Exception ex ) {
            System.out.println("Error when save product in product_admin HTTP_POST");
            ex.printStackTrace();
            modelMap.addAttribute("message", ex.getMessage() );
            return "redirect:/product_admin";
        }
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In product_admin HTTP_POST and is redirecting to product_list");
        return "redirect:/supplier_product_list?user_name=" + user_name ;
    }

    /**
     * Xem thong tin chi tiet cua mot hoa don voi orderID
     * @param modelMap
     * @param request
     * @param orderID
     * @return
     */
    @RequestMapping( value = "/order", method = RequestMethod.GET )
    public String viewOrder( ModelMap modelMap, HttpServletRequest request,
                             @RequestParam( value = "orderID") String orderID ) {
        Order order = null;
        if ( orderID != null )
            order = orderDAOImplement.getOrder( orderID );
        if ( order == null ) {
            System.out.println("Not found order with orderID : " + orderID + " and is redirecting to order_list page....." );
            return "404";
        }
        modelMap.addAttribute( "order", order );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("Fetch order : " + order + " successfully !");
        return "order_detail_admin";
    }

}
