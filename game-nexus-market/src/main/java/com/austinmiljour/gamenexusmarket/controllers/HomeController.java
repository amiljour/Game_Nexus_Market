package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

	@GetMapping("/test")
	public String test() {
		return "test.jsp";
	}

	@GetMapping("/")
	public String dashboard(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		return "dashboard.jsp";
	}
	
	@GetMapping("/allItems")
	public String showAllItems(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		return "allItemsPage.jsp";
	}
	
	@GetMapping("/item/{id}")
	public String showOneItem(@PathVariable("id") Long id, HttpSession session, Model model) {
		Item oneItem = itemService.oneItem(id);
	    model.addAttribute("item", oneItem);
		return "itemDetails.jsp";
	}

}
