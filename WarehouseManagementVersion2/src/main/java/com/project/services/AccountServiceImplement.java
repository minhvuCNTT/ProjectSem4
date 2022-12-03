package com.project.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.models.Account;
import com.project.repositories.AccountRepository;

@Service
@Transactional
public class AccountServiceImplement implements AccountService {

	@Autowired
	private HttpSession session;

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Account account = accountRepository.findActiveUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("Username not found");
		} else {
			List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
			grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole()));
			session.setAttribute("account", account);
			return new User(account.getUsername(), account.getPassword(), grantedAuthorities);
		}
	}

	@Override
	public Account save(Account account) {
		// TODO Auto-generated method stub
		return accountRepository.save(account);
	}

	@Override
	public boolean checkUsernameExist(String username) {
		return accountRepository.countAccountByUsername(username) > 0;
	}

	@Override
	public List<Account> findAllEmployee() {
		// TODO Auto-generated method stub
		return accountRepository.findAllEmployee();
	}

	@Override
	public List<Account> searchByName(String name) {
		// TODO Auto-generated method stub
		name = "%" + name + "%";
		return accountRepository.searchByName(name);
	}

	@Override
	public void disable(int id) {
		// TODO Auto-generated method stub
		accountRepository.disable(id);

	}

	@Override
	public void enable(int id) {
		// TODO Auto-generated method stub
		accountRepository.enable(id);

	}

	@Override
	public Account findById(int id) {
		return accountRepository.findById(id).get();

	}
	
	@Override
	public void updatePassword(int id, String password) {
		// TODO Auto-generated method stub
		accountRepository.updatePassword(id, password);
	}
}
