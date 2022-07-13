package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.vo.LibBookVO;

public interface BookDao {

	List<BookDto> list();
	List<LibBookVO> libList();

	BookDto insert(BookDto bookDto);
	LibBookVO insert(LibBookVO libBookVO);

	BookDto update(BookDto bookDto);
	LibBookVO update(LibBookVO libBookVO);

	void delete(int bookNo);
	void libDelete(int libBookNo);

	List<BookDto> search(String query);
	List<LibBookVO> libSearch(int libBookNo);

	// 한석
	// - 도서 목록 조회(페이지네이션 포함) 나중에 조회 검색구문 여러가지 해야함
	List<BookDto> list(String type, String keyword, int page, int size);

	int count(String type, String keyword);

	BookDto find(int bookNo);

}