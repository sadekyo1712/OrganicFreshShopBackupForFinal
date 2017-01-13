package com.OrganicFreshShop.dao;

import com.OrganicFreshShop.model.PaginatorResult;
import com.OrganicFreshShop.model.Product;
import com.OrganicFreshShop.model.ProductInfo;

import java.util.List;

/**
 * Created by root on 11/22/16.
 */
public interface ProductDAO {

    public Product fetchProduct( String code );
    public PaginatorResult<Product> fetchAllProductsPaginatorResult( int page, int resultEachPage,
                                                      int maxNavigationPage );
    public PaginatorResult<Product> findAllProductMatchNamePatternPaginatorResult( int page, int resultEachPage,
                                                                    int maxNavigationPage, String likeName);
    public PaginatorResult<Product> fetchAllProductsCreatedByAccountPaginatorResult
            ( int page, int resultEachPage, int maxNavigationPage, String createAccount );
    public PaginatorResult<Product> fetchAllProductsWithConstraintPaginatorResult
            ( int page, int resultEachPage, int maxNavigationPage,
              String category, String[] type, String[] source, int discount, String likeName);
    public void saveProductInfo( ProductInfo productInfo );
    public List<Product> fetchAllProducts();
    public List<Product>  findAllProductMatchNamePattern( String likeName );
    public boolean saveProduct( Product product );
    public boolean deleteProduct( Product product );
}
