package com.trio.bookstore.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayCancelRequestVO {

	private String tid;
	private int cancel_amount;
	
}
