package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BookingDto;

public interface BookingDao {

	List<BookingDto> list();

	// 추가
	BookingDto rental(BookingDto bookingDto);

	// 삭제
	void bookReturn(int bookingNo);

	// 업데이트
	BookingDto extend(BookingDto bookingDto);

}