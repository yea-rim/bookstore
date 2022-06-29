package com.trio.bookstore.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BookItemsVO {

	private String title;
	private String link;
	private String image;
	private String author;
	private Integer price;
	private Integer discount;
	private String publisher;
	private String isbn;
	private String description;
	private Date pubdate;
}
