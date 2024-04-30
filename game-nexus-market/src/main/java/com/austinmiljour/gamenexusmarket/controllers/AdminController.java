package com.austinmiljour.gamenexusmarket.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.austinmiljour.gamenexusmarket.models.Category;
import com.austinmiljour.gamenexusmarket.models.Item;
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

	// Testing Page
	@GetMapping("/test")
	public String test(Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "test.jsp";
	}

	@GetMapping("/admin")
	public String adminHome(Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
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

	// Add Category Processing
	@PostMapping("/admin/add/category")
	public String processCreateCategoryForm(@Valid @ModelAttribute("newCategory") Category newCategory,
			BindingResult result, Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		// check for any errors
		if (result.hasErrors()) {
			List<Category> categoryList = categoryService.allCategories();
			model.addAttribute("categoryList", categoryList);
			return "adminAddCategory.jsp";
		} else {
			categoryService.createCategory(newCategory);
			return "redirect:/admin/add/category";
		}
	}

	// Edit Category Page
	@GetMapping("/admin/edit/category/{id}")
	public String adminEditCategory(@PathVariable("id") Long id, Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		Category oneCategory = categoryService.oneCategory(id);
		model.addAttribute("category", oneCategory);
		return "adminEditCategory.jsp";
	}

	// Edit Category Process
	@PutMapping("/admin/edit/category/{id}")
	public String processEditCategoryProcess(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model,
			HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		if (result.hasErrors()) {
			return "adminEditCategory.jsp";
		} else {
			categoryService.updateCategory(category);
			return "redirect:/admin";
		}
	}

	// Delete Category Process
	@DeleteMapping("/admin/delete/category/{id}")
	public String processDeleteCategory(@PathVariable("id") Long id, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		categoryService.deleteCategoryById(id);
		return "redirect:/admin";
	}

	// Add Item Page
	@GetMapping("/admin/add/item")
	public String adminAddItem(HttpSession session, Model model) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		List<Category> categoryList = categoryService.allCategories();
		model.addAttribute("categories", categoryList);
		Item newItem = new Item();
		model.addAttribute("newItem", newItem);
		return "adminAddItem.jsp";
	}

	// Add Item Processing
	@PostMapping("/admin/add/item")
	public String processCreateItemForm(@Valid @ModelAttribute("newItem") Item newItem, BindingResult result,
			Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		if (result.hasErrors()) {
			List<Category> categoryList = categoryService.allCategories();
			model.addAttribute("categories", categoryList);
			List<Item> itemList = itemService.allItemes();
			model.addAttribute("itemList", itemList);
			return "adminAddItem.jsp";
		} else {
			itemService.createItem(newItem);
			return "redirect:/admin/add/item";
		}
	}

	// Edit Item Page
	@GetMapping("/admin/edit/item/{id}")
	public String adminEditItem(@PathVariable("id") Long id, HttpSession session, Model model) {
	    // Route Protection
	    if (!isAdmin(session)) {
	        return "redirect:/clearsession";
	    }
	    List<Category> categoryList = categoryService.allCategories();
	    model.addAttribute("categories", categoryList);
	    Item oneItem = itemService.oneItem(id);
	    model.addAttribute("item", oneItem);
	    return "adminEditItem.jsp";
	}

	// Edit Item Processing
	@PutMapping("/admin/edit/item/{id}")
	public String adminEditItemProcess(@PathVariable("id") Long id, @Valid @ModelAttribute("item") Item item, BindingResult result, Model model,
	        HttpSession session) {
	    // Route Protection
	    if (!isAdmin(session)) {
	        return "redirect:/clearsession";
	    }
	    if (result.hasErrors()) {
	        List<Category> categoryList = categoryService.allCategories();
	        model.addAttribute("categories", categoryList);
	        List<Item> itemList = itemService.allItemes();
	        model.addAttribute("itemList", itemList);
	        return "adminEditItem.jsp";
	    } else {
	        itemService.updateItem(item);
	        return "redirect:/admin";
	    }
	}

	// Delete Item Process
	@DeleteMapping("/admin/delete/item/{id}")
	public String processDeleteItem(@PathVariable("id") Long id, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		itemService.deleteItemById(id);
		return "redirect:/admin";
	}
	
	// All Items not in Stock Page
	// Testing Page
	@GetMapping("/admin/items/outOfStock")
	public String adminOutOfStock(Model model, HttpSession session) {
		// Route Protection
		if (!isAdmin(session)) {
			return "redirect:/clearsession";
		}
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "adminItemsOutOfStock.jsp";
	}


}
