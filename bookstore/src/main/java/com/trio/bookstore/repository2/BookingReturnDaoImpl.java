package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.trio.bookstore.entity.BookingDto;
import com.trio.bookstore.entity.BookingReturnDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class BookingReturnDaoImpl implements BookingReturnDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BookingReturnDto> list() {
		return sqlSession.selectList("bookingReturn.list");
	}

	@Override
	public BookingReturnDto bookReturn(BookingReturnDto bookingReturnDto) {
		sqlSession.insert("bookingReturn.rental", bookingReturnDto);
		return bookingReturnDto;
	}
	@Override
	public List<BookingReturnDto> hanList(String memberId) {
		return sqlSession.selectList("bookingReturn.han",memberId);
	}
}