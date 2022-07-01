package com.trio.bookstore.rest;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.entity.LibInfoDto;
import com.trio.bookstore.repository2.LibInfoDao;
import com.trio.bookstore.service.LibInfoService;
import com.trio.bookstore.vo.LibInfoVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/lib")
public class LibRestController {

	@Autowired
	private LibInfoService libInfoService;

	@Autowired
	private LibInfoDao libInfoDao;

	@GetMapping("/")
	public List<LibInfoDto> list() {
		return libInfoDao.list();
	}

	@PostMapping("/")
	public LibInfoDto insert(@RequestBody LibInfoDto libInfoDto) {
		return libInfoDao.insert(libInfoDto);
	}

	@PutMapping("/")
	public LibInfoDto update(@RequestBody LibInfoDto libInfoDto) {
		return libInfoDao.update(libInfoDto);
	}

	@DeleteMapping("/{libInfoNo}")
	public void delete(@PathVariable int libInfoNo) {
		libInfoDao.delete(libInfoNo);
	}

	@GetMapping("/gu/{libInfoGu}")
	public List<BookDto> findStudent(@PathVariable int libInfoGu) {
		return libInfoDao.findGu(libInfoGu);
	}

	@GetMapping("/api/{number}")
	public LibInfoVO bookVO(@RequestParam(required = false) int number) throws URISyntaxException {
		System.out.println("검색어 = " + number);
		return libInfoService.libVO(number).getBody();
	}
}