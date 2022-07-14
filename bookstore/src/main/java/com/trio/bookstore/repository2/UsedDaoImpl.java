package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UsedDto> list() {
		return sqlSession.selectList("used.list");
	}

	@Override
	public UsedDto find(int usedNo) {
		return sqlSession.selectOne("used.one", usedNo);
	}

	// 예림
	@Override
	public UsedDto insert(UsedDto usedDto) {
		sqlSession.insert("used.insert", usedDto);
		return usedDto;
	}

	@Override
	public UsedDto update(UsedDto usedDto) {
		int count = sqlSession.update("used.update", usedDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("used.one", usedDto.getUsedNo());
	}

	@Override
	public void delete(int usedNo) {
		sqlSession.delete("used.delete", usedNo);
	}

	@Override
	public UsedDto search(int usedNo) {
		return sqlSession.selectOne("used.one", usedNo);
	}
}
