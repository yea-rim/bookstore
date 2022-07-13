package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StoreDto {
	private int storeBookNo;
	private int storePrice;
	private int storeAmount;
	// 이너조인 사용시 도서테이블의 도서명도 넣기위해 코드짬
	private String bookTitle;
}
