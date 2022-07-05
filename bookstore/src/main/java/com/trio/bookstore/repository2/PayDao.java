package com.trio.bookstore.repository2;

import java.util.List;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.vo.PayListVO;

public interface PayDao {
		int sequence();
		void insertPay(PayDto payDto);
		
		int insertPayDetail(PayDetailDto payDetailDto);
		List<PayDto> list();
		PayDto find(int payNo);
		List<PayDetailDto> listDetail(int payNo);
		PayDetailDto findDetail(int payDetailNo);
		boolean cancelDetail(PayDetailDto payDetailDto);
		int calculateCancelAmountByOracle(int payNo);
		void cancelAll(int payNo);
		List<PayListVO> treeList();
}
