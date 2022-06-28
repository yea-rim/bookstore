package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/")
	public String index() {
		return "admin/main";
	}
	
	@RequestMapping("/book")
	public String book() {
		return "admin/book";
	}
	
	@RequestMapping("/lib")
	public String lib() {
		return "admin/lib";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "admin/member";
	}
}