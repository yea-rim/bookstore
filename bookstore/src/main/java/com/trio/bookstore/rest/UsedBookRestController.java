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
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository2.LibDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/used-book")
public class UsedBookRestController {

	@Autowired
	private UsedDao usedDao;

	@GetMapping("/")
	public List<UsedDto> list() {
		return usedDao.list1();
	}

	@PostMapping("/")
	public UsedDto insert(@RequestBody UsedDto storeDto) {
		return usedDao.insert(storeDto);
	}

	@PutMapping("/")
	public UsedDto update(@RequestBody UsedDto storeDto) {
		return usedDao.update(storeDto);
	}

	@DeleteMapping("/{storeBookNo}")
	public void delete(@PathVariable int storeBookNo) {
		usedDao.delete(storeBookNo);
	}

	@GetMapping("/{storeBookNo}")
	public UsedDto search(@PathVariable int storeBookNo) {
		return usedDao.search(storeBookNo);
	}
	
	

}