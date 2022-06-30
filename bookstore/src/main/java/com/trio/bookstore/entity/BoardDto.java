package com.trio.bookstore.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardDto {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardTime;
	private int boardReadcount;
	private String boardWriter;
	private String boardHead;
}
