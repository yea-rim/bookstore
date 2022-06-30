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
public class BookVO {

	private Date lastBuildDate;
	private Integer total;
	private Integer start;
	private Integer display;
	private BookItemsVO[] items;

}
