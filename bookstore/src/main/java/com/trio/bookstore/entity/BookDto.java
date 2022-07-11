package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookDto {

	private int bookNo;
	private String bookTitle;
	private String bookIsbn;
	private String bookImage;
	private String bookAuth;
	private String bookPubl;
	private String bookPub;
	private String bookDescription;
	private int bookType;

}