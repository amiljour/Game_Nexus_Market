package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.ItemService;

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

}
