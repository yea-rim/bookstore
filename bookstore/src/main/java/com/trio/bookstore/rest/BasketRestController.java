package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BasketDto;
import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.repository2.BasketDao;

import lombok.extern.slf4j.Slf4j;

@CrossOrigin(
		origins = {"http://127.0.0.1:5500"}
//		,methods = {
//				RequestMethod.GET, RequestMethod.POST, 
//				RequestMethod.PUT, RequestMethod.DELETE
//		}
//		, maxAge = 3600L
)
@RestController
@RequestMapping("/rest/basket")
@Slf4j
public class BasketRestController {
	
	@Autowired
	private BasketDao basketDao;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@GetMapping("/{memberId}")
	public List<BasketDto> list(@PathVariable String memberId){
		return basketDao.list(memberId);
	}
	
	@DeleteMapping("/{basketNo}")
	public void delete(@PathVariable int basketNo) {
		basketDao.delete(basketNo);
	}
	//아이디로 장바구니 총가격 주기
	@GetMapping("/total/{memberId}")
	public int total(@PathVariable String memberId) {
		
		int total =	basketDao.total(memberId);
		log.debug("hans={}",total);
		return basketDao.total(memberId);
	}
	
	@GetMapping("/member/{query}")
	public MemberDto findId(@PathVariable String query){
		return memberDao.findId(query);
	}
}
