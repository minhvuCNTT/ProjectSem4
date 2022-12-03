package com.project.services;

import java.util.List;

import com.project.models.Account;
import com.project.models.Category;

public interface CategoryService {
	
	public Iterable<Category> getAllCategory();
	public Category save(Category category);
	public Category findbyId(int id);
	public void deletebyId(int id);
	public List<Category> searchByName(String name);
}
