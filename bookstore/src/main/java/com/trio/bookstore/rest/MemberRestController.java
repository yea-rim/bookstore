package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.repository.MemberDao;
import com.trio.bookstore.vo.MemberComplexSearchVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;

	@GetMapping("/")
	public List<MemberDto> list() {
		return memberDao.allList();
	}

//	@PostMapping("/")
//	public MemberDto insert(@RequestBody MemberDto memberDto) {
//		return memberDao.insert(memberDto);
//	}

	@PutMapping("/")
	public MemberDto update(@RequestBody MemberDto memberDto) {
		return memberDao.update(memberDto);
	}

//	@DeleteMapping("/{memberId}")
//	public void delete(@PathVariable String memberId) {
//		memberDao.delete(memberId);
//	}

	@GetMapping("/search/{vo}")
	public List<MemberDto> complexSearch(@PathVariable MemberComplexSearchVO vo) {
		return memberDao.complexSearch(vo);
	}

}