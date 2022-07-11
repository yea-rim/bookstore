package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.UsedDto;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	private SqlSession sqlSession;

@Override
public List<UsedDto> list(int bookNo) {
	return sqlSession.selectList("used.list",bookNo);
}

	@Override
	public UsedDto find(int bookNo) {
		return sqlSession.selectOne("used.cheap",bookNo);
	}
}
