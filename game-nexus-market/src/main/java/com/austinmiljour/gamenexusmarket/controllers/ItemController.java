package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.austinmiljour.gamenexusmarket.models.Item;
import com.austinmiljour.gamenexusmarket.services.CartService;
import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.ItemService;

@Controller
public class ItemController {
	
	// import the 2 services
	private final ItemService itemService;
	private final CategoryService categoryService;
	private final CartService cartService;

	public ItemController (ItemService itemService, CategoryService categoryService, CartService cartService) {
			this.itemService = itemService;
			this.categoryService = categoryService;
			this.cartService = cartService;
		}
	
	// Item Details Page
	@GetMapping("/item/{id}")
	public String showOneItem(@PathVariable("id") Long id, Model model) {
		Item oneItem = itemService.oneItem(id);
		model.addAttribute("item", oneItem);
		model.addAttribute("cartSize", cartService.getItemCount());
		return "itemDetails.jsp";
	}
	
	//Add Item to Cart Process
	@GetMapping("/item/add/{id}")
	public String addItemToCart(@PathVariable("id") Long id, Model model) {
		Item item = itemService .oneItem(id);
		if (item != null && item.getInventory() > 0) {
			cartService.addItem(item);
			model.addAttribute("successMessage", "Item add to cart successfully!");
		} else {
			model.addAttribute("errorMessage", "Item is not currently available.");
		}
		return "redirect:/item/" + id;
	}
	
	// All Items Page
	@GetMapping("/allItems")
	public String showAllItems(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "allItemsPage.jsp";
	}
	
	// All Items Available Page
	@GetMapping("/itemsAvailable")
	public String showAllItemsAvailable(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "itemsAvailablePage.jsp";
	}
	
	// All Items Not Available Page
	@GetMapping("/itemsNotAvaiable")
	public String showAllItemsNotAvailable(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "itemsNotAvailablePage.jsp";
	}
	
	// All Items on Sale
	@GetMapping("/itemsOnSale")
	public String itemsOnSale(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("items", itemService.allItemes());
		model.addAttribute("cartSize", cartService.getItemCount());
		return "itemsOnSale.jsp";
	}
	
}
