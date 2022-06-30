package com.trio.bookstore.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayDto {
	private int payNo;
	private String payMemberId;
	private String payName;
	private int payTotal;
	private Date payTime;
	private String payTid;
	
}

