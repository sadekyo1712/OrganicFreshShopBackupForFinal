package com.OrganicFreshShop.daoImplements;

import com.OrganicFreshShop.dao.ProductDAO;
import com.OrganicFreshShop.mapper.ProductMapper;
import com.OrganicFreshShop.mapper.ProductsAdditionDetailMapper;
import com.OrganicFreshShop.model.PaginatorResult;
import com.OrganicFreshShop.model.Product;
import com.OrganicFreshShop.model.ProductInfo;
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
    public PaginatorResult<Product> fetchAllProductsWithConstraintPaginatorResult(int page, int resultEachPage,
                                                                                  int maxNavigationPage, String category,
                                                                                  String[] type, String[] source,
                                                                                  int discount, String likename ) {

        if ( category == null && type == null && source == null && discount > 100 ) {
            return this.findAllProductMatchNamePatternPaginatorResult( page, resultEachPage,
                    maxNavigationPage, likename );
        }
        String SQL_FETCH_PRODUCT_WITH_CONSTRAINT =
                "select Products.Code, Create_Date, Image, Name, Price, Description, URI, Create_Account " +
                "from Products inner join Products_Addition_Detail on Products.Code = Products_Addition_Detail.Code where";
        String SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT =
                "select Products_Addition_Detail.Code, Category, Type, Source, Discount, Comment, Rate " +
                "from Products inner join Products_Addition_Detail on Products.Code = Products_Addition_Detail.Code where";
        String SQL_COUNT_TOTAL_RECORD =
                "select count(*) " +
                "from Products inner join Products_Addition_Detail on Products.Code = Products_Addition_Detail.Code where";
        String category_constraint = "";
        String type_constraint = "";
        String source_constraint = "";
        String discount_constraint = "";
        if ( discount <= 100 ) {
            discount_constraint = " Discount>=" + discount;
        }
        if ( category != null ) {
            category_constraint = " Category=" + "'" + category + "'";
        }
        if ( type != null && type.length > 0 ) {
            for ( int i = 0; i < type.length; i++ ) {
                if ( i == 0 )
                    type_constraint = " Type=" + "'" + type[i] + "'";
                else
                    type_constraint = type_constraint + " or Type=" + "'" + type[i] + "'";
            }
        }
        if ( source != null && source.length > 0 ) {
            for ( int i = 0; i < source.length; i ++ ) {
                if ( i == 0 )
                    source_constraint = " Source=" + "'" + source[i] + "'";
                else
                    source_constraint = source_constraint + " or Source=" + "'" + source[i] + "'";
            }
        }
        if ( !category_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " (" + category_constraint + " )";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " (" + category_constraint + " )";
            SQL_COUNT_TOTAL_RECORD += " (" + category_constraint + " )";
        }
        if ( !category_constraint.equals("") && !type_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " and ";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " and ";
            SQL_COUNT_TOTAL_RECORD += " and ";
        }
        if ( !type_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " (" + type_constraint + " )";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " (" + type_constraint + " )";
            SQL_COUNT_TOTAL_RECORD += " (" + type_constraint + " )";
        }
        if ( ( !type_constraint.equals("") || !category_constraint.equals("") ) && !source_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " and ";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " and ";
            SQL_COUNT_TOTAL_RECORD += " and ";
        }
        if ( !source_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " (" + source_constraint + " )";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " (" + source_constraint + " )";
            SQL_COUNT_TOTAL_RECORD += " (" + source_constraint + " )";
        }
        if ( ( !type_constraint.equals("") || !category_constraint.equals("") || !source_constraint.equals("") )
                && !discount_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " and ";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " and ";
            SQL_COUNT_TOTAL_RECORD += " and ";
        }
        if ( !discount_constraint.equals("") ) {
            SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " (" + discount_constraint + " )";
            SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " (" + discount_constraint + " )";
            SQL_COUNT_TOTAL_RECORD += " (" + discount_constraint + " )";
        }
        SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT += " limit ?, ?";
        SQL_FETCH_PRODUCT_WITH_CONSTRAINT += " limit ?, ?";

        int fromIndex = ( page - 1 ) * resultEachPage;
        try {
            List<Product> list = jdbcTemplate.query( SQL_FETCH_PRODUCT_WITH_CONSTRAINT,
                    new Object[]{ fromIndex, resultEachPage }, new ProductMapper() );
            List<ProductInfo> listProductInfo = jdbcTemplate.query( SQL_FETCH_PRODUCT_INFO_WITH_CONSTRAINT,
                    new Object[]{ fromIndex, resultEachPage }, new ProductsAdditionDetailMapper());
            int totalRecord = jdbcTemplate.queryForObject( SQL_COUNT_TOTAL_RECORD, Integer.class );
            for ( int i = 0; i < list.size(); i++ ) {
                Product product = list.get(i);
                product.setProductInfo( listProductInfo.get(i) );
                list.set( i, product );
            }
            return new PaginatorResult<>( page, resultEachPage, maxNavigationPage, list, totalRecord ) ;
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
        String SQL_FETCH_PRODUCT_INFO = "select * from Products_Addition_Detail where Code = ?";
        try {
            Product product = jdbcTemplate.queryForObject( SQL_FETCH_PRODUCT,
                    new Object[]{ code }, new ProductMapper() );
            ProductInfo productInfo = jdbcTemplate.queryForObject( SQL_FETCH_PRODUCT_INFO,
                    new Object[]{ code }, new ProductsAdditionDetailMapper() );
            product.setProductInfo( productInfo );
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
        ProductInfo productInfo;
        Product product = null;
        boolean isNew = false;
        if( code != null )
            product = this.fetchProduct( code );
        if ( product != null ) {
            product = productForm;
            productInfo = product.getProductInfo();
        }
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
            productInfo = productForm.getProductInfo();
        }
        try {
            if ( isNew ) {
                String SQL_INSERT_NEW_PRODUCT =
                        "insert into Products( Code, Create_Date, Image, Name, Price, Description, URI, Create_Account ) " +
                        "values ( ?, ?, ?, ?, ?, ?, ?, ? )";
                String SQL_INSERT_PRODUCT_INFO =
                        "insert into Products_Addition_Detail( Code, Category, Type, Source, Discount, Comment, Rate ) " +
                        "values ( ?, ?, ?, ?, ?, ?, ? )";
                jdbcTemplate.update( SQL_INSERT_NEW_PRODUCT, product.getCode(), new Date(),
                        product.getData(), product.getName(), product.getPriceTag(),
                        product.getDescription(), product.getUri(), product.getCreatedAccount() );
                jdbcTemplate.update( SQL_INSERT_PRODUCT_INFO, product.getCode(), productInfo.getCategory(),
                        productInfo.getType(), productInfo.getSource(), productInfo.getDiscount(),
                        productInfo.getSeqcComment(), productInfo.getRate()  );
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
    public void saveProductInfo( ProductInfo productInfo ) {

        String SQL_UPDATE_PRODUCT_INFO =
                "update Products_Addition_Detail " +
                "set Category = ?, Type = ?, Source = ?, Discount = ?, Comment = ?, Rate = ? " +
                "where Code = ?";
        try {
            jdbcTemplate.update( SQL_UPDATE_PRODUCT_INFO, productInfo.getCategory(), productInfo.getType(),
                    productInfo.getSource(), productInfo.getDiscount(), productInfo.getSeqcComment(),
                    productInfo.getRate(), productInfo.getCode() );
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
    }

    @Override
    public boolean deleteProduct(Product product) {
        return false;
    }
}
