package com.project.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Product;
import com.project.services.ProductService;

@Component("productValidator")
public class ProductValidator implements Validator{

	@Autowired
	private ProductService productService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// check the object need to be validated is the right object
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// custom validation
	}
}