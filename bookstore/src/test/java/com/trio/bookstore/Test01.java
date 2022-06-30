package com.trio.bookstore;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.trio.bookstore.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class Test01 {

	@Test
	public void test() throws URISyntaxException {
		//RestTemplate을 이용해서 서버끼리의 통신 요청을 수행한다
		RestTemplate template = new RestTemplate();
		
		//정보에는 Header와 Body가 존재한다(POST방식)
		HttpHeaders headers = new HttpHeaders();
		//headers.add("이름", "값");
		headers.add("Authorization", "KakaoAK 278a38da40271710250b1054d8350ada");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		//body.add("이름", "값");
		body.add("cid", "TC0ONETIME");
		body.add("partner_order_id", UUID.randomUUID().toString());//임시로 랜덤 시리얼 번호 사용
		body.add("partner_user_id", "testuser1");
		body.add("item_name", "인플레이션에서 살아남기");
		body.add("quantity", "1");
		body.add("total_amount", "99900");
		body.add("tax_free_amount", "0");//무조건 0원
		
		//반드시 등록된 주소로 시작해야 함(카카오 개발자센터 -> 플랫폼 확인)
		body.add("approval_url", "http://localhost:8080/bookstore/pay/approve");
		body.add("cancel_url", "http://localhost:8080/bookstore/pay/cancel");
		body.add("fail_url", "http://localhost:8080/bookstore/pay/fail");
		
		//만들어진 header와 body를 하나로 만든다
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		
		//만들어진 요청객체를 전송하여 원하는 결과를 얻어낸다
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		template.postForLocation(uri, entity);
		
		
	}
	
}
	