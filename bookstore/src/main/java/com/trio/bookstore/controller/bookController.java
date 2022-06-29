package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/book")
@Controller
public class bookController {
	
	@RequestMapping("/list")
	public String list() {
		return "book/list";  
	}
	@RequestMapping("/detail")
	public String detail() {
		return "book/detail";
	}
}
