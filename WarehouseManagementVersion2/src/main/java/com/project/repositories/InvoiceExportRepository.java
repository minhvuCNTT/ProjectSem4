package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.Account;
import com.project.models.InvoiceExport;
import com.project.models.InvoiceImport;
import com.project.models.Product;
@Repository
public interface InvoiceExportRepository extends CrudRepository<InvoiceExport, Integer>{
	@Query("from InvoiceExport where account.id = :id order by id desc")
	public List<InvoiceExport> findByAccountId(@Param("id") int id);
	
	@Query("from InvoiceExport order by id desc")
	public List<InvoiceExport> findAllDesc();
	
}
