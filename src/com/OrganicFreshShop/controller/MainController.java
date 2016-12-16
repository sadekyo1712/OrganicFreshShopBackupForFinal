package com.OrganicFreshShop.controller;

import com.OrganicFreshShop.daoImplements.AccountDAOImplement;
import com.OrganicFreshShop.daoImplements.OrderDAOImplement;
import com.OrganicFreshShop.daoImplements.ProductDAOImplement;
import com.OrganicFreshShop.model.*;
import com.OrganicFreshShop.util.Utils;
import com.OrganicFreshShop.validator.CustomerValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by root on 11/23/16.
 */
@Controller
public class MainController {

    @Autowired
    private OrderDAOImplement orderDAOImplement;

    @Autowired
    private ProductDAOImplement productDAOImplement;

    @Autowired
    private AccountDAOImplement accountDAOImplement;

    @Autowired
    private CustomerValidator customerValidator;

    @InitBinder
    public void initDataBinder( WebDataBinder dataBinder ) {
        Object target = dataBinder.getTarget();
        if ( target == null ) {
            System.out.println("No targer found !");
            return;
        }
        if ( target.getClass() == Cart.class) {
            System.out.println("Cart info : " + target );
        }
        if ( target.getClass() == Customer.class ) {
            dataBinder.setValidator( customerValidator );
            System.out.println("Customer info : " + target );
        } else {
            System.out.println("Target Object : " + target ) ;
        }
    }

//    @RequestMapping( value = "/empty")
//    public String empty() {
//        return "empty";
//    }
//
//    @RequestMapping( value = "/notfound")
//    public String notFound() {
//        return "not_found";
//    }
//
//    @RequestMapping( value = "successful")
//    public String succ() {
//        return "successful";
//    }

   @RequestMapping( value = "/index")
    public String home( ModelMap modelMap, HttpServletRequest request ) {
        System.out.println("In Homepage");
        List<Product> list;
        Cart cart = Utils.getCartInSession( request );
        int qtyProductDemo = 3;
        list = productDAOImplement.listRandomProductDemo( qtyProductDemo );
        modelMap.addAttribute( "listProductDemo", list );
        list = productDAOImplement.listRandomProductDemo( qtyProductDemo );
        modelMap.addAttribute( "listProductDemo2", list );
        modelMap.addAttribute( "cartForm", cart );
        return "index";
    }

