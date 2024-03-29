package com.austinmiljour.gamenexusmarket.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.austinmiljour.gamenexusmarket.models.Category;
import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.ItemService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {

	// import the 2 services
	private final ItemService itemService;
	private final CategoryService categoryService;

	public AdminController(ItemService itemService, CategoryService categoryService) {
		this.itemService = itemService;
		this.categoryService = categoryService;
	}

	private boolean isAdmin(HttpSession session) {
	    Object adminFlag = session.getAttribute("admin");
	    return adminFlag instanceof Boolean && (Boolean) adminFlag;
	}

	@GetMapping("/admin")
	public String adminHome(Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		model.addAttribute("categories", categoryService.allCategories());
		return "adminPage.jsp";
	}

	// Add Category Page
	@GetMapping("/admin/add/category")
	public String adminAddCategory(Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		Category newCategory = new Category();
		model.addAttribute("newCategory", newCategory);
		return "adminAddCategory.jsp";
	}
	
	@PostMapping("/admin/add/category")
	public String processCreateCategoryForm(
			@Valid @ModelAttribute("newCategory") Category newCategory, BindingResult result, Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		// check for any errors
		if(result.hasErrors()) {
			List<Category> categoryList = categoryService.allCategories();
			model.addAttribute("categoryList", categoryList);
			return "adminAddCategory.jsp";
		}else {
			categoryService.createCategory(newCategory);
			return "redirect:/admin/add/category";	
		}
	}

	@GetMapping("/admin/edit/category")
	public String adminEditCategory(HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		return "adminAddCategory.jsp";
	}

	@GetMapping("/admin/remove/category/id")
	public String adminRemoveItem(HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		return "adminAddItem.jsp";
	}

	@GetMapping("/admin/add/item")
	public String adminAddItem(HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		return "adminAddItem.jsp";
	}

	@GetMapping("/admin/edit/item")
	public String adminEditItem(HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		return "adminAddItem.jsp";
	}

	@GetMapping("/admin/delete/item/id")
	public String adminRemoveCategory(HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		return "adminAddItem.jsp";
	}

}
