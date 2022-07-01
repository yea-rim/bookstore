package com.trio.bookstore.service;

import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.trio.bookstore.vo.LibVO;

@Service
public interface LibInfoService {

	LibVO getLibVOData() throws URISyntaxException, JsonMappingException, JsonProcessingException;
	
//	ResponseEntity<LibVO> libVO(@RequestParam(required = false) String query);
}
