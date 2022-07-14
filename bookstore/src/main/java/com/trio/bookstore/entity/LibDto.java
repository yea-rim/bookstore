package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LibDto {
	private int libNo;
	private int libBookNo;
	private int libLibInfoNo;
	private int libAmount;
}