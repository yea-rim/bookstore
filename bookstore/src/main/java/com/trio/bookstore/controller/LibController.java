package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lib")
@Controller
public class LibController {

	@RequestMapping("/main")
	public String main() {
		return "lib/main";
	}

	@RequestMapping("/rental")
	public String rental() {
		return "lib/rental";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "lib/list";
	}
	
	

}
