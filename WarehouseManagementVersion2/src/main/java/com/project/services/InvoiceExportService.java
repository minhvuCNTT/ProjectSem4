package com.project.services;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.project.models.Account;
import com.project.models.InvoiceExport;
import com.project.models.InvoiceImport;
import com.project.models.Product;
import com.project.models.Supplier;

public interface InvoiceExportService {

	public Iterable<InvoiceExport> findAll();
	public InvoiceExport findById(int id);
	public InvoiceExport save(InvoiceExport invoiceExport);
	public List<InvoiceExport> findByAccountId(int id);
	public List<InvoiceExport> findAllByProductId(int id);
	public List<InvoiceExport> findAllDesc();
	public List<InvoiceExport> findAllByCustomerIdAdmin(int id);
	public List<InvoiceExport> findAllByCustomerIdEmployee(int id, int empId);
}
