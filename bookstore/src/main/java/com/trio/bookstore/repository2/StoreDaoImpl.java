package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.LibDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StoreDto> list() {
		return sqlSession.selectList("store.list");
	}

	@Override
	public StoreDto find(int storeBookNo) {
		return sqlSession.selectOne("store.one", storeBookNo);
	}

	// 예림
	@Override
	public StoreDto insert(StoreDto storeDto) {
		sqlSession.insert("store.insert", storeDto);
		return storeDto;
	}

	@Override
	public StoreDto update(StoreDto storeDto) {
		int count = sqlSession.update("store.update", storeDto);
		if (count == 0)
			throw new CannotFindException();
		return sqlSession.selectOne("store.one", storeDto.getStoreBookNo());
	}

	@Override
	public void delete(int storeBookNo) {
		sqlSession.delete("store.delete", storeBookNo);
	}

	@Override
	public StoreDto search(int storeBookNo) {
		return sqlSession.selectOne("store.one", storeBookNo);
	}
}
