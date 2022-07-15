package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UsedDto {

	private int usedNo;
	private int usedBookNo;
	private int usedPrice;
	private String usedStatus;

	// 이너조인 사용시 도서테이블의 도서명도 넣기위해 코드짬
	private String bookTitle;
	private String bookImage;
}
