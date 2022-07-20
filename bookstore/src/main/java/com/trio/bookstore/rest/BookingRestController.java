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
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.repository2.BookDao;
import com.trio.bookstore.repository2.BookingDao;

import oracle.net.aso.b;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@RequestMapping("/rest/booking")
public class BookingRestController {

	@Autowired
	private BookingDao bookingDao;

	@GetMapping("/")
	public List<BookingDto> list() {
		return bookingDao.list();
	}

	@PostMapping("/")
	public BookingDto rental(@RequestBody BookingDto bookingDto) {
		return bookingDao.rental(bookingDto);
	}

	@PutMapping("/")
	public BookingDto extend(@RequestBody BookingDto bookingDto) {
		return bookingDao.extend(bookingDto);
	}

	@DeleteMapping("/{bookingNo}")
	public void bookReturn(@PathVariable int bookingNo) {
		bookingDao.bookReturn(bookingNo);
	}

}