package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.austinmiljour.gamenexusmarket.models.Category;
import com.austinmiljour.gamenexusmarket.models.Item;
import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.ItemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	// import the 2 services
	private final ItemService itemService;
	private final CategoryService categoryService;

	public HomeController(ItemService itemService, CategoryService categoryService) {
			this.itemService = itemService;
			this.categoryService = categoryService;
		}

	// Dashboard Page
	@GetMapping("/")
	public String dashboard(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		return "dashboard.jsp";
	}
	
	// Item Details Page
	@GetMapping("/item/{id}")
	public String showOneItem(@PathVariable("id") Long id, HttpSession session, Model model) {
		Item oneItem = itemService.oneItem(id);
		model.addAttribute("item", oneItem);
		return "itemDetails.jsp";
	}
	
	// Category Page
	@GetMapping("/category/{id}")
	public String categoryPage(@PathVariable("id") Long id, Model model) {
		Category oneCategory = categoryService.oneCategory(id);
		model.addAttribute("category", oneCategory);
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "categoiresPage.jsp";
	}
	
	// All Items Page
	@GetMapping("/allItems")
	public String showAllItems(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "allItemsPage.jsp";
	}
	
	// All Items Available Page
	@GetMapping("/itemsAvailable")
	public String showAllItemsAvailable(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "itemsAvailablePage.jsp";
	}
}
