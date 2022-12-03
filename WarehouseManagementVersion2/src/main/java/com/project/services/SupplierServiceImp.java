package com.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Supplier;
import com.project.repositories.SupplierRepository;

@Service
public class SupplierServiceImp implements SupplierService {
	@Autowired
	private SupplierRepository supplierRepository;

	@Override
	public Iterable<Supplier> getAllSupplier() {
		return supplierRepository.findAll();
	}

	@Override
	public Supplier save(Supplier supplier) {
		return supplierRepository.save(supplier);
	}
	
	@Override
	public Iterable<Supplier> findAll() {
		return supplierRepository.findAll();
	}
	@Override
	public Supplier findById(int id) {
		// TODO Auto-generated method stub
		return supplierRepository.findById(id).get();
	}

	@Override
	public void deletebyId(int id) {
		supplierRepository.deleteById(id);
	}

	@Override
	public List<Supplier> searchByName(String name) {
		name = "%" + name + "%";
		return supplierRepository.searchByName(name);
	}

}
