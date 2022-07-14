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
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.repository2.LibDao;
import com.trio.bookstore.repository2.StoreDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/store-book")
public class StoreBookRestController {

	@Autowired
	private StoreDao storeDao;

	@GetMapping("/")
	public List<StoreDto> list() {
		return storeDao.list();
	}

	@PostMapping("/")
	public StoreDto insert(@RequestBody StoreDto storeDto) {
		return storeDao.insert(storeDto);
	}

	@PutMapping("/")
	public StoreDto update(@RequestBody StoreDto storeDto) {
		return storeDao.update(storeDto);
	}

	@DeleteMapping("/{storeBookNo}")
	public void delete(@PathVariable int storeBookNo) {
		storeDao.delete(storeBookNo);
	}

	@GetMapping("/{storeBookNo}")
	public StoreDto search(@PathVariable int storeBookNo) {
		return storeDao.search(storeBookNo);
	}

}