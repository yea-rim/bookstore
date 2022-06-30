package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.StoreDto;
@Repository
public class StoreDaoImpl implements StoreDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StoreDto> list() {
		return sqlSession.selectList("store.list");
	}

	@Override
	public StoreDto find(int storeBookNo) {
		return sqlSession.selectOne("store.one",storeBookNo);
	}
		
}
