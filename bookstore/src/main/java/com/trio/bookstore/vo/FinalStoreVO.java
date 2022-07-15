package com.trio.bookstore.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class FinalStoreVO {
	private int storeBookNo;
	private int quantity = 1;
}
