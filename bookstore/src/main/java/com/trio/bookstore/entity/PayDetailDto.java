package com.trio.bookstore.entity;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayDetailDto {
	private int payDetailNo;
	private int payNo;
	private int payDetailBookNo;
	private String payDetailMemberId;
	private String payDetailName;
	private int payDetailQuantity;
	private int payDetailPrice;
}
