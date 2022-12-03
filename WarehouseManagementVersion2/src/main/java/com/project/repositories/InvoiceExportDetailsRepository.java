package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.Account;
import com.project.models.InvoiceExportDetails;
import com.project.models.InvoiceImport;
import com.project.models.InvoiceImportDetails;
import com.project.models.Product;
@Repository
public interface InvoiceExportDetailsRepository extends CrudRepository<InvoiceExportDetails, Integer>{

	@Query("from InvoiceExportDetails where product.id = :id")
	public List<InvoiceExportDetails> findAllByProductId(@Param("id") int id);
	

	@Query("from InvoiceExportDetails where invoiceExport.customer.id = :id")
	public List<InvoiceExportDetails> findAllByCustomerIdAdmin(@Param("id") int id);
	
	
	@Query("from InvoiceExportDetails where invoiceExport.customer.id = :id and invoiceExport.account.id = :empId")
	public List<InvoiceExportDetails> findAllByCustomerIdEmployee(@Param("id") int id, @Param("empId") int empId);
	 
}
