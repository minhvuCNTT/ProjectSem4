package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.InvoiceImport;
@Repository
public interface InvoiceImportRepository extends CrudRepository<InvoiceImport, Integer>{
	@Query("from InvoiceImport where account.id = :id order by id desc")
	public List<InvoiceImport> findByAccountId(@Param("id") int id);
	
	@Query("from InvoiceImport order by id desc")
	public List<InvoiceImport> findAllDesc();
}
