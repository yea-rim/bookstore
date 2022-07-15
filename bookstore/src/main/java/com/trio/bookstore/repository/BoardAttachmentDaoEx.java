package com.trio.bookstore.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardAttachmentDaoEx implements BoardAttachmentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(int boardNo, int attachmentNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("boardNo", boardNo);
		param.put("attachmentNo", attachmentNo);
		sqlSession.insert("boardAttachment.insert", param);
	}
	
	@Override
	public int info(int boardNo) {
		Integer attachmentNo = sqlSession.selectOne("boardAttachment.one", boardNo);
		if(attachmentNo == null) {
			return 0;
		}
		else {
			return attachmentNo;
		}
	}
}









