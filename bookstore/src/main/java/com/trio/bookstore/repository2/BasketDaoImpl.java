package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.BasketDto;

@Repository
public class BasketDaoImpl implements BasketDao {
	
	@Autowired
	private SqlSession sqlSession;
	//쇼핑몰도서가 장바구니에 들어갈떄
	@Override
	public void insert(BasketDto basketDto) {
		sqlSession.insert("basket.insert",basketDto);
		
	}
	//중고재고가 장바구니에 
	@Override
	public void insert2(BasketDto basketDto) {
			sqlSession.insert("basket.insert2",basketDto);
	}
	@Override
	public int sequence() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("basket.sequence");
	}
	
	@Override
	public List<BasketDto> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basket.list");
	}
	@Override
	public void delete(int basketNo) {
		sqlSession.delete("basket.delete",basketNo);
	}
}
