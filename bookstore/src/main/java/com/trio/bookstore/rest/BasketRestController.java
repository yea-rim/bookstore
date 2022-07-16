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
	
	// 한석님 굿
	
	@Autowired
	private BasketDao basketDao;
	
	@GetMapping("/")
	public List<BasketDto> list(){
		return basketDao.list();
	}
	
	@GetMapping("/used")
	public List<BasketDto> usedList(){
		return basketDao.usedList();
	}
	
	@GetMapping("/shop")
	public List<BasketDto> shopList(){
		return basketDao.shopList();
	}
	
	@DeleteMapping("/{basketNo}")
	public void delete(@PathVariable int basketNo) {
		basketDao.delete(basketNo);
	}
}
