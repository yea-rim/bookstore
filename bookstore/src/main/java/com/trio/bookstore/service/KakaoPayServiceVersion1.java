package com.trio.bookstore.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.trio.bookstore.vo.KakaoPayApproveRequestVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class KakaoPayServiceVersion1 implements KakaoPayService {
	
	private String urlPrefix = "https://kapi.kakao.com/v1/payment";
	
	private RestTemplate template = new RestTemplate();
	
	private String authorization = "KakaoAK 278a38da40271710250b1054d8350ada";
	private String contentType = "application/x-www-form-urlencoded;charset=utf-8";
	
	private String cid = "TC0ONETIME";
	
	
	
	@Override
	public KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException {
		//머리
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", authorization);
		headers.add("Content-type", contentType);
		
		//몸
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		
		body.add("cid", cid);
		body.add("partner_order_id", requestVO.getPartner_order_id());
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotal_amount()));
		body.add("tax_free_amount", "0");
		
		String prefix = "http://localhost:8080/bookstore/pay";
		body.add("approval_url", prefix+"/approve");
		body.add("cancel_url", prefix+"/cancel");
		body.add("fail_url", prefix+"/fail");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
		
		URI uri = new URI(urlPrefix + "/ready");
		
		KakaoPayReadyResponseVO responseVO = 
				template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
		
		//테스트용 로그
		log.debug("tid = {}", responseVO.getTid());
		log.debug("partner_order_id = {}", requestVO.getPartner_order_id());
		log.debug("partner_user_id = {}", requestVO.getPartner_user_id());
		
		return responseVO;
	}

	@Override
	public KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException {
		//머리
				HttpHeaders headers = new HttpHeaders();
				headers.add("Authorization", authorization);
				headers.add("Content-type", contentType);
				
				MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
				body.add("cid", cid);
				body.add("tid", requestVO.getTid());
				body.add("partner_order_id", requestVO.getPartner_order_id());
				body.add("partner_user_id", requestVO.getPartner_user_id());
				body.add("pg_token", requestVO.getPg_token());
				
				HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
				
				URI uri = new URI(urlPrefix + "/approve");
				
				KakaoPayApproveResponseVO responseVO = 
							template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);
				return responseVO;
				
			}
		
}
