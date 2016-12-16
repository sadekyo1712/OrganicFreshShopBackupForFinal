package com.OrganicFreshShop.validator;

import com.OrganicFreshShop.model.Customer;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by root on 11/23/16.
 */

@Component
public class CustomerValidator implements Validator {

    private EmailValidator emailValidator = EmailValidator.getInstance() ;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass == Customer.class ;
    }

    @Override
    public void validate(Object target, Errors errors) {

        Customer customer = ( Customer )target;
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "name", "NotEmpty.customerForm.name" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "email", "NotEmpty.customerForm.email" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "address", "NotEmpty.customerForm.address" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "phone", "NotEmpty.customerForm.phone" );

        if ( !emailValidator.isValid( customer.getEmail() ) )
            errors.rejectValue( "email", "Pattern.customerForm.email" );
    }
}
