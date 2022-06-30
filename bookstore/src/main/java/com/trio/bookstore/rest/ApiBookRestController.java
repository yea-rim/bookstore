//package com.trio.bookstore.rest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.trio.bookstore.service.BookService;
//import com.trio.bookstore.vo.BookVO;
//
//@CrossOrigin(origins = "http://127.0.0.1:5500")
//@RestController
//@RequestMapping("/admin")
//public class ApiBookRestController {
//
//	@Autowired
//	private BookService bookService;
//
//	@GetMapping("/book/{query}")
//	public BookVO bookVO(@RequestParam(required = false) String query) {
//		System.out.println("검색어 = " + query);
//		return bookService.bookVO(query).getBody();
//	}
//}