package com.trio.bookstore.repository;

import java.util.List;

import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.vo.MemberComplexSearchVO;

//다양한 형태를 손쉽게 교체하는 구조를 구현하기 위해 앞으로의 DAO는 모두 추상화 구조로 만든다
//- 인터페이스는 @Autowired를 위한 대표 형태로 생성
//- 클래스는 인터페이스를 상속받아 실제 처리를 구현
public interface MemberDao {
	void join(MemberDto memberDto);

	List<MemberDto> complexSearch(MemberComplexSearchVO vo);

	MemberDto login(String memberId, String memberPw);

	MemberDto info(String memberId);

	String findId(MemberDto memberDto);

	MemberDto find(MemberDto memberDto);// 비밀번호 찾기용

	boolean changeInformation(MemberDto memberDto);

	boolean changePassword(String memberId, String currentPw, String changePw);

	boolean changePassword(MemberDto memberDto);

	boolean exit(String memberId, String memberPw);

	int idCheck(String memberId);

	List<MemberDto> allList();

	MemberDto update(MemberDto memberDto);

	
	//한석(아이디로 조회)
	MemberDto findId(String query);
}
