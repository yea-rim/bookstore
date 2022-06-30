package com.trio.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trio.bookstore.entity.BoardDto;
import com.trio.bookstore.entity.CertDto;
import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.error.CannotFindException;
import com.trio.bookstore.repository.BoardDao;
import com.trio.bookstore.repository.CertDao;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.service.EmailService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/list")
	public String list(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				@RequestParam(required = false, defaultValue = "1") int p,
				@RequestParam(required = false, defaultValue = "10") int s,
				Model model
			) {
		List<BoardDto> list = boardDao.list(type, keyword, p, s);
		model.addAttribute("list", list);
		
		boolean search = type != null && keyword != null;
		model.addAttribute("search", search);
		 
		int count = boardDao.count(type, keyword);
		int lastPage = (count + s - 1) / s;
		
		int blockSize = 10;//블록 크기
		int endBlock = (p + blockSize - 1) / blockSize * blockSize;
		int startBlock = endBlock - (blockSize - 1);
		if(endBlock > lastPage){
			endBlock = lastPage;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("s", s);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("lastPage", lastPage);
		
		return "board/list";
	}
	
	@GetMapping("/review_list")
	public String list1(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model
		) {
	List<BoardDto> list1 = boardDao.list1(type, keyword, p, s);
	model.addAttribute("list1", list1);
	
	boolean search = type != null && keyword != null;
	model.addAttribute("search", search);
	 
	int count1 = boardDao.count1(type, keyword);
	int lastPage = (count1 + s - 1) / s;
	
	int blockSize = 10;//블록 크기
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
	
	model.addAttribute("p", p);
	model.addAttribute("s", s);
	model.addAttribute("type", type);
	model.addAttribute("keyword", keyword);
	model.addAttribute("startBlock", startBlock);
	model.addAttribute("endBlock", endBlock);
	model.addAttribute("lastPage", lastPage);
	
		return "board/review_list";
	}
	
	@GetMapping("/notice_list")
	public String list2(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model
		) {
	List<BoardDto> list2 = boardDao.list2(type, keyword, p, s);
	model.addAttribute("list2", list2);
	
	boolean search = type != null && keyword != null;
	model.addAttribute("search", search);
	 
	int count2 = boardDao.count2(type, keyword);
	int lastPage = (count2 + s - 1) / s;
	
	int blockSize = 10;//블록 크기
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
	
	model.addAttribute("p", p);
	model.addAttribute("s", s);
	model.addAttribute("type", type);
	model.addAttribute("keyword", keyword);
	model.addAttribute("startBlock", startBlock);
	model.addAttribute("endBlock", endBlock);
	model.addAttribute("lastPage", lastPage);
	
		return "board/notice_list";
	}
	
	@GetMapping("/qna_list")
	public String list3(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "10") int s,
			Model model
		) {
	List<BoardDto> list3 = boardDao.list3(type, keyword, p, s);
	model.addAttribute("list3", list3);
	
	boolean search = type != null && keyword != null;
	model.addAttribute("search", search);
	 
	int count3 = boardDao.count3(type, keyword);
	int lastPage = (count3 + s - 1) / s;
	
	int blockSize = 10;//블록 크기
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
	
	model.addAttribute("p", p);
	model.addAttribute("s", s);
	model.addAttribute("type", type);
	model.addAttribute("keyword", keyword);
	model.addAttribute("startBlock", startBlock);
	model.addAttribute("endBlock", endBlock);
	model.addAttribute("lastPage", lastPage);
	
		return "board/qna_list";
	}
	
	
	
	
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int boardNo, Model model, HttpSession session) {
		BoardDto boardDto = boardDao.read(boardNo);
		model.addAttribute("boardDto", boardDto);
		
		//작성자 정보 조회
		//-> 탈퇴한 사용자인 경우 실행하지 않는다
		if(boardDto.getBoardWriter() != null) {
			MemberDto memberDto = memberDao.info(boardDto.getBoardWriter());
			model.addAttribute("memberDto", memberDto);
		}
		
		

		//내 글인지 판정
		String memberId = (String) session.getAttribute("login");
		boolean isLogin = memberId != null;
		boolean isOwner = isLogin && memberId.equals(boardDto.getBoardWriter());
		model.addAttribute("isLogin", isLogin);
		model.addAttribute("isOwner", isOwner);
		
		//관리자인지 판정
		String memberGrade = (String)session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);
		
		//현재 글에 대한 댓글 목록을 조회(미구현)
		
		return "board/detail";
	}
	
	@GetMapping("/detail/{boardNo}")
	public String detail2(@PathVariable int boardNo, Model model, HttpSession session) {
		BoardDto boardDto = boardDao.read(boardNo);
		model.addAttribute("boardDto", boardDto);
		
		//작성자 정보 조회
		//-> 탈퇴한 사용자인 경우 실행하지 않는다
		if(boardDto.getBoardWriter() != null) {
			MemberDto memberDto = memberDao.info(boardDto.getBoardWriter());
			model.addAttribute("memberDto", memberDto);
		}
		
		//내 글인지 판정
		String memberId = (String) session.getAttribute("login");
		boolean isLogin = memberId != null;
		boolean isOwner = isLogin && memberId.equals(boardDto.getBoardWriter());
		model.addAttribute("isLogin", isLogin);
		model.addAttribute("isOwner", isOwner);
		
		//관리자인지 판정
		String memberGrade = (String)session.getAttribute("auth");
		boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
		model.addAttribute("isAdmin", isAdmin);
		
		//현재 글에 대한 댓글 목록을 조회(미구현)
		
		return "board/detail";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int boardNo) {
		boolean success = boardDao.delete(boardNo);
		if(success) {
			return "redirect:list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/delete/{boardNo}")
	public String delete2(@PathVariable int boardNo) {
		boolean success = boardDao.delete(boardNo);
		if(success) {
//			return "redirect:../list";
			return "redirect:/board/list";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int boardNo, Model model) {
		BoardDto boardDto = boardDao.info(boardNo);
		model.addAttribute("boardDto", boardDto);
		return "board/edit";
	}
	
	@GetMapping("/edit/{boardNo}")
	public String edit2(@PathVariable int boardNo, Model model) {
		BoardDto boardDto = boardDao.info(boardNo);
		model.addAttribute("boardDto", boardDto);
		return "board/edit2"; 
	}
	
//	tip : 
//	RedirectAttributes를 매개변수에 선언하고 데이터를 Model 처럼 추가하면 파라미터 처리된다
	@PostMapping("/edit")
	public String edit(
			@ModelAttribute BoardDto boardDto, 
			HttpServletResponse response,
			RedirectAttributes attr) {
		boolean success = boardDao.edit(boardDto);
		if(success) {
//			return "redirect:detail?boardNo="+boardDto.getBoardNo(); 
			attr.addAttribute("boardNo", boardDto.getBoardNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@PostMapping("/edit/{boardNo}")
	public String edit2(
			@ModelAttribute BoardDto boardDto, 
			@PathVariable int boardNo,
			RedirectAttributes attr) {
		boardDto.setBoardNo(boardNo);
		boolean success = boardDao.edit(boardDto);
		if(success) {
//			return "redirect:detail?boardNo="+boardDto.getBoardNo(); 
			attr.addAttribute("boardNo", boardDto.getBoardNo());
			return "redirect:detail";
		}
		else {
			throw new CannotFindException();
		}
	}
	
	@GetMapping("/write")
	public String write(
			@RequestParam(required = false, defaultValue = "0") int sn,
			Model model) {
		if(sn > 0) {
			model.addAttribute("sn", sn);
		}
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute BoardDto boardDto,
									HttpSession session,
									RedirectAttributes attr) {

		String memberId = (String) session.getAttribute("login");
		boardDto.setBoardWriter(memberId);
		
		int boardNo = boardDao.write(boardDto);
		
		attr.addAttribute("boardNo", boardNo);
		return "redirect:detail";
	}
	@GetMapping("/review_write")
	public String write1(
			@RequestParam(required = false, defaultValue = "0") int sn,
			Model model) {
		if(sn > 0) {
			model.addAttribute("sn", sn);
		}
		return "board/review_write";
	}
	
	@PostMapping("/review_write")
	public String write1(@ModelAttribute BoardDto boardDto,
									HttpSession session,
									RedirectAttributes attr) {

		String memberId = (String) session.getAttribute("login");
		boardDto.setBoardWriter(memberId);
		
		int boardNo = boardDao.write(boardDto);
		
		attr.addAttribute("boardNo", boardNo);
		return "redirect:detail";
	}
	@GetMapping("/notice_write")
	public String write2(
			@RequestParam(required = false, defaultValue = "0") int sn,
			Model model) {
		if(sn > 0) {
			model.addAttribute("sn", sn);
		}
		return "board/notice_write";
	}
	
	@PostMapping("/notice_write")
	public String write2(@ModelAttribute BoardDto boardDto,
									HttpSession session,
									RedirectAttributes attr) {

		String memberId = (String) session.getAttribute("login");
		boardDto.setBoardWriter(memberId);
		
		int boardNo = boardDao.write(boardDto);
		
		attr.addAttribute("boardNo", boardNo);
		return "redirect:detail";
	}
	@GetMapping("/qna_write")
	public String write3(
			@RequestParam(required = false, defaultValue = "0") int sn,
			Model model) {
		if(sn > 0) {
			model.addAttribute("sn", sn);
		}
		return "board/qna_write";
	}
	
	@PostMapping("/qna_write")
	public String write3(@ModelAttribute BoardDto boardDto,
									HttpSession session,
									RedirectAttributes attr) {

		String memberId = (String) session.getAttribute("login");
		boardDto.setBoardWriter(memberId);
		
		int boardNo = boardDao.write(boardDto);
		
		attr.addAttribute("boardNo", boardNo);
		return "redirect:detail";
	}
	
}




