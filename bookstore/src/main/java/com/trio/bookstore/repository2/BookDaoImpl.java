package com.trio.bookstore.repository2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 한석 - 도서 조회 구문(페이지네이션) -- 나중에 type이나 keyword 넣게 되면 강사님 코드 참고
	@Override
	public List<BookDto> list(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);

		int end = page * size;
		int begin = end - (size - 1);

		param.put("begin", begin);
		param.put("end", end);

		return sqlSession.selectList("book.Hlist", param);
	}

	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);

		return sqlSession.selectOne("book.Hcount", param);
	}
	//도서분류 범위로 구한 개수
	@Override
	public int count(int typeNumber1, int typeNumber2) {
		Map<String, Object> param = new HashMap<>();
		param.put("typeNumber1", typeNumber1);
		param.put("typeNumber2", typeNumber2);

		return sqlSession.selectOne("book.Hcount2", param);	
	}
	//도서분류 번호로 나오는 개수(소분류)
	@Override
	public int count(int typeNumber1) {
			
		return sqlSession.selectOne("book.Hcount3",typeNumber1);
	}

	@Override
	public BookDto find(int bookNo) {
		return sqlSession.selectOne("book.one", bookNo);
	}

	@Override
	public BookDto bookSearch(int bookNo) {
		return sqlSession.selectOne("book.one", bookNo);

	}

	@Override
	public List<BookDto> bookType(int bookType) {
		return sqlSession.selectList("book.bookType", bookType);
	}
	//도서 분류로만 조회할때
	@Override
	public List<BookDto> list(int typeNumber1, int typeNumber2,int page,int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("typeNumber1", typeNumber1);
		param.put("typeNumber2", typeNumber2);
		
		int end = page * size;
		int begin = end - (size - 1);

		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("book.han",param);
	}
	//소분류로 조회
	@Override
	public List<BookDto> list(int typeNumber1, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("typeNumber1", typeNumber1);
		
		int end = page * size;
		int begin = end - (size - 1);

		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("book.han2",param);
	}

}
