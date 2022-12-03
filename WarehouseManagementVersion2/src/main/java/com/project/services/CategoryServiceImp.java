package com.project.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Account;
import com.project.models.Category;
import com.project.repositories.CategoryRepository;

@Service
public class CategoryServiceImp implements CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Iterable<Category> getAllCategory() {
		return categoryRepository.findAll();
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public Category findbyId(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public void deletebyId(int id) {
		categoryRepository.deleteById(id);
	}

	@Override
	public List<Category> searchByName(String name) {
		// TODO Auto-generated method stub
		name = "%" + name + "%";
		return categoryRepository.searchByName(name);
	}

}
