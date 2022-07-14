package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BookDto;

public interface BookDao {

	List<BookDto> list();

	BookDto insert(BookDto bookDto);

	BookDto update(BookDto bookDto);

	void delete(int bookNo);

	List<BookDto> search(String query);

	// 한석
	// - 도서 목록 조회(페이지네이션 포함) 나중에 조회 검색구문 여러가지 해야함
	List<BookDto> list(String type, String keyword, int page, int size);

	int count(String type, String keyword);

	BookDto find(int bookNo);

	BookDto bookSearch(int bookNo);

}