package com.trio.bookstore.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.vo.BookVO;

@Service
public interface BookService {

//	ResponseEntity<BookVO> bookVO();

	ResponseEntity<BookVO> bookVO(@RequestParam(required = false) String query);

}
