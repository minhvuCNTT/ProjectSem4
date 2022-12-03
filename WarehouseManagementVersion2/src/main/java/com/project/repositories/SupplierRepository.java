package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.project.models.Supplier;

@Repository
public interface SupplierRepository extends CrudRepository<Supplier, Integer> {
	@Query("from Supplier where name like :name")
	public List<Supplier> searchByName(@Param("name") String name);
	
}
