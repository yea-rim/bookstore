package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.BookDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BookDto> list() {
		return sqlSession.selectList("book.list");
	}

	@Override
	public BookDto insert(BookDto bookDto) {
		int sequence = sqlSession.selectOne("book.sequence");
		bookDto.setBookNo(sequence);
		sqlSession.insert("book.insert", bookDto);
		return bookDto;
	}

	@Override
	public BookDto update(BookDto bookDto) {
		int count = sqlSession.update("book.update", bookDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("book.one", bookDto.getBookNo());
	}

	@Override
	public void delete(int bookNo) {
		sqlSession.delete("book.delete", bookNo);
	}

	@Override
	public List<BookDto> search(String bookTitle) {
		return sqlSession.selectList("book.search", bookTitle);
	}
}
