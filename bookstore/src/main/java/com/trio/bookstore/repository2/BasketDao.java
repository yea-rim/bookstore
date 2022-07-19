package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.BasketDto;

public interface BasketDao {
	//장바구니에 들어가는게 쇼핑몰일떄 들어감
	void insert(BasketDto basketDto);
	//장바구니에 들어가는게 중고일떄 들어감
	void insert2(BasketDto basketDto);
	
	int sequence();
	List<BasketDto> list(String memberId);
	void delete(int basketNo);

		
	
}
