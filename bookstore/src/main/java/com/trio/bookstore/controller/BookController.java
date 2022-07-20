package com.trio.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.repository2.BookDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book")
@Controller
public class BookController {

	@Autowired
	private UsedDao usedDao;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BookDao bookDao;

	@Autowired
	private StoreDao storeDao;
	  
	// 도서목록 페이지
	@RequestMapping("/list")
	public String list(@RequestParam(required = false) String type, 
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false, defaultValue = "1") int page,
					@RequestParam(required = false, defaultValue = "10") int size,
					Model model,HttpSession session) {
	
		
		List<BookDto> list = bookDao.list(type, keyword, page, size);
		model.addAttribute("list", list);

		//페이지쪽 데이터 생성하는것
		//type keyword 있을때에 조건문이니 typeNumber1,2있을떄 에 조건도 보내는 거 맞지않을까?
		//if문으로 해서 해볼까?
		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);
		
		int count = bookDao.count(type, keyword);
		int lastPage = (count + size - 1) / size;

		int blockSize = 10;
		int endBlock = (page + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if (endBlock > lastPage) {
			endBlock = lastPage;
		}

		model.addAttribute("count",count);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);

		
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		boolean isBookAdmin = memberGrade != null && memberGrade.equals("도서관리자");
		boolean isUser = memberGrade != null && memberGrade.equals("일반회원");
		model.addAttribute("isAdmin", isAdmin);
		model.addAttribute("isBookAdmin", isBookAdmin);
		model.addAttribute("isUser", isUser);
		return "book/list";
	}

		//도서목록 페이지(대분류 가져오기)
				@RequestMapping("/list1")
				public String list2( 
								@RequestParam(required = false, defaultValue = "1") int page,
								@RequestParam(required = false, defaultValue = "10") int size,
								@RequestParam(required = false, defaultValue = "0") int typeNumber1,
								@RequestParam(required = false, defaultValue = "0") int typeNumber2,
								Model model) {
				
					
//					List<BookDto> list = bookDao.list(type, keyword, page, size);
					List<BookDto> list = bookDao.list(typeNumber1,typeNumber2,page,size);
					model.addAttribute("list", list);

					//typeNumber1,2가 있다는조건문
					boolean search = typeNumber1 > 0 && typeNumber2 > 0;
					model.addAttribute("search", search);
					
					int count = bookDao.count(typeNumber1, typeNumber2);
					int lastPage = (count + size - 1) / size;

					int blockSize = 10;
					int endBlock = (page + blockSize - 1) / blockSize * blockSize;
					int startBlock = endBlock - (blockSize - 1);
					if (endBlock > lastPage) {
						endBlock = lastPage;
					}

					

					model.addAttribute("count",count);
					model.addAttribute("page", page);
					model.addAttribute("size", size);
					model.addAttribute("typeNumber1", typeNumber1);
					model.addAttribute("typeNumber2", typeNumber2);
					model.addAttribute("startBlock", startBlock);
					model.addAttribute("endBlock", endBlock);
					model.addAttribute("lastPage", lastPage);

					return "book/list2";
				}
				
				//도서목록 페이지(도서분류로 조회할때-소분류)
				@RequestMapping("/list2")
				public String list1( 
								@RequestParam(required = false, defaultValue = "1") int page,
								@RequestParam(required = false, defaultValue = "10") int size,
								@RequestParam(required = false, defaultValue = "0") int typeNumber1,
								Model model) {
				
					
//					List<BookDto> list = bookDao.list(type, keyword, page, size);
					List<BookDto> list = bookDao.list(typeNumber1,page,size);
					model.addAttribute("list", list);

					//typeNumber1 있다는조건문
					boolean search = typeNumber1 > 0 ;
					model.addAttribute("search", search);
					
					int count = bookDao.count(typeNumber1);
					int lastPage = (count + size - 1) / size;

					int blockSize = 10;
					int endBlock = (page + blockSize - 1) / blockSize * blockSize;
					int startBlock = endBlock - (blockSize - 1);
					if (endBlock > lastPage) {
						endBlock = lastPage;
					}


					model.addAttribute("count",count);
					model.addAttribute("page", page);
					model.addAttribute("size", size);
					model.addAttribute("typeNumber1", typeNumber1);
					model.addAttribute("startBlock", startBlock);
					model.addAttribute("endBlock", endBlock);
					model.addAttribute("lastPage", lastPage);

					return "book/list3";
				}
	@GetMapping("/detail")
	public String detail(@RequestParam int bookNo, Model model,HttpSession session) {

		// 도서테이블 가져오기
		// 도서번호에 맞는 쇼핑몰테이블 데이터 불러오기
		StoreDto storeDto = storeDao.find(bookNo);
		model.addAttribute("storeDto", storeDto);

		// 도서번호에 맞는 중고테이블 목록 데이터 불러오기
		List<UsedDto> usedList = usedDao.list(bookNo);
		model.addAttribute("usedList", usedList);

		// 도서번호에 맞는 중고 데이터중 가장 싼 값 불러오기
		UsedDto usedCheap = usedDao.find(bookNo);
		model.addAttribute("usedCheap", usedCheap);

		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		boolean isBookAdmin = memberGrade != null && memberGrade.equals("도서관리자");
		boolean isUser = memberGrade != null && memberGrade.equals("일반회원");
		model.addAttribute("isAdmin", isAdmin);
		model.addAttribute("isBookAdmin", isBookAdmin);
		model.addAttribute("isUser", isUser);
		
		// 도서번호에 맞는 도서테이블 데이터 불러오기
		BookDto bookDto = bookDao.find(bookNo);
		model.addAttribute("bookDto", bookDto);
		return "book/detail";
		
	}
}
