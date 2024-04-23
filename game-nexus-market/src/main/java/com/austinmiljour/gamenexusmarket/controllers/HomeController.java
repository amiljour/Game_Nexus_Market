package com.austinmiljour.gamenexusmarket.controllers;

import java.util.Collections;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.austinmiljour.gamenexusmarket.models.CartItem;
import com.austinmiljour.gamenexusmarket.models.Category;
import com.austinmiljour.gamenexusmarket.services.CartService;
import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.ItemService;

@Controller
public class HomeController {

	// import the 2 services
	private final ItemService itemService;
	private final CategoryService categoryService;
	private final CartService cartService;

	public HomeController(ItemService itemService, CategoryService categoryService, CartService cartService) {
			this.itemService = itemService;
			this.categoryService = categoryService;
			this.cartService = cartService;
		}

	// Home Page
	@GetMapping("/")
	public String dashboard(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "dashboard.jsp";
	}
	
	// Category Page
	@GetMapping("/category/{id}")
	public String categoryPage(@PathVariable("id") Long id, Model model) {
		Category oneCategory = categoryService.oneCategory(id);
		model.addAttribute("category", oneCategory);
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "categoiresPage.jsp";
	}
	
	// Cart Page
	@GetMapping("/shoppingCart")
	public String cartPage(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("cartSize", cartService.getItemCount());
	    Map<Long, CartItem> items = cartService.getItems();
	    if (items == null || items.isEmpty()) {
	        model.addAttribute("cartItems", Collections.emptyMap());
	    } else {
	        model.addAttribute("cartItems", items.values());
	    }
	    model.addAttribute("total", cartService.getTotal());
	    model.addAttribute("items", itemService.allItemes());
	    return "cartPage.jsp";
	}
	
}
