package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.trio.bookstore.error.CannotFindException;

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
	//중고번호에 맞는 단일조회
	@Override
	public UsedDto findUsed(int usedNo) {
		return sqlSession.selectOne("used.one",usedNo);
	}
	//예림님꺼
	@Override
	public List<UsedDto> list1() {
		return sqlSession.selectList("used.list1");
	}
//
//	@Override
//	public UsedDto find(int usedNo) {
//		return sqlSession.selectOne("used.one", usedNo);
//	}
		// 예림
		@Override
		public UsedDto insert(UsedDto usedDto) {
			int sequence = sqlSession.selectOne("used.sequence");
			usedDto.setUsedNo(sequence);
			sqlSession.insert("used.insert", usedDto);
			return usedDto;
		}

		@Override
		public UsedDto update(UsedDto usedDto) {
			int count = sqlSession.update("used.update", usedDto);
			if (count == 0)
				throw new CannotFindException();
			return sqlSession.selectOne("used.one1", usedDto.getUsedNo());
		}

		@Override
		public void delete(int usedNo) {
			sqlSession.delete("used.delete", usedNo);
		}

		@Override
		public UsedDto search(int usedNo) {
			return sqlSession.selectOne("used.one1", usedNo);
		}

		
		
	}

