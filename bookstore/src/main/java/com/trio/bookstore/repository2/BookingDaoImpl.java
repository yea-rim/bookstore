package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.trio.bookstore.entity.BookingDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BookingDto> list() {
		return sqlSession.selectList("booking.list");
	}

	@Override
	public BookingDto rental(BookingDto bookingDto) {
		int sequence = sqlSession.selectOne("booking.sequence");
		bookingDto.setBookingNo(sequence);
		sqlSession.insert("booking.rental", bookingDto);
		sqlSession.update("lib.rental", bookingDto.getBookingBookNo());
		return bookingDto;
	}

	@Override
	public void bookReturn(int bookingNo) {
		sqlSession.delete("booking.return", bookingNo);
	}

	@Override
	public BookingDto extend(BookingDto bookingDto) {
		int count = sqlSession.update("booking.extend", bookingDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("booking.one", bookingDto.getBookingNo());
	}
	

	@Override
	public List<BookingDto> hanList(String memberId) {
		return sqlSession.selectList("booking.han1",memberId);
	}
}
