package com.trio.bookstore.service;

import java.net.URI;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.trio.bookstore.vo.BookVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookServiceImpl implements BookService {
	
	private String cliendId = "mnmg8WWCvso5cGGE5s8S";
	private String clientSecret = "v167ciI2ZR";
	
	@Override
	public ResponseEntity<BookVO> bookVO(@RequestParam(required = false) String query) {

			URI uri = UriComponentsBuilder
					.fromUriString("https://openapi.naver.com")
					.path("/v1/search/book.json")
					.queryParam("query", query)
					.encode()
					.build()
					.toUri();
			
			RestTemplate template = new RestTemplate();
			
			HttpHeaders header = new HttpHeaders();
			header.add("X-Naver-Client-Id", cliendId);
			header.add("X-Naver-Client-Secret", clientSecret);
			
			HttpEntity<String> entity = new HttpEntity<>("", header);
			
			ResponseEntity<BookVO> bookVO = template.exchange(uri, HttpMethod.GET, entity, BookVO.class);
			log.debug("bookVO = {}", bookVO);
			return bookVO;
			
	}
}