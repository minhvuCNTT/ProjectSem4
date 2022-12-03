package com.project.services;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.project.models.Account;
import com.project.models.InvoiceExportDetails;
import com.project.models.InvoiceImport;
import com.project.models.InvoiceImportDetails;
import com.project.models.Product;
import com.project.models.Supplier;

public interface InvoiceExportDetailsService {
	public InvoiceExportDetails save(InvoiceExportDetails invoiceExportDetails);

}
