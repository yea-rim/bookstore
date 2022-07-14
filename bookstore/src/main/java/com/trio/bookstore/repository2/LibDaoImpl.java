package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.LibDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class LibDaoImpl implements LibDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LibDto> libList() {
		return sqlSession.selectList("lib.list");
	}

	@Override
	public LibDto insert(LibDto libDto) {
		int sequence = sqlSession.selectOne("lib.sequence");
		libDto.setLibNo(sequence);
		sqlSession.insert("lib.insert", libDto);
		return libDto;
	}

	@Override
	public LibDto update(LibDto libDto) {
		int count = sqlSession.update("lib.update", libDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("lib.one", libDto.getLibNo());
	}

	@Override
	public List<LibDto> libSearch(int libNo) {
		return sqlSession.selectOne("lib.one", libNo);
	}

	@Override
	public void delete(int libNo) {
		sqlSession.delete("lib.delete", libNo);
	}

	@Override
	public List<LibDto> shSearch(int libNo) {
		return sqlSession.selectOne("lib.sh", libNo);
	}
}
