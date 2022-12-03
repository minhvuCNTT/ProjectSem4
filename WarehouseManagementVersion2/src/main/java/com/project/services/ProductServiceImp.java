package com.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.models.Product;
import com.project.repositories.ProductRepository;

@Transactional
@Service
public class ProductServiceImp implements ProductService {
	@Autowired
	private ProductRepository productRepository;

	@Override
	public Iterable<Product> getAllProduct() {
		return productRepository.findAll();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product) ;
	}
	@Override
	public Iterable<Product> findAll() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}

	@Override
	public Product findById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public void updateQuantityImport(int id, int quantity) {
		// TODO Auto-generated method stub
		productRepository.updateQuantityImport(id, quantity);
		
	}
	
	@Override
	public void updateQuantityExport(int id, int quantity) {
		// TODO Auto-generated method stub
		productRepository.updateQuantityExport(id, quantity);
		
	}
	
	public List<Product> findByQuantityGreaterThan0(){
		return productRepository.findByQuantityGreaterThan0();
	}

	@Override
	public void deletebyId(int id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<Product> searchByName(String name) {
		name = "%" + name + "%";
		return productRepository.searchByName(name);
	}
}
