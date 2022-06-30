package com.trio.bookstore.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.trio.bookstore.vo.BookVO;

public interface BookService {

	ResponseEntity<BookVO> bookVO();

}
