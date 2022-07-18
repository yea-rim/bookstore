package com.trio.bookstore.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.vo.MemberComplexSearchVO;

@Repository
public class MemberDaoMybatis implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void join(MemberDto memberDto) {
		sqlSession.insert("member.join", memberDto);
	}

	@Override
	public List<MemberDto> complexSearch(MemberComplexSearchVO vo) {
		List<MemberDto> list = sqlSession.selectList("member.complexSearch2", vo);
		return list;
	}

	@Override
	public MemberDto login(String memberId, String memberPw) {
		MemberDto memberDto = sqlSession.selectOne("member.one", memberId);
		if(memberDto == null) {
			return null;
		}
		
		boolean isPasswordMatch = memberDto.getMemberPw().equals(memberPw);
		if(isPasswordMatch) {
			sqlSession.update("member.updateLastLogin", memberId);
			return memberDto;
		}
		else {
			return null;
		}
	}

	@Override
	public MemberDto info(String memberId) {
		return sqlSession.selectOne("member.one", memberId);
	}

	@Override
	public boolean changePassword(String memberId, String currentPw, String changePw) {
		MemberDto memberDto = this.login(memberId, currentPw);//현재 정보로 검사
		if(memberDto == null) {
			return false;
		}
		
		int count = sqlSession.update("member.changePassword", 
				MemberDto.builder().memberId(memberId).memberPw(changePw).build());
		
		return count > 0;
	}

	@Override
	public String findId(MemberDto memberDto) {
		return sqlSession.selectOne("member.findId", memberDto);
	}

	@Override
	public boolean exit(String memberId, String memberPw) {
		MemberDto memberDto = this.login(memberId, memberPw);
		if(memberDto == null) {
			return false;
		}
		else {
			int count = sqlSession.delete("member.exit", memberId);
			return count > 0;
		}
	}

	@Override
	public boolean changeInformation(MemberDto memberDto) {
		MemberDto findDto = this.login(memberDto.getMemberId(), memberDto.getMemberPw());
		if(findDto == null) {
			return false;
		}
		else {
			int count = sqlSession.update("member.changeInformation", memberDto);
			return count > 0;
		}
	}

	@Override
	public MemberDto find(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean changePassword(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int idCheck(String memberId) {
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne("member.idCheck", memberId);
		return result;
	}

	// 전체 조회 (관리자용)
	@Override
	public List<MemberDto> allList() {
		return sqlSession.selectList("member.allList");
	}
	
	@Override
	public MemberDto update(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto findId(String query) {
		return sqlSession.selectOne("hanseok",query);
	}
	
}