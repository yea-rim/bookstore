package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lib")
@Controller
public class LibController {

	@RequestMapping("/list")
	public String list() {
		return "lib/list";
	}

	@RequestMapping("/detail")
	public String detail() {
		return "lib/detail";
	}

}
