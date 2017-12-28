package com.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@GetMapping({ "/", "main" })
	public String mainPage(Model model) {
		return "home";
	}

	@GetMapping("help")
	public String aboutPage(Model model) {
		return "about";
	}

	@RequestMapping("404")
	public String error404() {
		// System.out.println("custom error handler");
		return "/errorPage";
	}

}
