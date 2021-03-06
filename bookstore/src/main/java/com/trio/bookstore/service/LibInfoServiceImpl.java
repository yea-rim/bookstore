package com.trio.bookstore.service;

import java.net.URISyntaxException;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trio.bookstore.vo.LVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LibInfoServiceImpl implements LibInfoService {

	private String key = "6a4e42514a73697335377672786e73";

	@Override
	public ResponseEntity<LVO> lVO(@RequestParam(required = false) int number)
			throws URISyntaxException, JsonMappingException, JsonProcessingException {
		RestTemplate template = new RestTemplate();

		String uri = "http://openapi.seoul.go.kr:8088/" + key + "/json/SeoulPublicLibraryInfo/1/1/" + number;
		String text = template.getForObject(uri, String.class);
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_PROPERTIES, true);

		LVO origin = mapper.readValue(text, LVO.class);
		log.debug("LVO = {}", origin);
		return ResponseEntity.ok().body(origin);
	}
}