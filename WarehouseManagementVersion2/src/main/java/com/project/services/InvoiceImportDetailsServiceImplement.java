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
import com.project.models.InvoiceImportDetails;
import com.project.models.Product;
import com.project.models.Supplier;
import com.project.repositories.AccountRepository;
import com.project.repositories.InvoiceImportDetailsRepository;
import com.project.repositories.ProductRepository;
import com.project.repositories.SupplierRepository;
import com.project.services.AccountService;

@Service
@Transactional
public class InvoiceImportDetailsServiceImplement implements InvoiceImportDetailsService{

	@Autowired
	private InvoiceImportDetailsRepository invoiceImportDetailsRepository;

	@Override
	public InvoiceImportDetails save(InvoiceImportDetails invoiceImportDetails) {
		// TODO Auto-generated method stub
		return invoiceImportDetailsRepository.save(invoiceImportDetails);
	}

	
	
	
}
