package com.trio.bookstore.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository2.BookDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;

@RequestMapping("/book")
@Controller
public class BookController {
	
	@Autowired
	private UsedDao usedDao;
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private StoreDao storeDao;
	//도서목록 페이지
	@RequestMapping("/list")
	public String list(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "10") int size,
			Model model) {
		
		List<BookDto> list = bookDao.list(type,keyword,page,size);
		model.addAttribute("list",list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search",search);
		
		int count = bookDao.count(type,keyword);
		int lastPage = (count + size - 1) / size;
		
		int blockSize = 10;
		int endBlock = (page + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if(endBlock > lastPage) {
			endBlock = lastPage;
		}
		
		model.addAttribute("page",page);
		model.addAttribute("size",size);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);
		
		
		
		return "book/list";  
	}
	
	@GetMapping("/detail")
	public String detail(
		@RequestParam int bookNo,
		Model model) {
		
		
		//도서테이블 가져오기
		//도서번호에 맞는 쇼핑몰테이블 데이터 불러오기
		StoreDto storeDto = storeDao.find(bookNo);
		model.addAttribute("storeDto",storeDto);
		
		//도서번호에 맞는 중고테이블 목록 데이터 불러오기
		List<UsedDto> usedList = usedDao.list(bookNo);
		model.addAttribute("usedList",usedList);
		
		//도서번호에 맞는 중고 데이터중 가장 싼 값 불러오기
		UsedDto usedCheap = usedDao.find(bookNo);
		model.addAttribute("usedCheap",usedCheap);
		  
		//도서번호에 맞는 도서테이블 데이터 불러오기
		BookDto bookDto = bookDao.find(bookNo);
		model.addAttribute("bookDto",bookDto);
		return "book/detail";
		
	}
}
