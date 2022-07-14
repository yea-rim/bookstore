package com.trio.bookstore.service;

import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.trio.bookstore.vo.LVO;
import com.trio.bookstore.vo.LibInfoVO;

public interface LibInfoService {

	ResponseEntity<LVO> lVO(int number) throws URISyntaxException, JsonMappingException, JsonProcessingException;

}
