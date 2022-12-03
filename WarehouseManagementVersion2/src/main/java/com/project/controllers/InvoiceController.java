package com.project.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.models.Account;
import com.project.models.InvoiceExport;
import com.project.models.InvoiceExportDetails;
import com.project.models.InvoiceExportDetailsId;
import com.project.models.InvoiceImport;
import com.project.models.InvoiceImportDetails;
import com.project.models.InvoiceImportDetailsId;
import com.project.models.Item;
import com.project.models.Product;
import com.project.repositories.InvoiceImportRepository;
import com.project.services.AccountService;
import com.project.services.CustomerService;
import com.project.services.InvoiceExportDetailsService;
import com.project.services.InvoiceExportService;
import com.project.services.InvoiceImportDetailsService;
import com.project.services.InvoiceImportsService;
import com.project.services.ProductService;
import com.project.services.SupplierService;

@Controller
@RequestMapping(value = { "invoice" })
public class InvoiceController {

	@Autowired
	private InvoiceExportDetailsService invoiceExportDetailsService;
	@Autowired
	private InvoiceExportService invoiceExportService;
	@Autowired
	private InvoiceImportDetailsService invoiceImportDetailsService;
	@Autowired
	private InvoiceImportsService invoiceImportService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "listimport" }, method = RequestMethod.GET)
	public String listimport(ModelMap modelMap, HttpSession session) {

		Account account = (Account) session.getAttribute("account");
		if (account.getRole().equals("ROLE_ADMIN")) {
			modelMap.put("invoices", invoiceImportService.findAllDesc());
		}else {
			modelMap.put("invoices", invoiceImportService.findByAccountId(account.getId()));
		}

		return "invoice/listimport";
	}

	@RequestMapping(value = { "addItemImport" }, method = RequestMethod.GET)
	public String addItemImport(ModelMap modelMap) {

		modelMap.put("products", productService.findAll());
		return "invoice/addItemImport";
	}

	@RequestMapping(value = { "addItemImport" }, method = RequestMethod.POST)
	public String addItemImport(@RequestParam("comboboxProduct") int idProduct, @RequestParam("quantity") int quantity,
			HttpSession session) {
		Product product = productService.findById(idProduct);
		if (session.getAttribute("cartImport") == null) {
			List<Item> cartImport = new ArrayList<Item>();
			cartImport.add(new Item(product, quantity));
			session.setAttribute("cartImport", cartImport);
		} else {
			List<Item> cartImport = (List<Item>) session.getAttribute("cartImport");
			int index = exist(idProduct, cartImport);
			if (index == -1) {
				cartImport.add(new Item(product, quantity));
			} else {
				int newQuantity = cartImport.get(index).getQuantity() + quantity;
				cartImport.get(index).setQuantity(newQuantity);
			}

			session.setAttribute("cartImport", cartImport);
		}

		return "redirect:/invoice/addimport";
	}

	@RequestMapping(value = { "addimport" }, method = RequestMethod.GET)
	public String addimport(ModelMap modelMap) {
		modelMap.put("suppliers", supplierService.findAll());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		modelMap.put("today", simpleDateFormat.format(new Date()));
		return "invoice/addimport";
	}

	@RequestMapping(value = { "addimport" }, method = RequestMethod.POST)
	public String addimport(@RequestParam("quantities") int[] quantities, HttpSession session,
			@RequestParam("accountId") int accountId, @RequestParam("comboboxSupplier") int comboboxSupplier,
			@RequestParam("payment") String payment, @RequestParam("description") String description) {
		try {
			InvoiceImport invoiceImport = new InvoiceImport();
			invoiceImport.setAccount(accountService.findById(accountId));
			invoiceImport.setCreated(new Date());
			invoiceImport.setSupplier(supplierService.findById(comboboxSupplier));
			invoiceImport.setPayment(payment);
			invoiceImport.setDescription(description);
			InvoiceImport savedInvoiceImport = invoiceImportService.save(invoiceImport);
			// ------------------------add import details---------------------
			if (session.getAttribute("cartImport") != null) {
				List<Item> cartImport = (List<Item>) session.getAttribute("cartImport");
				for (int i = 0; i < quantities.length; ++i) {
					cartImport.get(i).setQuantity(quantities[i]);
				}
				for (Item item : cartImport) {
					InvoiceImportDetails invoiceImportDetails = new InvoiceImportDetails();
					invoiceImportDetails.setInvoiceImport(savedInvoiceImport);
					invoiceImportDetails.setProduct(item.getProduct());
					invoiceImportDetails.setPrice(item.getProduct().getPrice());
					invoiceImportDetails.setQuantity(item.getQuantity());
					invoiceImportDetails.setUnit(item.getProduct().getUnit());
					invoiceImportDetails
							.setId(new InvoiceImportDetailsId(savedInvoiceImport.getId(), item.getProduct().getId()));
					invoiceImportDetailsService.save(invoiceImportDetails);
					// --------------update quantity------------------------------
					productService.updateQuantityImport(item.getProduct().getId(), item.getQuantity());
					// --------------remove session-----------------------------------
					session.removeAttribute("cartImport");
				}
			}
			return "redirect:/invoice/listimport";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "invoice/addimport";
		}

	}

	@RequestMapping(value = { "updatequantityimport" }, method = RequestMethod.POST)
	public String updatequantityimport(@RequestParam("quantities") int[] quantities, HttpSession session) {
		if (session.getAttribute("cartImport") != null) {
			List<Item> cartImport = (List<Item>) session.getAttribute("cartImport");
			for (int i = 0; i < quantities.length; ++i) {
				cartImport.get(i).setQuantity(quantities[i]);
			}
			session.setAttribute("cartImport", cartImport);
		}
		return "redirect:/invoice/addimport";

	}

	// ---------------------------------------------Export-------------------------------------------


	@RequestMapping(value = { "addItemExport" }, method = RequestMethod.GET)
	public String addItemExport(ModelMap modelMap) {

		modelMap.put("products", productService.findByQuantityGreaterThan0());
		return "invoice/addItemExport";
	}

	@RequestMapping(value = { "addItemExport" }, method = RequestMethod.POST)
	public String addItemExport(@RequestParam("comboboxProduct") int idProduct, @RequestParam("quantity") int quantity,
			HttpSession session, ModelMap modelMap) {
		Product product = productService.findById(idProduct);
		// -------check quantity is valid-------------
		if (product.getQuantity() < quantity) {
			modelMap.put("products", productService.findByQuantityGreaterThan0());
			modelMap.put("error", "Quantity of this product is " + product.getQuantity());
			return "invoice/addItemExport";
		}
		// -------------------------------------------------------
		if (session.getAttribute("cartExport") == null) {
			List<Item> cartExport = new ArrayList<Item>();
			cartExport.add(new Item(product, quantity));
			session.setAttribute("cartExport", cartExport);
		} else {
			List<Item> cartExport = (List<Item>) session.getAttribute("cartExport");
			int index = exist(idProduct, cartExport);
			if (index == -1) {
				cartExport.add(new Item(product, quantity));
			} else {
				int newQuantity = cartExport.get(index).getQuantity() + quantity;
				cartExport.get(index).setQuantity(newQuantity);
			}

			session.setAttribute("cartExport", cartExport);
		}

		return "redirect:/invoice/addexport";
	}

	@RequestMapping(value = { "addexport" }, method = RequestMethod.GET)
	public String addexport(ModelMap modelMap) {
		modelMap.put("customers", customerService.findAll());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		modelMap.put("today", simpleDateFormat.format(new Date()));
		return "invoice/addexport";
	}

	@RequestMapping(value = { "addexport" }, method = RequestMethod.POST)
	public String addexport(@RequestParam("quantities") int[] quantities, HttpSession session,
			@RequestParam("accountId") int accountId, @RequestParam("comboboxCustomer") int comboboxCustomer,
			@RequestParam("payment") String payment, @RequestParam("description") String description,
			ModelMap modelMap) {
		try {
			if (session.getAttribute("cartExport") != null) {
				List<Item> cartExport = (List<Item>) session.getAttribute("cartExport");
				for (int i = 0; i < quantities.length; ++i) {
					// check quantity is valid
					Product product = productService.findById(cartExport.get(i).getProduct().getId());
					if (product.getQuantity() < quantities[i]) {
						modelMap.put("customers", customerService.findAll());
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
						modelMap.put("today", simpleDateFormat.format(new Date()));
						modelMap.put("error",
								"Quantity of product " + product.getName() + " is " + product.getQuantity());
						return "invoice/addexport";
					} else {
						cartExport.get(i).setQuantity(quantities[i]);
					}
					// ------------------------------------
				}
				// ------------------------add Export indvoice ---------------------
				InvoiceExport invoiceExport = new InvoiceExport();
				invoiceExport.setAccount(accountService.findById(accountId));
				invoiceExport.setCreated(new Date());
				invoiceExport.setCustomer(customerService.findById(comboboxCustomer));
				invoiceExport.setPayment(payment);
				invoiceExport.setDescription(description);
				InvoiceExport savedInvoiceExport = invoiceExportService.save(invoiceExport);
				// ------------------------add Export details---------------------

				for (Item item : cartExport) {
					InvoiceExportDetails invoiceExportDetails = new InvoiceExportDetails();
					invoiceExportDetails.setInvoiceExport(savedInvoiceExport);
					invoiceExportDetails.setProduct(item.getProduct());
					invoiceExportDetails.setPrice(item.getProduct().getPrice());
					invoiceExportDetails.setQuantity(item.getQuantity());
					invoiceExportDetails.setUnit(item.getProduct().getUnit());
					invoiceExportDetails
							.setId(new InvoiceExportDetailsId(savedInvoiceExport.getId(), item.getProduct().getId()));
					invoiceExportDetailsService.save(invoiceExportDetails);
					// --------------update quantity------------------------------
					productService.updateQuantityExport(item.getProduct().getId(), item.getQuantity());
					// --------------remove session-----------------------------------
					session.removeAttribute("cartExport");
				}
			}
			return "redirect:/invoice/listexport";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "invoice/addexport";
		}

	}

	@RequestMapping(value = { "updatequantityexport" }, method = RequestMethod.POST)
	public String updatequantityexport(@RequestParam("quantities") int[] quantities, ModelMap modelMap,
			HttpSession session) {
		if (session.getAttribute("cartExport") != null) {
			List<Item> cartExport = (List<Item>) session.getAttribute("cartExport");
			for (int i = 0; i < quantities.length; ++i) {
				// check quantity is valid
				Product product = productService.findById(cartExport.get(i).getProduct().getId());
				if (product.getQuantity() < quantities[i]) {
					modelMap.put("customers", customerService.findAll());
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
					modelMap.put("today", simpleDateFormat.format(new Date()));
					modelMap.put("error", "Quantity of product " + product.getName() + " is " + product.getQuantity());
					return "invoice/addexport";
				} else {
					cartExport.get(i).setQuantity(quantities[i]);
				}
				// -------------------------------------
			}
			session.setAttribute("cartImport", cartExport);
		}
		return "redirect:/invoice/addexport";

	}
	// ---------------------------------------------------------------------------------------------

	private int exist(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); ++i) {
			if (cart.get(i).getProduct().getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}
	@RequestMapping(value = { "detailsImport" }, method = RequestMethod.GET)
	public String detailsImport(@RequestParam("id") int id, ModelMap modelMap) {

		InvoiceImport invoiceImport = invoiceImportService.findById(id);
		modelMap.put("invoiceImport", invoiceImport);
		return "invoice/detailsImport";
	}
	
	@RequestMapping(value = { "invoiceImportPrint" }, method = RequestMethod.GET)
	public String invoiceImportPrint(@RequestParam("id") int id, ModelMap modelMap) {

		InvoiceImport invoiceImport = invoiceImportService.findById(id);
		modelMap.put("invoiceImport", invoiceImport);
		return "invoice/invoiceImportPrint";
	}
	@RequestMapping(value = { "listexport" }, method = RequestMethod.GET)
	public String listexport(ModelMap modelMap, HttpSession session) {

		Account account = (Account) session.getAttribute("account");
		if (account.getRole().equals("ROLE_ADMIN")) {
			modelMap.put("invoices", invoiceExportService.findAllDesc());
		}else {
			modelMap.put("invoices", invoiceExportService.findByAccountId(account.getId()));
		}

		return "invoice/listexport";
	}
	
	@RequestMapping(value = { "detailsExport" }, method = RequestMethod.GET)
	public String detailsExport(@RequestParam("id") int id, ModelMap modelMap) {

		InvoiceExport invoiceExport = invoiceExportService.findById(id);
		modelMap.put("invoiceExport", invoiceExport);
		return "invoice/detailsExport";
	}
	
	@RequestMapping(value = { "invoiceExportPrint" }, method = RequestMethod.GET)
	public String invoiceExportPrint(@RequestParam("id") int id, ModelMap modelMap) {

		InvoiceExport invoiceExport = invoiceExportService.findById(id);
		modelMap.put("invoiceExport", invoiceExport);
		return "invoice/invoiceExportPrint";
	}
	
	@RequestMapping(value = { "cancel" }, method = RequestMethod.GET)
	public String cancel(HttpSession session) {
		if (session.getAttribute("cartExport") != null) {
			session.removeAttribute("cartExport");
		}
		if (session.getAttribute("cartImport") != null) {
			session.removeAttribute("cartImport");
		}
		
		return "redirect:/invoice/listimport";
	}
}
