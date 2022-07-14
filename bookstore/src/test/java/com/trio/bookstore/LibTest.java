package com.trio.bookstore;

import java.net.URI;
import java.net.URISyntaxException;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trio.bookstore.vo.LVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebAppConfiguration
public class LibTest {

//	@Test
	public void naver() {
		String number = "1066";

		URI uri = UriComponentsBuilder.fromUriString("http://openapi.seoul.go.kr:8088")
				.path("/6a4e42514a73697335377672786e73/json/SeoulPublicLibraryInfo/1/1/").queryParam(number).encode()
				.build().toUri();

		RestTemplate template = new RestTemplate();

		HttpHeaders header = new HttpHeaders();

		HttpEntity<String> entity = new HttpEntity<>("", header);

		ResponseEntity<LVO> result = template.exchange(uri, HttpMethod.GET, entity, LVO.class);
		log.info("result = {}", result);
	}

//	@Test
	public void libVO() throws URISyntaxException {

		int number = 1066;

		RestTemplate template = new RestTemplate();

		URI uri = new URI(
				"http://openapi.seoul.go.kr:8088/6a4e42514a73697335377672786e73/json/SeoulPublicLibraryInfo/1/1/"
						+ number);

		ResponseEntity<LVO> responseVO = template.getForEntity(uri, LVO.class);
		log.debug("LVo = {}", responseVO);
		log.debug("uri = {}", uri);
	}

	@Test // 제대로 돌아가는 거
	public void lVO() throws JsonMappingException, JsonProcessingException {
		int number = 1066;
		RestTemplate template = new RestTemplate();

		String uri = "http://openapi.seoul.go.kr:8088/6a4e42514a73697335377672786e73/json/SeoulPublicLibraryInfo/1/1/"
				+ number;
		String text = template.getForObject(uri, String.class);
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);

		LVO origin = mapper.readValue(text, LVO.class);
		log.debug("LVO = {}", origin);
	}
}
