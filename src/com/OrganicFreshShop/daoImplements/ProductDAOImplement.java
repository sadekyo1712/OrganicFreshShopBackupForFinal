package com.OrganicFreshShop.daoImplements;

import com.OrganicFreshShop.dao.ProductDAO;
import com.OrganicFreshShop.mapper.ProductMapper;
import com.OrganicFreshShop.model.PaginatorResult;
import com.OrganicFreshShop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by root on 11/22/16.
 */
public class ProductDAOImplement implements ProductDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    private static final Random random = new Random();

    @Autowired
    public ProductDAOImplement( DataSource dataSource ) {
        this.dataSource = dataSource;
        jdbcTemplate = new JdbcTemplate( dataSource );
    }

    @Override
    public PaginatorResult<Product> fetchAllProductsPaginatorResult(int page, int resultEachPage, int maxNavigationPage) {
        String SQL_FETCH_PRODUCT_PAGINATOR = "select * from Products order by Name asc limit ?, ?";
        String SQL_COUNT_TOTAL_RECORD = "select count(*) from Products";
        int fromIndex = ( page - 1 ) * resultEachPage;
        try {
            List<Product> list = jdbcTemplate.query( SQL_FETCH_PRODUCT_PAGINATOR,
                    new Object[]{ fromIndex, resultEachPage }, new ProductMapper() );
            int totalRecord = jdbcTemplate.queryForObject( SQL_COUNT_TOTAL_RECORD, Integer.class );
            return new PaginatorResult<>( page, resultEachPage, maxNavigationPage, list, totalRecord ) ;
        } catch ( Exception ex ) {
//            Prepared
        }
        return null;
    }

    @Override
    public PaginatorResult<Product> findAllProductMatchNamePatternPaginatorResult(int page, int resultEachPage,
                                                                   int maxNavigationPage, String likeName) {
        String SQL_FETCH_PRODUCT_PAGINATOR_MATCH_NAME_PATTERN =
                "select * from Products where Name like ? order by Name asc limit ?, ?";
        String SQL_COUNT_TOTAL_RECORD = "select count(*) from Products where Name like ?";
        int fromIndex = ( page - 1 ) * resultEachPage;
        if ( likeName == null )
            return this.fetchAllProductsPaginatorResult( page, resultEachPage, maxNavigationPage );
        String namePattern = "%" + likeName + "%";
        try {
            int totalRecord = jdbcTemplate.queryForObject( SQL_COUNT_TOTAL_RECORD,
                    new Object[]{ namePattern }, Integer.class);
            if ( totalRecord == 0 )
                return null;
            List<Product> list = jdbcTemplate.query(
                    SQL_FETCH_PRODUCT_PAGINATOR_MATCH_NAME_PATTERN,
                    new Object[]{ namePattern, fromIndex, resultEachPage },
                    new ProductMapper() );
            return new PaginatorResult<>( page, resultEachPage, maxNavigationPage, list, totalRecord );
        } catch ( Exception ex ) {
//            Prepared
        }
        return null;
    }

    @Override
    public PaginatorResult<Product> fetchAllProductsCreatedByAccountPaginatorResult
            (int page, int resultEachPage, int maxNavigationPage, String createAccount) {
        String SQL_FETCH_PRODUCT_PAGINATOR =
                "select * " +
                "from Products " +
                "where Create_Account = ? order by Name asc limit ?, ?";
        String SQL_COUNT_TOTAL_RECORD =
                "select count(*) " +
                "from Products " +
                "where Create_Account = ?";
        int fromIndex = ( page - 1 ) * resultEachPage;
        try {
            List<Product> list = jdbcTemplate.query( SQL_FETCH_PRODUCT_PAGINATOR,
                    new Object[]{ createAccount, fromIndex, resultEachPage }, new ProductMapper() );
            int totalRecord = jdbcTemplate.queryForObject( SQL_COUNT_TOTAL_RECORD,
                    new Object[]{ createAccount }, Integer.class );
            return new PaginatorResult<>( page, resultEachPage, maxNavigationPage, list, totalRecord ) ;
        } catch ( Exception ex ) {
            System.out.println("Error when fetch product created by account : " + createAccount );
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> fetchAllProducts() {
        String SQL_FETCH_ALL_PRODUCT = "select * from Products order by Name asc";
        try {
            return jdbcTemplate.query( SQL_FETCH_ALL_PRODUCT, new ProductMapper() );
        } catch ( Exception ex ) {
//            Prepared
        }
        return null;
    }

    public Product fetchRandomProduct() {

        List<Product> list = this.fetchAllProducts();
        int numberProduct = list.size();
        try {
            return list.get( random.nextInt( numberProduct ) );
        } catch ( Exception ex ) {
            System.out.println("Error in fetchRandomProduct()");
        }
        return null;
    }

    public List<Product> listRandomProductDemo( int quantity ) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            for ( int i = 1; i <= quantity; i++ ) {
                list.add( this.fetchRandomProduct() );
            }
            return list;
        } catch ( Exception ex ) {
            System.out.println("Error in listRandomProductDemo");
        }
        return null;
    }

    @Override
    public List<Product> findAllProductMatchNamePattern(String likeName) {
        String SQL_FETCH_ALL_PRODUCT_MATCH_NAME = "select * " +
                                                  "from Products " +
                                                  "where Name like ? " +
                                                  "order by Name asc";
        if ( likeName == null )
            return this.fetchAllProducts();
        String namePattern = "%" + likeName + "%";
        try {
            return jdbcTemplate.query( SQL_FETCH_ALL_PRODUCT_MATCH_NAME,
                    new Object[]{ namePattern }, new ProductMapper() );
        } catch ( Exception ex ) {
//            Prepared
        }
        return null;
    }

    @Override
    public Product fetchProduct(String code) {
        String SQL_FETCH_PRODUCT = "select * from Products where Code = ?";
        try {
            Product product = jdbcTemplate.queryForObject( SQL_FETCH_PRODUCT,
                    new Object[]{ code }, new ProductMapper() );
            return product;
        } catch ( Exception ex ) {
//            Prepared
        }
        return null;
    }

    @Override
    public boolean saveProduct(Product productForm) {
        if ( productForm == null )
            return false;
        String code = productForm.getCode();
        Product product = null;
        boolean isNew = false;
        if( code != null )
            product = this.fetchProduct( code );
        if ( product != null )
            product = productForm;
        else {
            isNew = true;
            product = new Product();
            product.setCode( code );
            product.setCreatedDate( new Date() );
            product.setTimestamp( new Timestamp( System.currentTimeMillis() ) );
            product.setName( productForm.getName() );
            product.setPriceTag( productForm.getPriceTag() );
            product.setDescription( productForm.getDescription() );
            product.setUri( productForm.getUri() );
            product.setData( productForm.getData() );
            product.setCreatedAccount( productForm.getCreatedAccount() );
        }
        try {
            if ( isNew ) {
                String SQL_INSERT_NEW_PRODUCT =
                        "insert into Products( Code, Create_Date, Image, Name, Price, Description, URI, Create_Account ) " +
                        "values ( ?, ?, ?, ?, ?, ?, ?, ? )";
                jdbcTemplate.update( SQL_INSERT_NEW_PRODUCT, product.getCode(), new Date(),
                        product.getData(), product.getName(), product.getPriceTag(),
                        product.getDescription(), product.getUri(), product.getCreatedAccount() );
                System.out.println( "Save product : " + product +" successfully ! " );
            } else {
                String SQL_UPDATE_PRODUCT =
                        "update Products " +
                        "set Create_Date = ?, Image = ?, Name = ?, Price = ?, Description = ?, URI = ? " +
                        "where Code = ?";
                jdbcTemplate.update( SQL_UPDATE_PRODUCT, new Date(), product.getData(), product.getName(),
                        product.getPriceTag(), product.getDescription(), product.getUri(), code);
                System.out.println( "Update product : " + product +" successfully ! " );
            }
        } catch ( Exception ex ) {
            System.out.println( "Error when insert or update product");
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteProduct(Product product) {
        return false;
    }
}
