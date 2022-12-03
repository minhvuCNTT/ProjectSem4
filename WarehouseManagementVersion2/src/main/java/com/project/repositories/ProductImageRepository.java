package com.project.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.models.ProductImage;

@Repository
public interface ProductImageRepository extends CrudRepository<ProductImage, Integer> {

}
