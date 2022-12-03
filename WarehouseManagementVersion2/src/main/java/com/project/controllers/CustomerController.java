package com.project.controllers;

import java.lang.reflect.Method;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.models.Account;
import com.project.models.Customer;
import com.project.models.Product;
import com.project.services.CustomerService;
import com.project.services.InvoiceExportService;
import com.project.validators.CustomerValidator;
import com.project.validators.CustomerValidatorEdit;


@Controller
@RequestMapping(value = {"customer"})
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private InvoiceExportService invoiceExportService;
	private ServletContext servletContext;
	
	@Autowired
	private CustomerValidatorEdit customerValidatorEdit;
	
	@Autowired
	public CustomerValidator customerValidator;
	
	@RequestMapping(value = {"index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("customers", customerService.getAllCustomer() );
		
		return "customer/index";
	}
	
	@RequestMapping(value = {"add"}, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("customer", new Customer());
		return "customer/add";
	}
	
	@RequestMapping(value = {"details/{id}"}, method = RequestMethod.GET)
	public String details(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		if (account.getRole().equals("ROLE_ADMIN")) {
			modelMap.put("invoices", invoiceExportService.findAllByCustomerIdAdmin(id));
		}
		if (account.getRole().equals("ROLE_EMPLOYEE")) {
			modelMap.put("invoices", invoiceExportService.findAllByCustomerIdEmployee(id, account.getId()));
		}
		
		return "customer/details";
	}
	
	@RequestMapping(value = {"save"}, method = RequestMethod.POST)
	public String save(@ModelAttribute("customer") @Valid Customer customer, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "customer/add";
		}
		customerService.save(customer);
		return "redirect:/customer/index";
	}

	@RequestMapping(value = { "searchByName" }, method = RequestMethod.GET)
	public String searchByName(@RequestParam("name") String name, ModelMap modelMap) {
		modelMap.put("customers", customerService.searchByName(name));
		return "customer/index";
	}
	
	@RequestMapping(value = {"delete/{id}"}, method = RequestMethod.GET)
	public String delete(@PathVariable("id")int id, ModelMap modelMap) {
		try {
			customerService.deletebyId(id);
		} catch (Exception e) {
			modelMap.put("msg","Can't delete this category");
		}
		return "redirect:/customer/index";
	}
	
	@RequestMapping(value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable(value = "id", required = false) Integer id, Model model, ModelMap modelMap,
			HttpSession session) {
		if (id == null) {
			return "customer/notfound";
		}
		Customer customer = customerService.findById(id);
		if (customer == null ) {
			return "customer/notfound";
		}
		modelMap.put("customer", customer);
		return "customer/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("customer") @Valid Customer customer, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			customerValidatorEdit.validate(customer, bindingResult);
			if (bindingResult.hasErrors()) {
				return "customer/edit";
			}
			Customer curentCustomer = customerService.findById(customer.getId());
			customerService.save(customer);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/customer/index";
	}
}
