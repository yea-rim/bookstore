package com.trio.bookstore.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.entity.BookingDto;
import com.trio.bookstore.entity.BookingReturnDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.repository2.BookDao;
import com.trio.bookstore.repository2.BookingDao;
import com.trio.bookstore.repository2.BookingReturnDao;

import oracle.net.aso.b;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/booking-return")
public class BookingReturnRestController {

	@Autowired
	private BookingReturnDao bookingReturnDao;

	@GetMapping("/")
	public List<BookingReturnDto> list() {
		return bookingReturnDao.list();
	}

	@PostMapping("/")
	public BookingReturnDto rental(@RequestBody BookingReturnDto bookingReturnDto) {
		return bookingReturnDao.bookReturn(bookingReturnDto);
	}

}