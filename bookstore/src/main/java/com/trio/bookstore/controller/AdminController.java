package com.trio.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.entity.BoardDto;
import com.trio.bookstore.repository.BoardDao;
import com.trio.bookstore.repository.MemberDao;

@CrossOrigin
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BoardDao boardDao;

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/")
	public String index() {
		return "admin/main";
	}

	@RequestMapping("/book")
	public String book() {
		return "admin/book";
	}

	@RequestMapping("/lib")
	public String lib() {
		return "admin/lib";
	}

	@RequestMapping("/member")
	public String member() {
		return "admin/member";
	}

	@RequestMapping("/delivery")
	public String delivery() {
		return "admin/delivery";
	}

	@RequestMapping("/question")
	public String question() {
		return "admin/question";
	}

	@RequestMapping("/faq")
	public String faq() {
		return "admin/faq";
	}

	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice";
	}
	
	@GetMapping("/question")
	public String list(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s, Model model) {
		List<BoardDto> list = boardDao.list(type, keyword, p, s);
		model.addAttribute("list", list);

		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);

		int count = boardDao.count(type, keyword);
		int lastPage = (count + s - 1) / s;

		int blockSize = 10;// 블록 크기
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if (endBlock > lastPage) {
			endBlock = lastPage;
		}

		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);

		return "admin/question";
	}
}