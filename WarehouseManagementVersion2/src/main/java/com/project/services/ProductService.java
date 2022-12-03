package com.project.services;

import java.util.List;

import com.project.models.Category;
import com.project.models.Product;

public interface ProductService {
	public Iterable<Product> getAllProduct();
	
	public Product save(Product product);
	public Iterable<Product> findAll();
	
	public Product findById(int id);
	
	public void updateQuantityImport(int id, int quantity);
	public void updateQuantityExport(int id, int quantity);
	
	public List<Product> findByQuantityGreaterThan0();
	public void deletebyId(int id);
	public List<Product> searchByName(String name);
}
