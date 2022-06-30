package com.trio.bookstore.repository2;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
@Repository
public class PayDaoImpl implements PayDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("pay.sequence");
	}
	
	@Override
	public void insertPay(PayDto payDto) {
		sqlSession.insert("pay.insert",payDto);
	}

	@Override
	public int insertPayDetail(PayDetailDto payDetailDto) {
		int sequence = sqlSession.selectOne("payDetail.sequence");
		payDetailDto.setPayDetailNo(sequence);
		sqlSession.insert("payDetail.insert",payDetailDto);
		return sequence;
	}


}
