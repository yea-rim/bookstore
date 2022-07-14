package com.trio.bookstore.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties
public class LibResultVO {

	private String CODE;
	private String MESSAGE;

}