package com.trio.bookstore.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class FinalUsedVO {
		private int usedNo;
		private int quantity = 1;
}
