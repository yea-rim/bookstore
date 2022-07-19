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
	//type,keyword
	int count(String type, String keyword);
	//도서 분류범위로 나오는 칼럼개수
	int count(int typeNumber1, int typeNumber2);

	BookDto find(int bookNo);

	BookDto bookSearch(int bookNo);

	List<BookDto> bookType(int bookType);
	//-도서 목록 조회(도서 분류로만 조회할때- 대분류 10단위로)
	List<BookDto> list(int typeNumber1, int typeNumber2,int page,int size);
	//-도서 목록 조회(소분류)
	List<BookDto> list(int typeNumber1, int page, int size);


}