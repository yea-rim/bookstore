package com.trio.bookstore.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trio.bookstore.vo.LibInfoVO;
import com.trio.bookstore.vo.LibVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LibInfoServiceImpl implements LibInfoService {

	private String key = "6a4e42514a73697335377672786e73";

	@Override
	public LibVO getLibVOData() throws URISyntaxException, JsonMappingException, JsonProcessingException {

		RestTemplate template = new RestTemplate();

		URI uri = new URI("http://openapi.seoul.go.kr:8088/" + key + "/json/SeoulPublicLibraryInfo/1/192");

		String text = template.getForObject(uri, String.class);

		ObjectMapper mapper = new ObjectMapper();

		LibVO responseVO = mapper.readValue(text, LibVO.class);
		log.debug("libVo = {}", responseVO);
		return responseVO;
	}

	@Override
	public ResponseEntity<LibInfoVO> libVO(@RequestParam(required = false) int number) throws URISyntaxException {
		RestTemplate template = new RestTemplate();

		URI uri = new URI("http://openapi.seoul.go.kr:8088/" + key + "/json/SeoulPublicLibraryInfo/1/1/" + number);

		ResponseEntity<LibInfoVO> responseVO = template.getForEntity(uri, LibInfoVO.class);
		log.debug("libVo = {}", responseVO);
		log.debug("uri = {}", uri);
		return responseVO;
	}
}