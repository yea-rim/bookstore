package com.trio.bookstore.vo;

import java.util.List;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayListVO {
	private PayDto payDto;
	private List<PayDetailDto> payDetailList;
	
}
