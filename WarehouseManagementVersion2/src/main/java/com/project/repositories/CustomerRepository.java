package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
	@Query("from Customer where name like :name")
	public List<Customer> searchByName(@Param("name") String name);
	
}
