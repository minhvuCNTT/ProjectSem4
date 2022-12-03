package com.project.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Account;
import com.project.models.Customer;
import com.project.models.Supplier;


@Component("customerValidator")
public class CustomerValidator implements Validator{

	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Customer.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// custom validation
		
	}
}
