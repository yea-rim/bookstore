package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;

//쇼핑몰 도서 
public interface UsedDao {
	// 목록 조회
	List<UsedDto> list();

	// 단일조회
	UsedDto find(int usedNo);

	// 예림
	UsedDto insert(UsedDto usedDto);

	UsedDto update(UsedDto usedDto);

	void delete(int usedNo);

	UsedDto search(int usedNo);
}
