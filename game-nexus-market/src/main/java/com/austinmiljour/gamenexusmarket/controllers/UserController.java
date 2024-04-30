package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.austinmiljour.gamenexusmarket.models.LoginUser;
import com.austinmiljour.gamenexusmarket.models.User;
import com.austinmiljour.gamenexusmarket.services.CartService;
import com.austinmiljour.gamenexusmarket.services.CategoryService;
import com.austinmiljour.gamenexusmarket.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	// Add the UserService
	private final UserService userService;
	private final CategoryService categoryService;
	private final CartService cartService;
	
	public UserController(UserService userService, CategoryService categoryService, CartService cartService) {
		this.userService = userService;
		this.categoryService = categoryService;
		this.cartService = cartService;
	}

	// Display login and register forms
	@GetMapping("/loginandregister")
	public String loginRegistrationForm(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("cartSize", cartService.getItemCount());
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "loginRegistration.jsp";
	}
	
	// Process Register
	@PostMapping("/register")
	public String processRegister(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session
			) {
		User registeredUser = userService.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "loginRegistration.jsp";
		} else {
			// save the userId to session for future use
			session.setAttribute("userId", registeredUser.getId());
			// save the userName to session for future use
			session.setAttribute("userName", registeredUser.getFirstName());
			// save the userName to session for future use
			session.setAttribute("admin", registeredUser.isAdmin());
			return"redirect:/";
		}
	}
	
	// Process Login
	@PostMapping("/login")
	public String processLogin(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session
			) {
		User loggedUser = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "loginRegistration.jsp";
		} else {
			// save the userId to session for future use
			session.setAttribute("userId", loggedUser.getId());
			// save the userName to session for future use
			session.setAttribute("firstName", loggedUser.getFirstName());
			// save the userName to session for future use
			session.setAttribute("admin", loggedUser.isAdmin());
			return"redirect:/";
		}
	}
	
	// Process Logout
	@GetMapping("/clearsession")
	public String clearSession(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}