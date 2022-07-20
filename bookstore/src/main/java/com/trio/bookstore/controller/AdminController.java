package com.trio.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.entity.BoardDto;
import com.trio.bookstore.entity.MemberDto;
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
	@GetMapping("/book")
	public String book(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/book";
	}
	
	@RequestMapping("/lib-book")
	public String libBook() {
		return "admin/lib-book";
	}
	@GetMapping("/lib-book")
	public String libBook(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);
		boolean isBookAdmin = memberGrade != null && memberGrade.equals("도서관리자");
		model.addAttribute("isBookAdmin", isBookAdmin);
		boolean isUser = memberGrade != null && memberGrade.equals("일반회원");
		model.addAttribute("isUser", isUser);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/lib-book";
	}
	
	@RequestMapping("/store-book")
	public String storeBook() {
		return "admin/store-book";
	}
	@GetMapping("/store-book")
	public String storeBook(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/store-book";
	}
	@RequestMapping("/used-book")
	public String usedBook() {
		return "admin/used-book";
	}
	@GetMapping("/used-book")
	public String usedBook(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/used-book";
	}
	@RequestMapping("/lib")
	public String lib() {
		return "admin/lib";
	}
	@GetMapping("/lib")
	public String lib(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);
		boolean isBookAdmin = memberGrade != null && memberGrade.equals("도서관리자");
		model.addAttribute("isBookAdmin", isBookAdmin);
		boolean isUser = memberGrade != null && memberGrade.equals("일반회원");
		model.addAttribute("isUser", isUser);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/lib";
	}
	@RequestMapping("/member")
	public String member() {
		return "admin/member";
	}
	@GetMapping("/member")
	public String member(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/member";
	}
	@RequestMapping("/delivery")
	public String delivery() {
		return "admin/delivery";
	}
	@GetMapping("/delivery")
	public String delivery(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

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
	
	@RequestMapping("/return")
	public String re() {
		return "admin/return";
	}
	
	@RequestMapping("/imformation")
	public String imformation() {
		return "admin/imformation";
	}
	
	@GetMapping("/information")
	public String information(@PathVariable String memberId, Model model) {
		MemberDto memberDto = memberDao.info(memberId);
		model.addAttribute("memberDto", memberDto);
		return "admin/information";
	}
	
	@PostMapping("/information")
	public String information(@PathVariable String memberId, @ModelAttribute MemberDto memberDto) {
		memberDto.setMemberId(memberId);
		return "admin/information";
	}
	
	@GetMapping("/faq")
	public String faq(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

		return "admin/faq";
	}

	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice";
	}
	@GetMapping("/notice")
	public String notice(Model model, HttpSession session) {

		// 관리자인지 판정
		String memberGrade = (String) session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);

		// 현재 글에 대한 댓글 목록을 조회(미구현)

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