    @RequestMapping( value = "/error")
    public String error( ModelMap modelMap, HttpServletRequest request ) {
        System.out.println("In error page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "error";
    }

    @RequestMapping( value = "/intro")
    public String introductionToNewFunction( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("New fuction page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "intro";
    }

    @RequestMapping( value = "/404")
    public String pageNotFound( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("404 page - Page not found!");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "404";
    }

    @RequestMapping( value = "/403")
    public String accessDenied( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("404 page - Page not found!");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "403";
    }

    @RequestMapping( value = "/about")
    public String about( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("About page");
        List<Product> list;
        int qtyProductDemo = 4;
        list = productDAOImplement.listRandomProductDemo( qtyProductDemo );
        modelMap.addAttribute( "listProductDemo", list );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "about";
    }

    @RequestMapping( value = "/contact")
    public String contact( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("Contact page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "contact";
    }

    /**
     * Hien thi trang blog so tay noi tro
     * @return
     */
    @RequestMapping( value = "/index_single")
    public String single( HttpServletRequest request, ModelMap modelMap ) {
        System.out.println("In index_single page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "index_single";
    }

    /**
     * GET : Dang ky tai khoan moi
     * @return
     */
    @RequestMapping( value = "/register", method = RequestMethod.GET )
    public String registerPage( ModelMap modelMap, HttpServletRequest request,
                                @RequestParam( value = "message", defaultValue = "") String message ) {
        modelMap.addAttribute( "account", new Account() );
        modelMap.addAttribute( "message", message );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In register HTTP_GET page");
        return "register";
    }

    /**
     * POST : Luu tai khoan vao co do su lieu
     * @param modelMap
     * @param account
     * @return
     */
    @RequestMapping( value = "/register", method = RequestMethod.POST )
    public String addAccount( ModelMap modelMap, HttpServletRequest request,
                              @ModelAttribute( "account" ) Account account ) {
        boolean isExist = !( accountDAOImplement.createAccount( account ) );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        if ( isExist )
            return "redirect:/register?message=" + "Tài khoản đã tồn tại" ;
        System.out.println("In register HTTP_POST and is redirecting to home page....");
        return "successful";
    }

    /**
     * GET Show login
     * @param modelMap
     * @return
     */
    @RequestMapping( value = "/login", method = RequestMethod.GET )
    public String login( ModelMap modelMap, HttpServletRequest request ) {
        System.out.println("Login page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "login";
    }

    @RequestMapping( value = "/logout", method = RequestMethod.GET )
    public String logout( ModelMap modelMap, HttpServletRequest request ) {
        System.out.println("Logout and redirect to homepage");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "successful";
    }

    @RequestMapping( value = "/product_list")
    public String listProduct( ModelMap modelMap, HttpServletRequest request,
                               @RequestParam( value = "name", defaultValue = "") String searchName,
                               @RequestParam( value = "page", defaultValue = "1") int page ) {

        final int maxResult = 12;
        final int maxNavigationPage = 6;

        PaginatorResult<Product> result =
                productDAOImplement.findAllProductMatchNamePatternPaginatorResult( page, maxResult,
                        maxNavigationPage, searchName );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        if ( result == null )
            return "not_found";
        int totalProduct = result.getTotalRecord();
        modelMap.addAttribute( "paginatorProduct", result );
        modelMap.addAttribute( "totalProduct", totalProduct );
        System.out.println("Product list : " + result + "\n\n");
        return "product_list";
    }

    @RequestMapping( value = "/create_product", method = RequestMethod.GET )
    public String createProduct( ModelMap modelMap, HttpServletRequest request ) {

        modelMap.addAttribute( "productForm", new Product() );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In create_product HTTP_GET page");
        return "create_product";
    }

    @RequestMapping( value = "/create_product", method = RequestMethod.POST )
    public String createProduct( ModelMap modelMap, HttpServletRequest request,
                                 @RequestParam( value = "user_name") String username,
                                 @ModelAttribute( "productForm" ) @Validated Product product,
                                 BindingResult bindingResult ) {
        if ( bindingResult.hasErrors() ) {
            System.out.println("Error when binding result");
            return "redirect:/create_product";
        }
        product.setCode( UUID.randomUUID().toString() );
        product.setCreatedAccount( username );
        try {
            productDAOImplement.saveProduct( product );
        } catch ( Exception ex ) {
            System.out.println("Error when save product in product_admin HTTP_POST");
            ex.printStackTrace();
            modelMap.addAttribute("message", ex.getMessage() );
            return "redirect:/create_product";
        }
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In create_product HTTP_POST and is redirecting to product_list");
        return "redirect:/supplier_product_list?user_name=" + username ;
    }

    @RequestMapping( value = "/buy_product")
    public String buyProductHandle( HttpServletRequest servletRequest, ModelMap modelMap,
                                    @RequestParam( value = "code", defaultValue = "") String code) {
        Product product = null;
        if ( ( code != null ) && ( code.length() > 0 ) )
            product = productDAOImplement.fetchProduct( code );
        if ( product != null ) {
            Cart cart = Utils.getCartInSession( servletRequest );
            cart.addProduct( product, 1 );
        }
        System.out.println("In buy product page and is redirecting to checkout page.......");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        return "redirect:/checkout";
    }

    @RequestMapping( value = "/remove_product")
    public String removeProductHandle( HttpServletRequest servletRequest,
                                       ModelMap modelMap,
                                       @RequestParam( value = "code", defaultValue = "")String code ) {
        Product product = null;
        if ( code != null && code.length() > 0 )
            product = productDAOImplement.fetchProduct( code );
        if ( product != null ) {
            Cart cart = Utils.getCartInSession( servletRequest );
            cart.removeProduct( product );
        }
        System.out.println("In remove product page and is redirecting to checkout page");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        return "redirect:/checkout";
    }

    @RequestMapping( value = "/empty_cart")
    public String removeCart( HttpServletRequest request, ModelMap modelMap ) {
        Utils.removeCartInSession( request );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        return "redirect:/checkout";
    }

    /**
     * Gioi thieu thong tin cua mot san pham voi code san pham
     * @param modelMap
     * @param code
     * @return
     */
    @RequestMapping( value = "/product_info" , method = RequestMethod.GET )
    public String productInformation(
            ModelMap modelMap, HttpServletRequest request,
            @RequestParam( value = "code", defaultValue = "S1")String code ) {
        Product product = null;
        if ( code.equals("") )
            return "redirect:/product_list";
        else if ( code.length() > 0 ) {
            product = productDAOImplement.fetchProduct( code );
        }
        if ( product == null )
            return "redirect:/product_list";
        List<Product> listRandomProductDemo = productDAOImplement.listRandomProductDemo( 4 );
        modelMap.addAttribute( "product", product );
        modelMap.addAttribute( "listRandomProductDemo", listRandomProductDemo );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( request ) );
        System.out.println("In product info page with product : " + product +
                "\n--------------------------------------");
        return "product_information";
    }

    @RequestMapping( value = "/checkout", method = RequestMethod.GET )
    public String shoppingCart( HttpServletRequest servletRequest,
                                ModelMap modelMap ) {
        Cart cart = Utils.getCartInSession( servletRequest );
        modelMap.addAttribute( "cartForm", cart );
        System.out.println("In checkout HTTP_GET page");
        return "checkout";
    }

    @RequestMapping( value = "/checkout", method = RequestMethod.POST )
    public String shoppingCartUpdateCart( HttpServletRequest servletRequest,
                                          ModelMap modelMap,
                                          @ModelAttribute("cartForm") Cart cartForm ) {
        Cart cart = Utils.getCartInSession( servletRequest );
        cart.updateQuantityThroughCartForm( cartForm );
        modelMap.addAttribute( "cartForm", cart );
        System.out.println("In checkout HTTP_POST page");
        return "redirect:/checkout";
    }


    @RequestMapping( value = "/checkout_customer", method = RequestMethod.GET )
    public String shoppingCartCustomerForm( HttpServletRequest servletRequest,
                                            ModelMap modelMap ) {
        Cart cart = Utils.getCartInSession( servletRequest );
        Customer customer = cart.getCustomer();
        if ( customer == null )
            customer = new Customer();
        if ( cart.isEmptyCart() ) {
            System.out.println("In customer info page but empty cart.....");
        }
        modelMap.addAttribute( "customerForm", customer );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        System.out.println( "In customer info page with HTTP_GET :\nCustomer info : " + customer +
                "\n-----------------------------------");
        return "customer_info";
    }

    @RequestMapping( value = "/checkout_customer", method = RequestMethod.POST )
    public String shoppingCartCustomerSaveInfo(HttpServletRequest servletRequest,
                                               ModelMap modelMap,
                                               @ModelAttribute("customerForm") @Validated Customer customerForm,
                                               BindingResult bindingResult) {
        if ( bindingResult.hasErrors() ) {
            customerForm.setValidCustomer( false );
            System.out.println("Error customer form and is redirecting to customer info HTTP_GET page...");
            return "redirect:/checkout_customer";
        }
        customerForm.setValidCustomer( true );
        Cart cart = Utils.getCartInSession( servletRequest );
        cart.setCustomer( customerForm );
        System.out.println("In customer page HTTP_POST and is redirecting to checkout page.........");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        return "redirect:/checkout";
    }

    @RequestMapping( value = "/checkout_confirm", method = RequestMethod.GET )
    public String shoppingCartConfirmReview( HttpServletRequest servletRequest,
                                             ModelMap modelMap ) {
        Cart cart = Utils.getCartInSession( servletRequest );
        if ( cart == null ) {
            System.out.println("In checkout confirm page and is redirecting to checkout page........");
            return "redirect:/checkout";
        }
        System.out.println("In checkout_confirm page with cart info : " + cart +
                "\n--------------------------" +
                "\n and is redirecting to order_confirm to save order....." );
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        return "order_confirm";
    }

    @RequestMapping( value = "/order_confirm", method = RequestMethod.POST )
    public String shoppingCartConfirmSave( HttpServletRequest servletRequest,
                                           ModelMap modelMap ) {
        Cart cart = Utils.getCartInSession( servletRequest );
        if ( cart == null || cart.isEmptyCart() ) {
            System.out.println("Request to order_confirm page and is redirecting to checkout page");
            return "redirect:/checkout";
        }
        if ( cart.isValidCart() ) {
            orderDAOImplement.saveOrder( cart );
            Utils.removeCartInSession( servletRequest );
            Utils.storeLastCartInSession( servletRequest, cart );
            System.out.println("In order_confirm HTTP_POST, order save successfully !");
            modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
            return "successful";
        }
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        System.out.println("Cart is not valid to save and is redirecting to checkout HTTP_GET page.......");
        return "error";
    }

    @RequestMapping( value = "/productImage", method = RequestMethod.GET )
    public void productImage( HttpServletRequest servletRequest,
                              HttpServletResponse servletResponse,
                              ModelMap modelMap,
                              @RequestParam( value = "code") String code ) throws IOException {
        Product product = null ;
        if ( code != null ) {
            product = productDAOImplement.fetchProduct( code );
        }
        if ( product != null && product.getData() != null ) {
            servletResponse.setContentType("image/jpeg, image/jpg, image/png, image/gif");
            servletResponse.getOutputStream().write( product.getData() );
        }
        System.out.println("Get image data successfully !");
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        servletResponse.getOutputStream().close();
    }

    @RequestMapping( value = "/productImageURI", method = RequestMethod.GET )
    public String productImageURI(
            HttpServletRequest servletRequest,
            ModelMap modelMap,
            @RequestParam( value = "code") String code ) throws IOException {
        Product product = null ;
        if ( code != null ) {
            product = productDAOImplement.fetchProduct( code );
        }
        try {
            if ( product != null ) {
                String URI = product.getUri();
                modelMap.addAttribute( "uri", URI );
            }
        } catch ( Exception ex ) {
            System.out.println("Error when load image");
            modelMap.addAttribute( "uri", null );
        }
        modelMap.addAttribute( "cartForm", Utils.getCartInSession( servletRequest ) );
        return "product_admin";
    }
}
