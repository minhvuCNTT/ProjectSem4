package com.project.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Customer;


@Component("customerValidatorEdit")
public class CustomerValidatorEdit implements Validator{

	
	
	@Override
	public boolean supports(Class<?> clazz) {
		// check the object need to be validated is the right object
		return Customer.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
	}
}