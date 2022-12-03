package com.project.services;

import java.util.List;

import com.project.models.Customer;
import com.project.models.Supplier;

public interface SupplierService {
	public Iterable<Supplier> getAllSupplier();
	public Supplier save(Supplier supplier);
	public Iterable<Supplier> findAll();
	public Supplier findById(int id);
	public void deletebyId(int id);
	public List<Supplier> searchByName(String name);
}
