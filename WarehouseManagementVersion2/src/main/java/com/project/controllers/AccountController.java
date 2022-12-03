package com.project.controllers;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = { "", "account" })
public class AccountController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	private AccountValidatorUpdate accountValidatorUpdate;
	
	@Autowired
	private AccountValidator accountValidator;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "login" }, method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
			modelMap.put("msg", "Invalid account or account is inactive");
		} else if (logout != null) {
			modelMap.put("msg", "Logout success");
		}

		return "account/login";
	}

	@RequestMapping(value = {"logout"}, method = RequestMethod.GET)
	public String index2(HttpSession session) {
		if (session.getAttribute("account") != null) {
			session.removeAttribute("account");
		}
		return "account/logout";
	}
	
	@RequestMapping(value = {"forgotPassword"}, method = RequestMethod.GET)
	public String forgotPassword() {
		
		return "account/forgotPassword";
	}
	
	@RequestMapping(value = {"newPassword"}, method = RequestMethod.GET)
	public String newPassword() {
		
		return "account/newPassword";
	}
	
	
	
	@RequestMapping(value = {"accessdenied"}, method = RequestMethod.GET)
	public String accessdenied() {
		
		return "account/accessdenied";
	}
	
	@RequestMapping(value = {"updateInfo"}, method = RequestMethod.GET)
	public String updateInfo(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		modelMap.put("account", account);
		if (session.getAttribute("msg") != null) {
			modelMap.put("msg", session.getAttribute("msg"));
			session.removeAttribute("msg");
		}
		return "account/updateInfo";
	}
	
	@RequestMapping(value = {"updateInfo"}, method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute("account") @Valid Account account,
			BindingResult bindingResult,
			ModelMap modelMap, @RequestParam(value =  "file", required = false) MultipartFile file,
			HttpSession session) {
		
		try {
			Account currentAccount = accountService.findById(account.getId());
			accountValidatorUpdate.validate(account, bindingResult);
			if (bindingResult.hasErrors()) {
				return "account/updateInfo";
			}else {
				if (file != null && file.getSize() > 0) {
					String fileName = UploadHelper.upload(servletContext, file);
					UploadHelper.deleteFile(servletContext, currentAccount.getPhoto());
					account.setPhoto(fileName);
				}else {
					account.setPhoto(currentAccount.getPhoto());
				}
				Account accountUpdate = accountService.save(account);
				//--------------success-------------------------
				//--------------change session--------------------
				session.removeAttribute("account");
				session.setAttribute("account", accountUpdate);
				if (session.getAttribute("msg") == null) {
					session.setAttribute("msg", "Update Successfully!");
				}else {
					session.removeAttribute("msg");
				}
				return "redirect:/account/updateInfo";
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "account/updateInfo";
		}
		
	}
	
	@RequestMapping(value = {"changePassword"}, method = RequestMethod.GET)
	public String changePassword() {
		
		return "account/changePassword";
	}
	
	@RequestMapping(value = {"changePassword"}, method = RequestMethod.POST)
	public String changePassword(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("retypePassword") String retypePassword, ModelMap modelMap,
			HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		Pattern pattern = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})");
		Matcher matcher = pattern.matcher(newPassword);
		if (!bCryptPasswordEncoder.matches(oldPassword, account.getPassword()) || !newPassword.equals(retypePassword)) {
			modelMap.put("msg", "Old password is not correct or new password and retype password do not match!");
		}else if(!matcher.matches()) {
			modelMap.put("msg", "Password must have lowercase letter, uppercase letter, number, one special character [@#$%] and between 6-20 characters");
		}else {
			accountService.updatePassword(account.getId(), bCryptPasswordEncoder.encode(newPassword));
			modelMap.put("msg", "Update password success!");
		}
		
		return "account/changePassword";
	}
}
					
					