package com.trio.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.service.BookService;
import com.trio.bookstore.vo.BookVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/admin")
public class BookRestController {

	@Autowired
	private BookService bookService;

	@GetMapping("/book")
	public BookVO bookVO() {
		return bookService.bookVO().getBody();
	}
}