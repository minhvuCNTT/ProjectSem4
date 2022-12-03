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
import com.project.models.Customer;
import com.project.models.InvoiceExport;
import com.project.models.InvoiceExportDetails;
import com.project.models.Product;
import com.project.models.Supplier;
import com.project.repositories.AccountRepository;
import com.project.repositories.CustomerRepository;
import com.project.repositories.InvoiceExportDetailsRepository;
import com.project.repositories.InvoiceExportRepository;
import com.project.repositories.ProductRepository;
import com.project.repositories.SupplierRepository;
import com.project.services.AccountService;

@Service
@Transactional
public class InvoiceExportServiceImplement implements InvoiceExportService{

	@Autowired
	private InvoiceExportRepository exportRepository;

	@Autowired
	private InvoiceExportDetailsRepository invoiceExportDetailsRepository;
	
	@Override
	public Iterable<InvoiceExport> findAll() {
		// TODO Auto-generated method stub
		return exportRepository.findAll();
	}

	@Override
	public InvoiceExport findById(int id) {
		// TODO Auto-generated method stub
		return exportRepository.findById(id).get();
	}
	
	@Override
	public InvoiceExport save(InvoiceExport invoiceExport) {
		// TODO Auto-generated method stub
		return exportRepository.save(invoiceExport);
	}

	@Override
	public List<InvoiceExport> findByAccountId(int id) {
		// TODO Auto-generated method stub
		return exportRepository.findByAccountId(id);
	}

	@Override
	public List<InvoiceExport> findAllByProductId(int id) {
		List<InvoiceExportDetails> invoiceExportDetailses = invoiceExportDetailsRepository.findAllByProductId(id);
		List<InvoiceExport> exports = new ArrayList<InvoiceExport>();
		for (InvoiceExportDetails details : invoiceExportDetailses) {
			exports.add(details.getInvoiceExport());
		}
		return exports;
	}
	
	@Override
	public List<InvoiceExport> findAllDesc() {
		// TODO Auto-generated method stub
		return exportRepository.findAllDesc();
	}

	@Override
	public List<InvoiceExport> findAllByCustomerIdAdmin(int id) {
		List<InvoiceExportDetails> invoiceExportDetailses = invoiceExportDetailsRepository.findAllByCustomerIdAdmin(id);
		List<InvoiceExport> exports = new ArrayList<InvoiceExport>();
		for (InvoiceExportDetails details : invoiceExportDetailses) {
			exports.add(details.getInvoiceExport());
		}
		return exports;
	}
	
	@Override
	public List<InvoiceExport> findAllByCustomerIdEmployee(int id, int empId) {
		List<InvoiceExportDetails> invoiceExportDetailses = invoiceExportDetailsRepository.findAllByCustomerIdEmployee(id, empId);
		List<InvoiceExport> exports = new ArrayList<InvoiceExport>();
		for (InvoiceExportDetails details : invoiceExportDetailses) {
			exports.add(details.getInvoiceExport());
		}
		return exports;
	}
}
