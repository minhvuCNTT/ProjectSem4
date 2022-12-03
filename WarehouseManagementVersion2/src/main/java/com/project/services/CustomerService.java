package com.project.services;

import java.util.List;

import com.project.models.Customer;

public interface CustomerService {
	public Iterable<Customer> getAllCustomer();
	public Customer save(Customer customer);
	public Iterable<Customer> findAll();
	public Customer findById(int id);
	public void deletebyId(int id);
	public List<Customer> searchByName(String name);
}
