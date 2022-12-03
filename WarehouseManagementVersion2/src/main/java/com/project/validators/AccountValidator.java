package com.project.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.models.Account;
import com.project.services.AccountService;

@Component("accountValidator")
public class AccountValidator implements Validator{

	@Autowired
	private AccountService accountService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// check the object need to be validated is the right object
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// custom validation
		Account account = (Account) target;
		if (accountService.checkUsernameExist(account.getUsername())) {
			errors.rejectValue("username", "account.username.exists");
		}
	}
}