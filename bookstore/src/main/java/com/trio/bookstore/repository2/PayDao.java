package com.trio.bookstore.repository2;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;

public interface PayDao {
		int sequence();
		void insertPay(PayDto payDto);
		
		int insertPayDetail(PayDetailDto payDetailDto);
}
