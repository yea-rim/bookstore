package com.trio.bookstore.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.trio.bookstore.entity.BoardDto;
import com.trio.bookstore.repository.AttachmentDao;
import com.trio.bookstore.repository.BoardAttachmentDao;
import com.trio.bookstore.repository.BoardDao;

@Service
public class BoardServicelmpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private BoardAttachmentDao boardAttachmentDao;
	
	@Transactional
	@Override
	public void write(BoardDto boardDto, MultipartFile boardAttachment) throws IllegalStateException, IOException {
		boardDao.write(boardDto);
		//프로필 등록 코드 추가(실제 저장 + DB 처리) - Attachment , MemberProfile 테이블
		if(!boardAttachment.isEmpty()) {
			int attachmentNo = attachmentDao.save(boardAttachment);
			boardAttachmentDao.insert(boardDto.getBoardNo(), attachmentNo);
		}
	}

	

	}
	
