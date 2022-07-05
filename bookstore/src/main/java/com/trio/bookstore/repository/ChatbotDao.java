package com.trio.bookstore.repository;

import java.util.List;

import com.trio.bookstore.entity.ChatbotDto;
import com.trio.bookstore.vo.ChatbotVO;


public interface ChatbotDao {
	List<ChatbotDto> getFirstMessages();
	List<ChatbotDto> getAnswer(int superNo);
	List<ChatbotVO> getFirstMessages2();
	List<ChatbotVO> getAnswer2(int superNo);
}