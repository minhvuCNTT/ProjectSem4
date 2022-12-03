package com.project.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Supplier;


@Component("supplierValidatorEdit")
public class SupplierValidatorEdit implements Validator{

	
	
	@Override
	public boolean supports(Class<?> clazz) {
		// check the object need to be validated is the right object
		return Supplier.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
	}
}