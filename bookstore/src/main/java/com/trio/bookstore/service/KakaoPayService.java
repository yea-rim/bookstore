package com.trio.bookstore.service;

import java.net.URISyntaxException;

import com.trio.bookstore.vo.KakaoPayApproveRequestVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
		KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
		KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
		
}
