package com.project.controllers;

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
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.project.helpers.UploadHelper;
import com.project.models.Account;
import com.project.models.Supplier;
import com.project.services.InvoiceImportsService;
import com.project.services.SupplierService;
import com.project.validators.SupplierValidator;
import com.project.validators.SupplierValidatorEdit;

@Controller
@RequestMapping(value = { "supplier" })
public class SupplierController implements ServletContextAware {

	@Autowired
	private SupplierValidator supplierValidator;
	
	@Autowired
	private SupplierValidatorEdit supplierValidatorEdit;

	
	@Autowired
	private InvoiceImportsService invoiceImportsService;


	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Autowired
	private SupplierService supplierService;

	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("suppliers", supplierService.getAllSupplier());
		return "supplier/index";
	}

	@RequestMapping(value = {"details/{id}"}, method = RequestMethod.GET)
	public String details(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		if (account.getRole().equals("ROLE_ADMIN")) {
			modelMap.put("invoices", invoiceImportsService.findAllBySuplierIdAdmin(id));
		}
		if (account.getRole().equals("ROLE_EMPLOYEE")) {
			modelMap.put("invoices", invoiceImportsService.findAllBySuplierIdEmployee(id, account.getId()));
		}
		return "supplier/details";
	}
	@RequestMapping(value = { "delete/{id}" }, method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, ModelMap modelMap) {
		try {
			supplierService.deletebyId(id);
		} catch (Exception e) {
			modelMap.put("msg", "Can't delete this category");
		}
		return "redirect:/supplier/index";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("supplier", new Supplier());
		return "supplier/add";
	}
	
	@RequestMapping(value = { "searchByName" }, method = RequestMethod.GET)
	public String searchByName(@RequestParam("name") String name, ModelMap modelMap) {
		modelMap.put("suppliers", supplierService.searchByName(name));
		return "supplier/index";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@ModelAttribute("supplier") @Valid Supplier supplier, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			if (bindingResult.hasErrors()) {
				return "supplier/add";
			}
			if (file != null && file.getSize() > 0) {
				String fileName = UploadHelper.uploadLogo(servletContext, file);
				supplier.setLogo(fileName);
			} else {
				supplier.setLogo("noImage.png");
			}
			supplierService.save(supplier);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "redirect:/supplier/index";
	}

	@RequestMapping(value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable(value = "id", required = false) Integer id, Model model, ModelMap modelMap,
			HttpSession session) {
		if (id == null) {
			return "supplier/notfound";
		}
		Supplier supplier = supplierService.findById(id);
		if (supplier == null) {
			return "supplier/notfound";
		}
		modelMap.put("supplier", supplier);
		return "supplier/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("supplier") @Valid Supplier supplier, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			supplierValidator.validate(supplier, bindingResult);
			if (bindingResult.hasErrors()) {
				return "supplier/edit";
			}
			Supplier currentSupplier = supplierService.findById(supplier.getId());
			if (file != null && file.getSize() > 0) {
				UploadHelper.deleteFileLogo(servletContext, currentSupplier.getLogo());
				String fileName = UploadHelper.uploadLogo(servletContext, file);
				supplier.setLogo(fileName);
			} else {
				supplier.setLogo(currentSupplier.getLogo());
			}
			supplierService.save(supplier);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/supplier/index";
	}
}
