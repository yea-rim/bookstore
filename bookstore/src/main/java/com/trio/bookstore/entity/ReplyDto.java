package com.trio.bookstore.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyDto {
	private int replyNo;
	private String replyContent;
	private int replyTarget;
	private Date replyTime;
}
