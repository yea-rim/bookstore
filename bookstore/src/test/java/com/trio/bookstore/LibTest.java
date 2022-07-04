package com.trio.bookstore;

import java.net.URI;
import java.net.URISyntaxException;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.trio.bookstore.vo.BookVO;
import com.trio.bookstore.vo.LVO;
import com.trio.bookstore.vo.LibInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebAppConfiguration
public class LibTest {

//	@Test
	public void naver() {
		String number = "1066";
		
		URI uri = UriComponentsBuilder
				.fromUriString("http://openapi.seoul.go.kr:8088")
				.path("/6a4e42514a73697335377672786e73/json/SeoulPublicLibraryInfo/1/1/")
				.queryParam(number)
				.encode()
				.build()
				.toUri();
		
		RestTemplate template = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		
		HttpEntity<String> entity = new HttpEntity<>("", header);
		
		ResponseEntity<LVO> result = template.exchange(uri, HttpMethod.GET, entity, LVO.class);
		log.info("result = {}", result);
	}
	
	@Test
	public void libVO() throws URISyntaxException {

		int number = 1066;
		
		RestTemplate template = new RestTemplate();

		URI uri = new URI("http://openapi.seoul.go.kr:8088/6a4e42514a73697335377672786e73/json/SeoulPublicLibraryInfo/1/1/" + number);

		ResponseEntity<LVO> responseVO = template.getForEntity(uri, LVO.class);
		log.debug("LVo = {}", responseVO);
		log.debug("uri = {}", uri);
	}
}


