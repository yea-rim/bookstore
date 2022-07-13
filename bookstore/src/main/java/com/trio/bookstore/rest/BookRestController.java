package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.repository2.BookDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/book")
public class BookRestController {

	@Autowired
	private BookDao bookDao;

	@GetMapping("/")
	public List<BookDto> list() {
		return bookDao.list();
	}

	@PostMapping("/")
	public BookDto insert(@RequestBody BookDto bookDto) {
		return bookDao.insert(bookDto);
	}

	@PutMapping("/")
	public BookDto update(@RequestBody BookDto bookDto) {
		return bookDao.update(bookDto);
	}

	@DeleteMapping("/{bookNo}")
	public void delete(@PathVariable int bookNo) {
		bookDao.delete(bookNo);
	}

	@GetMapping("/search/{query}")
	public List<BookDto> findStudent(@PathVariable String query) {
		return bookDao.search(query);
	}

}