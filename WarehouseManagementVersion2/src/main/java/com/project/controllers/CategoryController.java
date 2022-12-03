package com.project.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.models.Category;
import com.project.services.CategoryService;

@Controller
@RequestMapping(value = { "category" })
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = { "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session,
			@RequestParam(name = "edit", required = false) Boolean edit,
			@RequestParam(name = "id", required = false) Integer id) {
		Iterable<Category> categories = categoryService.getAllCategory();
		modelMap.put("categories", categories);
		modelMap.put("category", new Category());
		if (session.getAttribute("error") != null) {
			modelMap.put("error", session.getAttribute("error"));
			session.removeAttribute("error");
		}
		if (session.getAttribute("editerr") != null) {
			modelMap.put("editerr", session.getAttribute("editerr"));
			session.removeAttribute("editerr");
		}else {
			session.removeAttribute("editerr");
		}	
		if (edit == null) {
			if (session.getAttribute("adderr") != null) {
				modelMap.put("adderr", session.getAttribute("adderr"));
				session.removeAttribute("adderr");
			}else {
				session.removeAttribute("adderr");
			}
			modelMap.put("category2", new Category());
		} else {
			if (id != null) {
				if (session.getAttribute("msg") == null) {
					session.setAttribute("msg", true);
					modelMap.put("msg", session.getAttribute("msg"));
					session.removeAttribute("msg");
				}else {
					session.removeAttribute("msg");
				}
				modelMap.put("category2", categoryService.findbyId(id));
			}
		}
		
		return "category/index";
	}
		
	@RequestMapping(value = { "searchByName" }, method = RequestMethod.GET)
	public String searchByName(@RequestParam("table_search") String name, ModelMap modelMap, HttpSession session,
		@RequestParam(name = "edit", required = false) Boolean edit,
		@RequestParam(name = "id", required = false) Integer id) {
		Iterable<Category> categories = categoryService.searchByName(name);
		modelMap.put("categories", categories);
		modelMap.put("category", new Category());
		if (session.getAttribute("error") != null) {
			modelMap.put("error", session.getAttribute("error"));
			session.removeAttribute("error");
		}
		if (edit == null) {
			if (session.getAttribute("adderr") != null) {
				modelMap.put("adderr", session.getAttribute("adderr"));
				session.removeAttribute("adderr");
			}else {
				session.removeAttribute("adderr");
			}
			modelMap.put("category2", new Category());
		} else {
			if (id != null) {
				if (session.getAttribute("msg") == null) {
					session.setAttribute("msg", true);
					modelMap.put("msg", session.getAttribute("msg"));
					session.removeAttribute("msg");
				}else {
					session.removeAttribute("msg");
				}
				modelMap.put("category2", categoryService.findbyId(id));
			}
		}
		
		return "category/index";
	}
	
	@RequestMapping(value = { "edit/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id,HttpSession session) {
		
			return "category/edit";
	}

	@RequestMapping(value = { "delete/{id}" }, method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, ModelMap modelMap, HttpSession session) {
		try {
			categoryService.deletebyId(id);
		} catch (Exception e) {
			if (session.getAttribute("error") == null) {
				session.setAttribute("error", "Can't delete this category!");
			}
		}
		return "redirect:/category/index";
	}
	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
	public String edit(@ModelAttribute("category2") Category category, HttpSession session) {
		try {
			categoryService.save(category);
		} catch (Exception e) {
			if (session.getAttribute("editerr") == null) {
				session.setAttribute("editerr", "  Category name already exist!");
			}
		}
		return "redirect:/category/index";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@ModelAttribute("category") Category category, HttpSession session) {
		try {
			categoryService.save(category);
		} catch (Exception e) {
			if (session.getAttribute("adderr") == null) {
				session.setAttribute("adderr", "  Category calready exist!");
			}else {
				session.removeAttribute("adderr");
			}
		}
		
		return "redirect:/category/index";
	}
}
