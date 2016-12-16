package com.OrganicFreshShop.daoImplements;

import com.OrganicFreshShop.dao.OrderDAO;
import com.OrganicFreshShop.mapper.OrderDetailMapper;
import com.OrganicFreshShop.mapper.OrderMapper;
import com.OrganicFreshShop.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by root on 11/22/16.
 */
public class OrderDAOImplement implements OrderDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    private ProductDAOImplement productDAOImplement;

    @Autowired
    public OrderDAOImplement( DataSource dataSource ) {
        this.dataSource = dataSource;
        jdbcTemplate = new JdbcTemplate( dataSource );
        productDAOImplement = new ProductDAOImplement( dataSource );
    }

    public int getMaxOrderNumber() {
        String SQL_MAX_ORDER_NUM = "Select max(Order_Num) From Orders";
        try {
            Integer value = jdbcTemplate.queryForObject( SQL_MAX_ORDER_NUM, Integer.class );
            if ( value == null )
                return 0;
            return value;
        } catch ( Exception ex ) {
            System.out.println("Error in getMaxOrderNumber()");
        }
        return 0;
    }

    @Override
    public List<OrderDetail> getListOrderDetailByOrderID(String orderID) {
        String SQL_ORDER_DETAIL = "select * from Order_Details where ORDER_ID = ?";
        try {
            List<OrderDetail> orderDetailList =
                    jdbcTemplate.query( SQL_ORDER_DETAIL, new Object[]{ orderID }, new OrderDetailMapper() );
            for ( int i = 0; i < orderDetailList.size(); i++ ) {
                OrderDetail orderDetail = orderDetailList.get( i );
                orderDetail.setProductName(
                        productDAOImplement.fetchProduct( orderDetail.getProductCode() ).getName() );
                orderDetail.setUri( productDAOImplement.fetchProduct( orderDetail.getProductCode() ).getUri() );
                orderDetailList.set( i, orderDetail );
            }
            return orderDetailList;
        } catch ( Exception ex ) {
            System.out.println("Error in getListOrderDetailByOrderID()");
        }
        return null;
    }

    @Override
    public Order getOrder(String orderID) {
        String SQL_GET_ORDER = "select * " +
                               "from Orders " +
                               "where ID = ?";
        try {
            Order order = jdbcTemplate.queryForObject( SQL_GET_ORDER, new Object[]{ orderID }, new OrderMapper() );
            order.setOrderDetails( this.getListOrderDetailByOrderID( orderID ) );
            return order;
        } catch ( Exception ex ) {
            System.out.println("Error int getOrder()");
        }
        return null;
    }

    @Override
    public PaginatorResult<Order> listOrderPaginatorResult(int page, int resultEachPage, int maxNavigationPage) {
        String SQL_FETCH_ORDER_PAGINATOR = "select * from Orders limit ?, ?";
        String SQL_COUNT_TOTAL_RECORD = "select count(*) from Orders";
        int fromIndex = ( page - 1 ) * resultEachPage;
        try {
            List<Order> list = jdbcTemplate.query( SQL_FETCH_ORDER_PAGINATOR,
                    new Object[]{ fromIndex, resultEachPage }, new OrderMapper() );
            int totalRecord = jdbcTemplate.queryForObject( SQL_COUNT_TOTAL_RECORD, Integer.class );
            for ( int i = 0; i < list.size(); i++ ) {
                Order order = list.get( i );
                order.setOrderDetails( this.getListOrderDetailByOrderID( order.getId() ) );
                list.set( i, order );
            }
            PaginatorResult<Order> result =
                    new PaginatorResult<>( page, resultEachPage, maxNavigationPage, list, totalRecord );
            result.setTotalRecord( totalRecord );
            return result;
        } catch ( Exception ex ) {
            System.out.println("Error in listOrderPaginatorResult()");
        }
        return null;
    }

    @Override
    public List<Order> listOrder() {

        String SQL_LIST_ALL_ORDER = "select * " +
                                    "from Orders " +
                                    "order by Order_Num desc";
        try {
            List<Order> orderList = jdbcTemplate.query( SQL_LIST_ALL_ORDER, new OrderMapper());
            for ( int i = 0; i < orderList.size(); i++ ) {
                Order order = orderList.get( i );
                order.setOrderDetails( this.getListOrderDetailByOrderID( order.getId() ) );
                orderList.set( i, order );
            }
            return orderList;
        } catch ( Exception ex ) {
            System.out.println("Error in listOrder()");
        }
        return null;
    }

    @Override
    public void saveOrder(Cart cart) {

        int orderNumber = this.getMaxOrderNumber() + 1;
        Order order = new Order();
        order.setId( UUID.randomUUID().toString() );
        order.setOrderNumber( orderNumber );
        order.setOrderDate( new Date());
        order.setAmount( cart.getAmountTotalInCart() );
        Customer customerInformation = cart.getCustomer();
        order.setCustomerName( customerInformation.getName() );
        order.setCustomerEmail( customerInformation.getEmail() );
        order.setCustomerAddress( customerInformation.getAddress() );
        order.setCustomerPhone( customerInformation.getPhone() );

        String SQL_ORDER_INSERT =
                "insert into Orders( ID, Amount, Customer_Address, Customer_Email, Customer_Name, Customer_Phone, Order_Date, Order_Num ) " +
                "values ( ?, ?, ?, ?, ?, ?, ?, ? )";
        try {
            jdbcTemplate.update( SQL_ORDER_INSERT, order.getId(),
                    order.getAmount(), order.getCustomerAddress(),
                    order.getCustomerEmail(), order.getCustomerName(),
                    order.getCustomerPhone(), order.getOrderDate(),
                    order.getOrderNumber() );
        } catch ( Exception ex ) {
            System.out.println("Error when insert Order in saveOrder()");
            return;
        }

        for ( CartEntriesProduct entriesProduct : cart.getCartEntriesProducts() ) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setId( UUID.randomUUID().toString() );
            orderDetail.setAmount( entriesProduct.getAmount() );
            orderDetail.setPrice( entriesProduct.getProduct().getPriceTag() );
            orderDetail.setQuantity( entriesProduct.getQuantity() );
            orderDetail.setOrderCode( order.getId() );
            orderDetail.setProductCode( entriesProduct.getProduct().getCode() );
            orderDetail.setUri( entriesProduct.getProduct().getUri() );

            try {
                String SQL_ORDER_DETAILS_INSERT = "insert into Order_Details( ID, Amount, Price, Quantity, ORDER_ID, PRODUCT_ID ) " +
                        "values ( ?, ?, ?, ?, ?, ? )";
                jdbcTemplate.update( SQL_ORDER_DETAILS_INSERT,
                        orderDetail.getId(), orderDetail.getAmount(),
                        orderDetail.getPrice(), orderDetail.getQuantity(),
                        orderDetail.getOrderCode(),
                        orderDetail.getProductCode() );
            } catch ( Exception ex ) {
                System.out.println("Error when insert Order_Details : " + orderDetail + " in saveOrder()");
                ex.printStackTrace();
                return;
            }
        }
        System.out.println("Save Order : " + order + " successfully");
        cart.setOrderNum( orderNumber );
    }
}
