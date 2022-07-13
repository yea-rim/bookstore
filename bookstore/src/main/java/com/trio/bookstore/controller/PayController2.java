package com.trio.bookstore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;
import com.trio.bookstore.service.KakaoPayService;
import com.trio.bookstore.service.PayService;
import com.trio.bookstore.vo.FinalStoreListVO;
import com.trio.bookstore.vo.FinalStoreVO;
import com.trio.bookstore.vo.FinalUsedListVO;
import com.trio.bookstore.vo.FinalUsedVO;
import com.trio.bookstore.vo.UsedPayListVO;
import com.trio.bookstore.vo.UsedPayVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class PayController2 {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private UsedDao usedDao;
	
	@Autowired
	private PayService payService;
	//결제 페이지로 가는컨트롤러
	@PostMapping("/pay")
	public String pay(@RequestParam int bookNo,
					  @RequestParam int storeAmount,
					  @ModelAttribute UsedPayListVO listVO,
					  Model model
			) {
		
		//중고 usdeNo 리스트 pay.jsp로 보내기
//		List<Integer> usedNoList = new ArrayList<Integer>(); 
//		
//		usedNoList.add(null)
//		log.debug("검사 = {}",usedNoList);
//		model.addAttribute("usedNoList",usedNoList);

		//쇼핑몰책 수량
		if(storeAmount>0) {
			model.addAttribute("storeAmount",storeAmount);
		}
		
		//쇼핑몰책 데이터 가져오기
		StoreDto storeDto = storeDao.find(bookNo);
		model.addAttribute("storeDto",storeDto);
		
		//중고책 가져오기
		List<UsedDto> usedList = new ArrayList<>();
		for(UsedPayVO usedPayVO : listVO.getUsed()) {
			//중고테이블 기본키인 중고번호로 단일조회
			UsedDto usedDto = usedDao.findUsed(usedPayVO.getUsedNo());
			if(usedDto == null) continue;
		
			//임의로 만든 중고 리스트에 추가
			usedList.add(usedDto);
		}
		model.addAttribute("usedList",usedList);

		return "pay/pay";
	}

	//결제구현 컨트롤러
	@GetMapping("/pay/purchase")
	public String purchase(@ModelAttribute FinalStoreListVO storeListVO,
						   @ModelAttribute FinalUsedListVO usedListVO,
						   HttpSession session) {
		log.debug("storeListVO = {}",storeListVO);
		if((storeListVO == null || storeListVO.getFinalStore() ==null) && (usedListVO == null || usedListVO.getFinalUsed() == null)) {
			//상품을 구매한 것이 없을때 우선 메인으로 가게해놓음
			return "redirect:/";
		}
		
		int totalPrice = 0;
		List<String> itemNames = new ArrayList<>();
		//쇼핑몰 결제할 품목 뽑아내기(쇼핑몰 결제 없으면 기능 안하게 하기)
		if(storeListVO != null) {
			
		for(FinalStoreVO finalStoreVO : storeListVO.getFinalStore()) {
			StoreDto storeDto = storeDao.find(finalStoreVO.getStoreBookNo());
			totalPrice += (storeDto.getStorePrice()*finalStoreVO.getQuantity());
			itemNames.add(storeDto.getBookTitle());
			}
		}
		if(usedListVO != null) {
			for(FinalUsedVO finalUsedVO : usedListVO.getFinalUsed()) {
				UsedDto usedDto = usedDao.findUsed(finalUsedVO.getUsedNo());
				totalPrice += usedDto.getUsedPrice();
				itemNames.add(usedDto.getBookTitle());
			}
		}
		
		//결제 이름뽑기 (xx외 n건)
		String itemName = itemNames.get(0);
		if(itemNames.size() >=2) {
			itemName += "외" + (itemNames.size()-1) + "건";
		}
		log.debug("totalPrice ={}",totalPrice);
		log.debug("itemNames ={}",itemNames);

		
		return "/pay";
	
	
	}
}

