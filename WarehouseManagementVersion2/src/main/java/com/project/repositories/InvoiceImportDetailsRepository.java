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
public interface InvoiceImportDetailsRepository extends CrudRepository<InvoiceImportDetails, Integer>{
	@Query("from InvoiceImportDetails where product.id = :id")
	public List<InvoiceImportDetails> findAllByProductId(@Param("id") int id);
	
	@Query("from InvoiceImportDetails where invoiceImport.supplier.id = :id")
	public List<InvoiceImportDetails> findAllBySuplierIdAdmin(@Param("id") int id);
	
	@Query("from InvoiceImportDetails where invoiceImport.supplier.id = :id and invoiceImport.account.id = :empId")
	public List<InvoiceImportDetails> findAllBySuplierIdEmployee(@Param("id") int id, @Param("empId") int empId);
	
}
