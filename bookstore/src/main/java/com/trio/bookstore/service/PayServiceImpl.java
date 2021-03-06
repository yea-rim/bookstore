package com.trio.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trio.bookstore.entity.MemberDto;
import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;
import com.trio.bookstore.vo.FinalStoreVO;
import com.trio.bookstore.vo.FinalUsedVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.PurchaseVO;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDao payDao;
	 
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private UsedDao usedDao;
	 
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
	@Override
	public void insert(int payNo, KakaoPayApproveResponseVO responseVO, List<FinalStoreVO> finalStoreList,
			List<FinalUsedVO> finalUsedList) {
			//결제 테이블에 데이터 넣기
			PayDto payDto = PayDto.builder()
						.payNo(payNo)
							.payTid(responseVO.getTid())
						.payName(responseVO.getItem_name())
						.payTotal(responseVO.getAmount().getTotal())
					.build();
				payDao.insertPay(payDto);

				//finalStoreList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보 등록
				if(finalStoreList != null) {
					
				for(FinalStoreVO finalStoreVO : finalStoreList) {
				StoreDto storeDto = storeDao.find(finalStoreVO.getStoreBookNo());
				PayDetailDto payDetailDto = PayDetailDto.builder()
											.payNo(payNo)
											.payDetailName(storeDto.getBookTitle())
											.payDetailPrice(storeDto.getStorePrice())
											.payDetailQuantity(finalStoreVO.getQuantity())
										.build();
				payDao.insertPayDetail(payDetailDto);

				}
		}		
				//finalUsedList 뽑아서 결제상세테이블에 넣기
				if(finalUsedList != null) {
					
			
				for(FinalUsedVO finalUsedVO : finalUsedList) {
					UsedDto usedDto = usedDao.findUsed(finalUsedVO.getUsedNo());
					PayDetailDto payDetailDto = PayDetailDto.builder()
												.payNo(payNo)
												.payDetailName(usedDto.getBookTitle())
												.payDetailPrice(usedDto.getUsedPrice())
												.payDetailQuantity(finalUsedVO.getQuantity())
											.build();
					payDao.insertPayDetail(payDetailDto);
				}
			}		
	}
	//최종
	@Override
	public void insert(int payNo, KakaoPayApproveResponseVO responseVO, List<FinalStoreVO> finalStoreList,
			List<FinalUsedVO> finalUsedList, MemberDto memberDto, String memberId) {
		//결제 테이블에 데이터 넣기
		log.debug("합치기전={}",memberDto.getMemberDetailAddress());
		String post = memberDto.getMemberPost() + memberDto.getMemberBasicAddress() + memberDto.getMemberDetailAddress(); 
		log.debug("합치기후={}",post);
		PayDto payDto = PayDto.builder()
					.payNo(payNo)
						.payTid(responseVO.getTid())
					.payName(responseVO.getItem_name())
					.payTotal(responseVO.getAmount().getTotal())
					.payMemberId(memberId)
					.payPost(post)
				.build();
			payDao.insertPay(payDto);

			//finalStoreList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보 등록
			if(finalStoreList != null) {
				
			for(FinalStoreVO finalStoreVO : finalStoreList) {
			StoreDto storeDto = storeDao.find(finalStoreVO.getStoreBookNo());
			PayDetailDto payDetailDto = PayDetailDto.builder()
										.payNo(payNo)
										.payDetailName(storeDto.getBookTitle())
										.payDetailPrice(storeDto.getStorePrice())
										.payDetailQuantity(finalStoreVO.getQuantity())
									.build();
			payDao.insertPayDetail(payDetailDto);

			}
	}		
			//finalUsedList 뽑아서 결제상세테이블에 넣기
			if(finalUsedList != null) {
				
		
			for(FinalUsedVO finalUsedVO : finalUsedList) {
				UsedDto usedDto = usedDao.findUsed(finalUsedVO.getUsedNo());
				PayDetailDto payDetailDto = PayDetailDto.builder()
											.payNo(payNo)
											.payDetailName(usedDto.getBookTitle())
											.payDetailPrice(usedDto.getUsedPrice())
											.payDetailQuantity(finalUsedVO.getQuantity())
										.build();
				payDao.insertPayDetail(payDetailDto);
			}
		}				
	}
}
