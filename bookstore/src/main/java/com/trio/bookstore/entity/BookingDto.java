package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingDto {

	private int bookingNo;
	private String bookingId;
	private int bookingBookNo;
	private String bookingDate;
	private String bookingLibrary;

}