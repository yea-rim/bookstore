package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BookingDto;
import com.trio.bookstore.entity.BookingReturnDto;

public interface BookingReturnDao {

	List<BookingReturnDto> list();

	// 추가
	BookingReturnDto bookReturn(BookingReturnDto bookingReturnDto);

}