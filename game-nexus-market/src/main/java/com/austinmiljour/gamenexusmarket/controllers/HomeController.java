package com.austinmiljour.gamenexusmarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/test")
	public String test() {
		return "test.jsp";
	}

	@GetMapping("/")
	public String dashboard() {
		return "dashboard.jsp";
	}
	

}
