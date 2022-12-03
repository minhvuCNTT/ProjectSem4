package com.project.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.project.models.Account;

public interface AccountService extends UserDetailsService{
	
public Account save(Account account);
	
	public boolean checkUsernameExist(String username);
	
	public List<Account> findAllEmployee();
	
	public List<Account> searchByName(String name);
	
	public void disable(int id);
	
	public void enable(int id);
	
	public Account findById(int id);
	
	public void updatePassword(int id, String password);
}
