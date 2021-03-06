package com.trio.bookstore.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardDto> list(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("board.list", param);
	}
	
	@Override
	public List<BoardDto> list1(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("board.list1", param);
	}
	@Override
	public List<BoardDto> list2(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("board.list2", param);
	}
	@Override
	public List<BoardDto> list3(String type, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("board.list3", param);
	}
	@Override
	public List<BoardDto> list4(String type,String memberId, String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("memberId", memberId);
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		return sqlSession.selectList("board.list4", param);
	}
	
	@Override
	public int count(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("board.count", param);
	}
	@Override
	public int count1(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("board.count1", param);
	}
	@Override
	public int count2(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("board.count2", param);
	}
	@Override
	public int count3(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("board.count3", param);
	}
	@Override
	public int count4(String type, String keyword) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		return sqlSession.selectOne("board.count4", param);
	}
	
	@Override
	public BoardDto read(int boardNo) {
		sqlSession.update("board.plusReadcount", boardNo);
		return sqlSession.selectOne("board.one", boardNo);
	}
	
	@Override
	public boolean delete(int boardNo) {
		int count = sqlSession.delete("board.delete", boardNo);
		return count > 0;
	}
	
	@Override
	public BoardDto info(int boardNo) {
		return sqlSession.selectOne("board.one", boardNo);
	}
	
	@Override
	public boolean edit(BoardDto boardDto) {
		return sqlSession.update("board.edit", boardDto) > 0;
	}
	
	@Override
	public int write(BoardDto boardDto) {
		int boardNo = sqlSession.selectOne("board.sequence");
		boardDto.setBoardNo(boardNo);

		sqlSession.insert("board.write", boardDto);
		return boardNo;
	}
}
