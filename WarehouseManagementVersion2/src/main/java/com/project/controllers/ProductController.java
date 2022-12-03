package com.project.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
import com.project.models.InvoiceExport;
import com.project.models.InvoiceImport;
import com.project.models.Product;
import com.project.models.ProductImage;
import com.project.services.CategoryService;
import com.project.services.InvoiceExportService;
import com.project.services.InvoiceImportsService;
import com.project.services.ProductImageService;
import com.project.services.ProductService;
import com.project.validators.ProductValidator;
import com.project.validators.ProductValidatorEdit;

@Controller
@RequestMapping(value = { "product" })
public class ProductController implements ServletContextAware {
	@Autowired
	private ProductService productService;

	@Autowired
	private InvoiceExportService invoiceExportService;

	@Autowired
	private InvoiceImportsService invoiceImportService;

	@Autowired
	private ProductValidator productValidator;

	@Autowired
	private ProductValidatorEdit productValidatorEdit;

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductImageService productImageService;
	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.getAllProduct());
		return "product/index";
	}
	
	@RequestMapping(value = { "searchByName" }, method = RequestMethod.GET)
	public String searchByName(@RequestParam("name") String name, ModelMap modelMap) {
		modelMap.put("products", productService.searchByName(name));
		return "product/index";
	}

	@RequestMapping(value = { "add" }, method = RequestMethod.GET)
	public String add(ModelMap modelMap) {

		Product product = new Product();
		product.setQuantity(0);
		modelMap.put("product", product);
		modelMap.put("categories", categoryService.getAllCategory());
		return "product/add";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
			@RequestParam(value = "files", required = false) MultipartFile[] files) {
		try {
			if (bindingResult.hasErrors()) {
				return "product/add";
			}
			Product productSaved = productService.save(product);
			if (files != null && files.length > 0) {
				List<ProductImage> productImages = new ArrayList<ProductImage>();
				for (MultipartFile file : files) {
					ProductImage productImage = new ProductImage();
					productImage.setName(UploadHelper.uploadProduct(servletContext, file));
					productImage.setProduct(productSaved);
					productImages.add(productImage);
				}
				productImageService.saveAll(productImages);
			}
			return "redirect:/product/index";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:/product/index";
		}
	}

	@RequestMapping(value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable(value = "id", required = false) Integer id, Model model, ModelMap modelMap,
			HttpSession session) {
		if (id == null) {
			return "product/notfound";
		}
		Product product = productService.findById(id);
		if (product == null) {
			return "product/notfound";
		}
		modelMap.put("product", product);
		modelMap.put("categories", categoryService.getAllCategory());
		return "product/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			productValidatorEdit.validate(product, bindingResult);
			if (bindingResult.hasErrors()) {
				return "product/edit";
			}
			Product currentProduct = productService.findById(product.getId());
			currentProduct.setName(product.getName());
			currentProduct.setPrice(product.getPrice());
			currentProduct.setUnit(product.getUnit());
			currentProduct.setCategory(product.getCategory());
			productService.save(product);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/product/index";
	}

	@RequestMapping(value = { "details/{id}" }, method = RequestMethod.GET)
	public String details(@PathVariable(value = "id", required = false) Integer id, ModelMap modelMap,
			HttpSession session) {
		if (id == null) {
			return "product/notfound";
		}
		Product product = productService.findById(id);
		if (product == null) {
			return "product/notfound";
		}
		modelMap.put("product", product);
		modelMap.put("photos", product.getProductImages());
		List<InvoiceExport> invoicesexport = invoiceExportService.findAllByProductId(id);
		List<InvoiceImport> invoicesimport = invoiceImportService.findAllByProductId(id);
		modelMap.put("invoicesexport", invoicesexport);
		modelMap.put("invoicesimport", invoicesimport);
		return "product/details";
	}

	@RequestMapping(value = { "deleteImg/{id}" }, method = RequestMethod.GET)
	public String deleteImg(@PathVariable("id") int id, ModelMap modelMap) {
		ProductImage productImg = productImageService.find(id);
		int productId = productImg.getProduct().getId();
		productImageService.delete(id);
		return "redirect:/product/details/" + productId;
	}

	@RequestMapping(value = { "delete/{id}" }, method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		try {
			productService.deletebyId(id);
		} catch (Exception e) {
			if (session.getAttribute("msg") == null) {
				session.setAttribute("msg", "Can't delete this product!");
			}
		}
		return "redirect:/product/index";
	}

	@RequestMapping(value = { "addImg/{proId}" }, method = RequestMethod.GET)
	public String addImg(@PathVariable("proId") int id, ModelMap modelMap) {
		Product product = productService.findById(id);
		ProductImage photo = new ProductImage();
		photo.setProduct(product);
		modelMap.put("photo", photo);
		return "product/addImg";
	}

	@RequestMapping(value = { "uploadImg/{id}" }, method = RequestMethod.GET)
	public String updateImg(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("photo", productImageService.find(id));
		return "product/uploadImg";
	}

	@RequestMapping(value = { "addImg" }, method = RequestMethod.POST)
	public String add(@RequestParam("proid") int proid,
			@RequestParam(value = "chooseFile", required = false) MultipartFile[] file) {
		Product product = productService.findById(proid);
		if (file != null && file.length > 0) {
			for (MultipartFile photo1 : file) {
				ProductImage productImage = new ProductImage();
				productImage.setProduct(product);
				productImage.setName(UploadHelper.uploadProduct(servletContext, photo1));
				productImageService.save(productImage);
			}
		}
		return "redirect:/product/details/" + proid;
	}

	@RequestMapping(value = { "uploadImg" }, method = RequestMethod.POST)
	public String upload(@ModelAttribute("photo") @Valid ProductImage photo, BindingResult bindingResult,
			@RequestParam(value = "files", required = false) MultipartFile file) {
		/*
		 * try { supplierValidator.validate(supplier, bindingResult); if
		 * (bindingResult.hasErrors()) { return "supplier/edit"; }
		 */
		ProductImage productImage = productImageService.find(photo.getId());
		photo.setProduct(productImage.getProduct());
		if (file != null && file.getSize() > 0) {
			String fileName = UploadHelper.uploadProduct(servletContext, file);
			UploadHelper.deleteFile(servletContext, photo.getName());
			photo.setName(fileName);
		} else {
			photo.setName(productImage.getName());
		}
		productImageService.save(photo);
		System.out.println(photo.getName());
		return "redirect:/product/details/" + productImage.getProduct().getId();
	}
}
