package com.trio.bookstore.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties
public class LibVO {

	private int list_total_count;
	private LibResultVO RESULT;
	private LibInfoVO[] row;

}