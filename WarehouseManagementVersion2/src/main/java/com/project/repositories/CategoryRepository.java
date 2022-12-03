package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.models.Account;
import com.project.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer> {
	

	@Query("from Category where name like :name")
	public List<Category> searchByName(@Param("name") String name);
	
}
