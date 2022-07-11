package com.trio.bookstore.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.MemberDto;

public interface MemberService {
	void join(MemberDto memberDto, MultipartFile memberProfile) throws IllegalStateException, IOException;

	public int idCheck(String memberId);
}

