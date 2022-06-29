package com.trio.bookstore.service;

import java.net.URI;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.trio.bookstore.vo.BookVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookServiceImpl implements BookService {

	@Override
	public ResponseEntity<BookVO> bookVO() {
		
		String query = "9791190977661";
		
		URI uri = UriComponentsBuilder
				.fromUriString("https://openapi.naver.com")
				.path("/v1/search/book.json")
				.queryParam("query", query)
				.encode()
				.build()
				.toUri();
		
		RestTemplate template = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("X-Naver-Client-Id", "mnmg8WWCvso5cGGE5s8S");
		header.add("X-Naver-Client-Secret", "v167ciI2ZR");
		
		HttpEntity<String> entity = new HttpEntity<>("", header);
		
		ResponseEntity<BookVO> result = template.exchange(uri, HttpMethod.GET, entity, BookVO.class);
		log.debug("result = {}", result);
		return result;
	}
}