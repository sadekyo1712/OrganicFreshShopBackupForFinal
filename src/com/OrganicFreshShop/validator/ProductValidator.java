package com.OrganicFreshShop.validator;

import com.OrganicFreshShop.daoImplements.ProductDAOImplement;
import com.OrganicFreshShop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by root on 11/23/16.
 */
@Component
public class ProductValidator implements Validator {

    @Autowired
    public ProductDAOImplement productDAOImplement;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass == Product.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = ( Product )target;
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "code", "NotEmpty.productForm.code" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "name", "NotEmpty.productForm.name" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "priceTag", "NotEmpty.productForm.price" );
        String code = product.getCode();
        if ( ( code != null ) && ( code.length() > 0 ) ) {
            if ( code.matches( "\\s+" ) ) {
                errors.rejectValue( "code", "Pattern.productForm.code" );
            } else {
                Product productFetchFromDatabase = productDAOImplement.fetchProduct( code );
                if ( productFetchFromDatabase != null )
                    errors.rejectValue( "code", "Duplicate.productForm.code" );
            }
        }
    }
}
