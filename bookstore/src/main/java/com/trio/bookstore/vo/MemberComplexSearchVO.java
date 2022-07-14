package com.trio.bookstore.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberComplexSearchVO {
	private String memberId;
	private String memberNick;
	private String memberEmail;
	private String memberPhone;
	private String beginBirth, endBirth;
	private String beginJoin, endJoin;
	private int minPoint, maxPoint;
	private List<String> memberGrade;
	private String column, order;
}
