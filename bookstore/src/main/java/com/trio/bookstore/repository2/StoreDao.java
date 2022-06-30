package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.StoreDto;
//쇼핑몰 도서 
public interface StoreDao {
	//목록 조회
	List<StoreDto> list();
	//단일조회
	StoreDto find(int storeBookNo);
}
