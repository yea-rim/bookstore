package com.trio.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.PurchaseVO;
@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDao payDao;
	 
	@Autowired
	private StoreDao storeDao;
	 
	@Transactional
	@Override 
	public void insert(int payNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList) {
		//결제 승인까지 완료된 현 시점에서 결제 정보들을 DB에 저장
		PayDto payDto = PayDto.builder()
														.payNo(payNo)
				 										.payTid(responseVO.getTid())
														.payName(responseVO.getItem_name())
														.payTotal(responseVO.getAmount().getTotal())
													.build();
		payDao.insertPay(payDto);

		//purchaseList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보 등록
		for(PurchaseVO purchaseVO : purchaseList) {
			StoreDto storeDto = storeDao.find(purchaseVO.getStoreBookNo());
			PayDetailDto payDetailDto = PayDetailDto.builder()
																	.payNo(payNo)
																	.payDetailName(storeDto.getBookTitle())
																	.payDetailPrice(storeDto.getStorePrice())
																	.payDetailQuantity(purchaseVO.getQuantity())
																.build();
			payDao.insertPayDetail(payDetailDto);
		}
		
	}
	
}
