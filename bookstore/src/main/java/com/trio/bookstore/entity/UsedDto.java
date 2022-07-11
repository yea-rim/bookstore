package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class UsedDto {
		private int usedNo;
		private int usedBookNo;
		private int usedPrice;
		private String usedStatus;
}
