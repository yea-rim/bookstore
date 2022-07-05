package com.trio.bookstore.service;

import java.net.URISyntaxException;

import com.trio.bookstore.vo.KakaoPayApproveRequestVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.KakaoPayCancelRequestVO;
import com.trio.bookstore.vo.KakaoPayCancelResponseVO;
import com.trio.bookstore.vo.KakaoPayOrderRequestVO;
import com.trio.bookstore.vo.KakaoPayOrderResponseVO;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;

public interface KakaoPayService {
		KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
		KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
		KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVO)  throws URISyntaxException;
		KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException;

}
