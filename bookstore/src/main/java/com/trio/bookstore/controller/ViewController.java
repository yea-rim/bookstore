package com.trio.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//웹소켓 연결을 위한 프론트 페이지로 안내하는 컨트롤러
@Controller
public class ViewController {
	
	@GetMapping("/chatbot")
	public String chatbot() {
		return "chatbot";
	}
}
