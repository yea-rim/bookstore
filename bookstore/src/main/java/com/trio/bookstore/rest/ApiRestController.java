package com.trio.bookstore.rest;

import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.trio.bookstore.service.BookService;
import com.trio.bookstore.service.LibInfoService;
import com.trio.bookstore.vo.BookVO;
import com.trio.bookstore.vo.LVO;
import com.trio.bookstore.vo.LibInfoVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/admin")
public class ApiRestController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private LibInfoService libInfoService;

	@GetMapping("/api/book")
	public BookVO bookVO(@RequestParam(required = false) String query) {
		System.out.println("검색어 = " + query);
		return bookService.bookVO(query).getBody();
	}
	
	@GetMapping("/api/lib")
	public LVO lVO(@RequestParam(required = false) int number) throws URISyntaxException, JsonMappingException, JsonProcessingException {
		System.out.println("검색어 = " + number);
		return libInfoService.lVO(number).getBody();
	}
}