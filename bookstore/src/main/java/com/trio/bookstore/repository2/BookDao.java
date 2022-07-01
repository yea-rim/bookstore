package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BookDto;

public interface BookDao {

	List<BookDto> list();

	BookDto insert(BookDto bookDto);

	BookDto update(BookDto bookDto);

	void delete(int bookNo);

	List<BookDto> search(String query);

}
