package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BasketDto;
import com.trio.bookstore.repository2.BasketDao;

@RestController
@RequestMapping("/rest/basket")
public class BasketRestController {
	
	@Autowired
	private BasketDao basketDao;
	
	@GetMapping("/")
	public List<BasketDto> list(){
		return basketDao.list();
	}
	@DeleteMapping("/{basketNo}")
	public void delete(@PathVariable int basketNo) {
		basketDao.delete(basketNo);
	}
}
