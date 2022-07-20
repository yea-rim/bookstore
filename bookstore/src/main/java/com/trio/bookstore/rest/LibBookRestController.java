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

import com.trio.bookstore.entity.LibDto;
import com.trio.bookstore.repository2.LibDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/lib-book")
public class LibBookRestController {

	@Autowired
	private LibDao libDao;

	@GetMapping("/")
	public List<LibDto> list() {
		return libDao.libList();
	}

	@PostMapping("/")
	public LibDto insert(@RequestBody LibDto libDto) {
		return libDao.insert(libDto);
	}

	@PutMapping("/")
	public LibDto update(@RequestBody LibDto libDto) {
		return libDao.update(libDto);
	}

	@DeleteMapping("/{libNo}")
	public void delete(@PathVariable int libNo) {
		libDao.delete(libNo);
	}

	@GetMapping("/{libNo}")
	public List<LibDto> libSearch(@PathVariable int libNo) {
		return libDao.libSearch(libNo);
	}
	
	@GetMapping("/sh/{libNo}")
	public List<LibDto> shSearch(@PathVariable int libNo) {
		return libDao.shSearch(libNo);
	}
	
	@GetMapping("/book/{libBookNo}")
	public List<LibDto> findBook(@PathVariable int libBookNo) {
		return libDao.findBook(libBookNo);
	}

}