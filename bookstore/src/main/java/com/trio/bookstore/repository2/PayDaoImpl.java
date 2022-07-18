package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.vo.PayListVO;
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

	@Override
	public List<PayDto> list() {
		return sqlSession.selectList("pay.list");
	}

	@Override
	public PayDto find(int payNo) {
			
		return sqlSession.selectOne("pay.one",payNo);
	}

	@Override
	public List<PayDetailDto> listDetail(int payNo) {
		return sqlSession.selectList("payDetail.list",payNo);
	}

@Override
@Transactional
public boolean cancelDetail(PayDetailDto payDetailDto) {
	int count = sqlSession.update("payDetail.cancel",payDetailDto.getPayDetailNo());
	if(count > 0) {
		sqlSession.update("pay.refresh",payDetailDto.getPayNo());
		
	}
	return count > 0;
}

@Override
public PayDetailDto findDetail(int payDetailNo) {
	return sqlSession.selectOne("payDetail.one",payDetailNo);
}

@Override
public int calculateCancelAmountByOracle(int payNo) {
	
	return sqlSession.selectOne("payDetail.calculateCancelAmount",payNo);
}
@Override
@Transactional
public void cancelAll(int payNo) {
	sqlSession.update("pay.cancelAll",payNo);
	sqlSession.update("payDetail.cancelAll",payNo);
}
@Override
public List<PayListVO> treeList() {
	
	return sqlSession.selectList("pay.treeSearch");
}

@Override
public List<PayDto> find(String memberId) {
	return sqlSession.selectList("pay.payList",memberId);
}
}
