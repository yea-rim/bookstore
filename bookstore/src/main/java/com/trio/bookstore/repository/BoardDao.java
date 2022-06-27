package com.trio.bookstore.repository;

import java.util.List;

import com.trio.bookstore.entity.BoardDto;

public interface BoardDao {

	List<BoardDto> list(String type, String keyword, int page, int size);
	int count(String type, String keyword);
	
	BoardDto info(int boardNo);
	BoardDto read(int boardNo);
	
	boolean delete(int boardNo);
	boolean edit(BoardDto boardDto);
	
	int write(BoardDto boardDto);
}
