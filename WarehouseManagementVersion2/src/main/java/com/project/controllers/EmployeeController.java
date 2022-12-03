package com.project.controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.project.helpers.UploadHelper;
import com.project.models.Account;
import com.project.services.AccountService;
import com.project.validators.AccountValidator;
import com.project.validators.AccountValidatorUpdate;

@Controller
@RequestMapping(value = { "employee" })
public class EmployeeController implements ServletContextAware {

	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Autowired
	private AccountValidator accountValidator;

	@Autowired
	private AccountValidatorUpdate accountValidatorUpdate;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("employees", accountService.findAllEmployee());
		return "employee/index";
	}

	@RequestMapping(value = { "searchByName" }, method = RequestMethod.GET)
	public String searchByName(@RequestParam("name") String name, ModelMap modelMap) {
		modelMap.put("employees", accountService.searchByName(name));
		return "employee/index";
	}

	@RequestMapping(value = { "disable" }, method = RequestMethod.GET)
	public String disable(@RequestParam("id") int id) {
		accountService.disable(id);
		return "redirect:/employee/index";
	}

	@RequestMapping(value = { "enable" }, method = RequestMethod.GET)
	public String enable(@RequestParam("id") int id) {
		accountService.enable(id);
		return "redirect:/employee/index";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.GET)
	public String edit(@RequestParam(value = "id", required = false) Integer id, Model model, ModelMap modelMap,
			HttpSession session) {
		if (id == null) {
			return "account/notfound";
		}
		Account employee = accountService.findById(id);
		if (employee == null || employee.getRole().equals("ROLE_ADMIN")) {
			return "account/notfound";
		}

		modelMap.put("employee", employee);
		return "employee/edit";
	}

	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("employee") @Valid Account employee, BindingResult bindingResult,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			accountValidatorUpdate.validate(employee, bindingResult);
			if (bindingResult.hasErrors()) {
				return "employee/edit";
			}
			Account currentEmployee = accountService.findById(employee.getId());
			if (file != null && file.getSize() > 0) {
				UploadHelper.deleteFile(servletContext, currentEmployee.getPhoto());
				String fileName = UploadHelper.upload(servletContext, file);
				employee.setPhoto(fileName);
			} else {
				employee.setPhoto(currentEmployee.getPhoto());
			}
			employee.setUsername(currentEmployee.getUsername());

			if(!employee.getPassword().equalsIgnoreCase("*****")) {
				employee.setPassword(new BCryptPasswordEncoder().encode(employee.getPassword()));
				
			}else {
				employee.setPassword(currentEmployee.getPassword());
			}
			employee.setRole(currentEmployee.getRole());
			accountService.save(employee);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/employee/index";
	}
	
	@RequestMapping(value = {"register"}, method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		Account account = new Account();
		
		modelMap.put("account", account);
		return "employee/register";
	}

	@RequestMapping(value = {"register"}, method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account,
			BindingResult bindingResult,
			@RequestParam(value =  "file", required = false) MultipartFile file,
			@RequestParam(value = "retypePassword", required = true) String retypePassword,
			ModelMap modelMap) {
		try {
			accountValidator.validate(account, bindingResult);
			if (bindingResult.hasErrors()) {
				return "employee/register";
			}
			if (retypePassword.isEmpty() || retypePassword.isBlank() || !retypePassword.equals(account.getPassword())) {
				modelMap.put("msg", "Retype password and password must be equal");
				return "employee/register";
			}else {
				account.setStatus(true);
				account.setRole("ROLE_EMPLOYEE");
				account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
				if (file != null && file.getSize() > 0) {
					String fileName = UploadHelper.upload(servletContext, file);
					account.setPhoto(fileName);
				}else {
					account.setPhoto("noImage.png");
				}
				accountService.save(account);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/employee/index";
	}
}