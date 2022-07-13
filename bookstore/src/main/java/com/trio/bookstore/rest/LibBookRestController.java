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

import com.trio.bookstore.repository2.BookDao;
import com.trio.bookstore.vo.LibBookVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/lib-book")
public class LibBookRestController {

	@Autowired
	private BookDao bookDao;

	@GetMapping("/")
	public List<LibBookVO> list() {
		return bookDao.libList();
	}

	@PostMapping("/")
	public LibBookVO insert(@RequestBody LibBookVO libBookVO) {
		return bookDao.insert(libBookVO);
	}

	@PutMapping("/")
	public LibBookVO update(@RequestBody LibBookVO libBookVO) {
		return bookDao.update(libBookVO);
	}

	@DeleteMapping("/{libBookNo}")
	public void libDelete(@PathVariable int libBookNo) {
		bookDao.libDelete(libBookNo);
	}

	@GetMapping("/{libBookNo}")
	public List<LibBookVO> libSearch(@PathVariable int libBookNo) {
		return bookDao.libSearch(libBookNo);
	}

}