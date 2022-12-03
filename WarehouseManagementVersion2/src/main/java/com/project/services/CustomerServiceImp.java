package com.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Customer;
import com.project.repositories.CustomerRepository;

@Service
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Iterable<Customer> getAllCustomer() {

		return customerRepository.findAll();
	}

	@Override
	public Customer save(Customer customer) {
		return customerRepository.save(customer);
	}

	@Override
	public Iterable<Customer> findAll() {

		return customerRepository.findAll();
	}
	@Override
	public Customer findById(int id) {
		// TODO Auto-generated method stub
		return customerRepository.findById(id).get();
	}

	@Override
	public void deletebyId(int id) {
		customerRepository.deleteById(id);
	}

	@Override
	public List<Customer> searchByName(String name) {
		name = "%" + name + "%";
		return customerRepository.searchByName(name);
	}
}
