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
	private String payStatus;
	private String payDelivery;
	//조인해서 멤버 주소 넣음
	private String memberPost;
	private String memberBasicAddress;
	private String memberDetailAddress;

}

