package com.kh.home;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.home.entity.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class BoardListTest {

	@Autowired
	private SqlSession sqlSession;
	
//	@Test
	public void test() {
		Map<String, Object> param = new HashMap<>();
//		param.put("type", "board_head");
//		param.put("keyword", "공지");
		param.put("begin", 1);
		param.put("end", 10);
		List<BoardDto> list = sqlSession.selectList("board.list", param);
		for(BoardDto boardDto : list) {
			System.out.println(boardDto);
		}
//		단정문 : 결과를 알고 있을 때 해당 결과일 경우만 테스트가 성공하도록 판정하는 구문
//		test에서만 가능하며 assert로 시작
		assertEquals(list.size(), 10);
	}
	
	@Test
	public void test2() {
		Map<String, Object> param = new HashMap<>();
		param.put("type", "board_head");
		param.put("keyword", "공지");
		
		int count = sqlSession.selectOne("board.count", param);
		System.out.println("count = " + count);
		
		assertNotEquals(count, 0);
	}
	
}
