package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.LibDto;

public interface LibDao {

	List<LibDto> libList();

	LibDto insert(LibDto libDto);

	LibDto update(LibDto libDto);

	void delete(int libNo);

	List<LibDto> libSearch(int libLibInfoNo);

	List<LibDto> shSearch(int libNo);

}
