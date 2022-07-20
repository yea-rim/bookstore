package com.trio.bookstore.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StorePayVO {
	private int storeNo;
	private int quantity = 1;
	
}
