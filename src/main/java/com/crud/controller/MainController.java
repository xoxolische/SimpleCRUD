package com.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping({ "/", "main" })
	public String mainPage() {
		return "home";
	}

	@GetMapping("/custom")
	public String customPage() {
		return "custom";
	}

	@GetMapping("/jsgrid")
	public String jsGridPage() {
		return "jsgrid";
	}

}
