package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.trio.bookstore.entity.LibInfoDto;
import com.trio.bookstore.error.CannotFindException;

public class LibInfoDaoImpl implements LibInfoDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LibInfoDto> list() {
		return sqlSession.selectList("lib.list");
	}

	@Override
	public LibInfoDto insert(LibInfoDto libinfoDto) {
		int sequence = sqlSession.selectOne("lib.sequence");
		libinfoDto.setLibInfoNo(sequence);
		sqlSession.insert("lib.insert", libinfoDto);
		return libinfoDto;
	}

	@Override
	public LibInfoDto update(LibInfoDto libinfoDto) {
		int count = sqlSession.update("lib.update", libinfoDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("lib.one", libinfoDto.getLibInfoNo());
	}

	@Override
	public void delete(int libInfoNo) {
		sqlSession.delete("lib.delete", libInfoNo);
	}

	@Override
	public List<LibInfoDto> search(String query) {
		return sqlSession.selectList("lib.search", query);
	}

}
