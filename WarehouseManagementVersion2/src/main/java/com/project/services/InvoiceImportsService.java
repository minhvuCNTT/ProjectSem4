package com.project.services;

import java.util.List;

import com.project.models.InvoiceImport;

public interface InvoiceImportsService {
	public List<InvoiceImport> findAllBySuplierIdAdmin(int id);
	public List<InvoiceImport> findAllBySuplierIdEmployee(int id, int empId);
	public Iterable<InvoiceImport> findAll();
	public InvoiceImport findById(int id);
	public InvoiceImport save(InvoiceImport invoiceImport);
	public List<InvoiceImport> findByAccountId(int id);
	public List<InvoiceImport> findAllByProductId(int id);
	public List<InvoiceImport> findAllDesc();
}
