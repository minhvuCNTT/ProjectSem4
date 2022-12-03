package com.project.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.InvoiceImport;
import com.project.models.InvoiceImportDetails;
import com.project.repositories.InvoiceImportDetailsRepository;
import com.project.repositories.InvoiceImportRepository;

@Service
@Transactional
public class InvoiceImportIml implements InvoiceImportsService {
	@Autowired
	private InvoiceImportDetailsRepository invoiceImportDetailsRepository;
	
	@Autowired
	private InvoiceImportRepository importRepository;

	

	@Override
	public List<InvoiceImport> findAllBySuplierIdAdmin(int id) {
		List<InvoiceImportDetails> invoiceImportDetailses = invoiceImportDetailsRepository.findAllBySuplierIdAdmin(id);
		List<InvoiceImport> imports = new ArrayList<InvoiceImport>();
		for (InvoiceImportDetails details : invoiceImportDetailses) {
			imports.add(details.getInvoiceImport());
		}
		return imports;
	}

	@Override
	public Iterable<InvoiceImport> findAll() {
		return importRepository.findAll();
	}

	@Override
	public InvoiceImport findById(int id) {
		return importRepository.findById(id).get();
	}

	@Override
	public InvoiceImport save(InvoiceImport invoiceImport) {
		return importRepository.save(invoiceImport);
	}

	@Override
	public List<InvoiceImport> findByAccountId(int id) {
		return importRepository.findByAccountId(id);
	}

	@Override
	public List<InvoiceImport> findAllByProductId(int id) {
		List<InvoiceImportDetails> invoiceImportDetailses = invoiceImportDetailsRepository.findAllByProductId(id);
		List<InvoiceImport> imports = new ArrayList<InvoiceImport>();
		for (InvoiceImportDetails details : invoiceImportDetailses) {
			imports.add(details.getInvoiceImport());
		}
		return imports;
	}

	@Override
	public List<InvoiceImport> findAllDesc() {
		return importRepository.findAllDesc();
	}

	@Override
	public List<InvoiceImport> findAllBySuplierIdEmployee(int id, int empId) {
		List<InvoiceImportDetails> invoiceImportDetailses = invoiceImportDetailsRepository.findAllBySuplierIdEmployee(id, empId);
		List<InvoiceImport> imports = new ArrayList<InvoiceImport>();
		for (InvoiceImportDetails details : invoiceImportDetailses) {
			imports.add(details.getInvoiceImport());
		}
		return imports;
	}

}
