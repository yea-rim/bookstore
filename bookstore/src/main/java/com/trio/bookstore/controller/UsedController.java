package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/used")
@Controller
public class UsedController {
	
	@RequestMapping("/list")
	public String used() {
		return "used/list";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "used/write";
	}

}
