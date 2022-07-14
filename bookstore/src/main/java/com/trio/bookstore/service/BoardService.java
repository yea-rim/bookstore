package com.trio.bookstore.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.BoardDto;

public interface BoardService {
	void write(BoardDto boardDto, MultipartFile BoardAttachment) throws IllegalStateException, IOException;
}

