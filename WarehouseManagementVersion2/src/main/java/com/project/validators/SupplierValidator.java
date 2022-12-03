package com.project.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Supplier;


@Component("supplierValidator")
public class SupplierValidator implements Validator{

	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Supplier.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// custom validation
		
	}
}
