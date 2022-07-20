package com.trio.bookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingReturnDto {

	private String bookingReturnId;
	private int bookingReturnBookNo;
	private String bookingReturnDate;
	private String bookingReturnLibrary;
	private String bookingReturnBookTitle;

}