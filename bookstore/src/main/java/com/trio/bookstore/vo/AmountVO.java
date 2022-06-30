package com.trio.bookstore.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class AmountVO {
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;
	
}
