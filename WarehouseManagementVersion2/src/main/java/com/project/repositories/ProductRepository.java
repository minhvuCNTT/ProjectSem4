package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {
	@Modifying
	@Query(value = "update Product p set p.quantity = p.quantity + :quantity where p.id = :id")
	public void updateQuantityImport(@Param("id") int id, @Param("quantity") int quantity);
	
	
	@Modifying
	@Query(value = "update Product p set p.quantity = p.quantity - :quantity where p.id = :id")
	public void updateQuantityExport(@Param("id") int id, @Param("quantity") int quantity);
	
	@Query("from Product where quantity > 0")
	public List<Product> findByQuantityGreaterThan0();
	
	@Query("from Product where name like :name")
	public List<Product> searchByName(@Param("name") String name);
	
}
