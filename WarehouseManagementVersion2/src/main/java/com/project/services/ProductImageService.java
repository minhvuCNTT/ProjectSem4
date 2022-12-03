package com.project.services;

import com.project.models.ProductImage;

public interface ProductImageService  {
	public Iterable<ProductImage> saveAll(Iterable<ProductImage> images);
	
	public void delete(int id);
	
	public ProductImage find(int id);
	
	public ProductImage save(ProductImage productImage);
}
