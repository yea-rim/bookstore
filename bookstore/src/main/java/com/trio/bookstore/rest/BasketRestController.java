package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BasketDto;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.repository2.BasketDao;

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
	
//	@GetMapping("/")
//	public MemberDto findId(@PathVariable String memberId){
//		
//		return memberDao.findId(memberId);
//	}
}
