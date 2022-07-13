package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
	private String payDetailStatus;
	
	public int getPayTotal() {
		return this.payDetailPrice * this.payDetailQuantity;
	}
}
