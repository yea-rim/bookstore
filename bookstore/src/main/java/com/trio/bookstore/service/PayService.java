package com.trio.bookstore.service;

import java.util.List;

import com.trio.bookstore.vo.FinalStoreVO;
import com.trio.bookstore.vo.FinalUsedVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.PurchaseVO;

public interface PayService {
	void insert(int payNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList);

	void insert(int payNo, KakaoPayApproveResponseVO responseVO, List<FinalStoreVO> finalStoreList,
			List<FinalUsedVO> finalUsedList);

}
