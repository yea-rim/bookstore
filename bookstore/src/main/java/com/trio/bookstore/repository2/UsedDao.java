package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.UsedDto;

public interface UsedDao {

	//도서번호에 맞는 중고데이터 다뽑기
	List<UsedDto> list(int bookNo);
	//도서번호에 맞는 중고데이터중 가장 싼 중고데이터 가져오기
	UsedDto find(int bookNo);
	//중고번호에 맞는 중고데이터 단일조회
	UsedDto findUsed(int usedNo);
	// 목록 조회
	List<UsedDto> list1();
//
//	// 단일조회
//	UsedDto find(int usedNo);

	// 예림
	UsedDto insert(UsedDto usedDto);
	
	UsedDto update(UsedDto usedDto);
	
	void delete(int usedNo);
	
	UsedDto search(int usedNo);
}


