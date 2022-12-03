package com.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.models.Product;
import com.project.models.ProductImage;
import com.project.repositories.ProductImageRepository;
import com.project.repositories.ProductRepository;

@Transactional
@Service
public class ProductImageServiceImp implements ProductImageService {
	@Autowired
	private ProductImageRepository productImageRepository;

	@Override
	public Iterable<ProductImage> saveAll(Iterable<ProductImage> images){

		return productImageRepository.saveAll(images);
	}

	@Override
	public void delete(int id) {
		productImageRepository.deleteById(id);
	}

	@Override
	public ProductImage find(int id) {
		return productImageRepository.findById(id).get();
	}

	@Override
	public ProductImage save(ProductImage productImage) {
		return productImageRepository.save(productImage);
	}


}
