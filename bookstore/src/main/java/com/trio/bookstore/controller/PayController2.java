package com.trio.bookstore.controller;

import java.net.URISyntaxException;
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

import com.trio.bookstore.entity.BasketDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.entity.UsedDto;
import com.trio.bookstore.repository2.BasketDao;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.repository2.UsedDao;
import com.trio.bookstore.service.KakaoPayService;
import com.trio.bookstore.service.PayService;
import com.trio.bookstore.vo.FinalStoreListVO;
import com.trio.bookstore.vo.FinalStoreVO;
import com.trio.bookstore.vo.FinalUsedListVO;
import com.trio.bookstore.vo.FinalUsedVO;
import com.trio.bookstore.vo.KakaoPayApproveRequestVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;
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
	private BasketDao basketDao;
	@Autowired
	private PayService payService;
	//결제 페이지로 가는컨트롤러
	@PostMapping("/pay")
	public String pay(@RequestParam int bookNo,
					  @RequestParam int storeAmount,
					  @ModelAttribute UsedPayListVO listVO,
					  HttpSession session,
					  Model model
			) {
		//쇼핑몰도 안사고 중고도 안사면 현재페이지로 가게하기
		String login = (String)session.getAttribute("login");
		model.addAttribute("login",login);
		if(storeAmount == 0 && listVO.getUsed() == null) {
			return "redirect:book/detail?error&bookNo="+bookNo;
		}
		log.debug("hanseok = {}",listVO);

		int total = 0;
		//쇼핑몰책 수량
		if(storeAmount>0) {
			model.addAttribute("storeAmount",storeAmount);
		}
		
		//쇼핑몰책 데이터 가져오기
		StoreDto storeDto = storeDao.find(bookNo);
		model.addAttribute("storeDto",storeDto);
		
		total += storeDto.getStorePrice() * storeAmount;
		log.debug("hanseok={}",total);
		//중고책 가져오기
		if(listVO.getUsed() != null) {
			
		List<UsedDto> usedList = new ArrayList<>();
		for(UsedPayVO usedPayVO : listVO.getUsed()) {
			//중고테이블 기본키인 중고번호로 단일조회
			UsedDto usedDto = usedDao.findUsed(usedPayVO.getUsedNo());
			if(usedDto == null || usedDto.getUsedNo() == 0) continue;
			total+= usedDto.getUsedPrice();
			//임의로 만든 중고 리스트에 추가
			log.debug("hanseok5={}",total);

			usedList.add(usedDto);
		}
		log.debug("아니={}",usedList);
		model.addAttribute("usedList",usedList);

		}
		model.addAttribute("total",total);

		return "pay/pay";
	}

	//결제구현 컨트롤러
	@GetMapping("/pay/purchase")
	public String purchase(@ModelAttribute FinalStoreListVO storeListVO,
						   @ModelAttribute FinalUsedListVO usedListVO,
						   HttpSession session) throws URISyntaxException {
		log.debug("storeListVO = {}",storeListVO);
		if((storeListVO == null || storeListVO.getFinalStore() ==null) && (usedListVO == null || usedListVO.getFinalUsed() == null)) {
			//상품을 구매한 것이 없을때 우선 메인으로 가게해놓음
			return "redirect:/";
		}
		
		int totalPrice = 0;
		List<String> itemNames = new ArrayList<>();
		//쇼핑몰 결제할 품목 뽑아내기(쇼핑몰 결제 없으면 기능 안하게 하기)
		if(storeListVO.getFinalStore() != null) {
			
		for(FinalStoreVO finalStoreVO : storeListVO.getFinalStore()) {
			StoreDto storeDto = storeDao.find(finalStoreVO.getStoreBookNo());
			totalPrice += (storeDto.getStorePrice()*finalStoreVO.getQuantity());
			itemNames.add(storeDto.getBookTitle());
			}
		}
		if(usedListVO.getFinalUsed() != null) {
			for(FinalUsedVO finalUsedVO : usedListVO.getFinalUsed()) {
				UsedDto usedDto = usedDao.findUsed(finalUsedVO.getUsedNo());
				totalPrice += usedDto.getUsedPrice();
				itemNames.add(usedDto.getBookTitle());
			}
		}
		
		//결제 이름뽑기 (xx외 n건)
		String itemName = itemNames.get(0);
		if(itemNames.size() >=2) {
			itemName += " 외 " + (itemNames.size()-1) + "건";
		}
		log.debug("totalPrice ={}",totalPrice);
		log.debug("itemNames ={}",itemName);

		
		//결제 준비 요청
				int payNo = payDao.sequence();
				KakaoPayReadyRequestVO requestVO = 
										KakaoPayReadyRequestVO.builder()
//																			.partner_order_id(String.valueOf(payNo))
																			.partner_order_id("52")
																			.partner_user_id("final")
																			.item_name(itemName)
																			.quantity(1)
																			.total_amount(totalPrice)
																	.build();
				
				KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
				

				//결제성공 페이지에서 승인요청 보내기 위한 데이터를 세션에 임시로 추가
				session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
						.tid(responseVO.getTid())
						.partner_order_id(requestVO.getPartner_order_id())
						.partner_user_id(requestVO.getPartner_user_id())
					.build());
			//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
					session.setAttribute("finalStore", storeListVO.getFinalStore());//실제 쇼핑몰 구매 상품 명단
					session.setAttribute("finalUsed", usedListVO.getFinalUsed());//실제 중고 구매 상품 명단
					

				//결제 번호도 세션으로 전달
						session.setAttribute("payNo", payNo);

						return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	//결제 승인 기능
	@GetMapping("/pay/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {
		KakaoPayApproveRequestVO requestVO =
								(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		
		List<FinalStoreVO> finalStoreList = (List<FinalStoreVO>) session.getAttribute("finalStore");
		List<FinalUsedVO> finalUsedList = (List<FinalUsedVO>) session.getAttribute("finalUsed");
		session.removeAttribute("finalStore");
		session.removeAttribute("finalUsed");
		
		int payNo = (int) session.getAttribute("payNo");
		session.removeAttribute("payNo");
		
		String memberId = (String)session.getAttribute("login");
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		log.debug("제발={}",memberId);
		payService.insert(payNo,responseVO,finalStoreList,finalUsedList,memberId);
		
		return "redirect:finish";
	}
	@GetMapping("/pay/finish")
	public String payFinish() {
		return "pay/finish";
	}
	//장바구니 페이지 가는 기능
	@GetMapping("/basket")
	public String basket() {
		return "pay/basket";
	}
	
	//상세페이지에서 장바구니 버튼 누르면 
	@PostMapping("/basket") 
	public String basket(@RequestParam int bookNo,
						 @RequestParam int storeAmount,
						 @ModelAttribute UsedPayListVO listVO,
						 Model model
						 ) {
		
		//쇼핑몰도 안사고 중고도 안사면 현재페이지로 가게하기
		if(storeAmount == 0 && listVO.getUsed() == null) {
			return "redirect:book/detail?error&bookNo="+bookNo;
		}
		
		//쇼핑몰수량 있으면 장바구니 테이블에 넣기
		if(storeAmount > 0) {
			StoreDto storeDto = storeDao.find(bookNo);
			log.debug("hanseok = {}",storeDto);
			BasketDto basketDto = BasketDto.builder()
							// 장바구니 번호는 mapper에서 시퀀스로
							.basketMemberId("qwer1234")
							//아이디 세션으로 넣어주기
							.basketBookNo(bookNo)
							.basketAmount(storeAmount)
							.basketPrice(storeDto.getStorePrice()*storeAmount)
							.basketBookTitle(storeDto.getBookTitle())
							.basketBookImage(storeDto.getBookImage())
							.build();
			log.debug("hanseok2 = {}",basketDto);
			basketDao.insert(basketDto);
		}
		
		//중고장바구니 넣는 기능
		if(listVO.getUsed() !=null) {
			
			for(UsedPayVO usedPayVO : listVO.getUsed()) {
				if(usedPayVO.getUsedNo()!=0) {
					
				UsedDto usedDto = usedDao.findUsed(usedPayVO.getUsedNo());
				BasketDto basketDto = BasketDto.builder()
						// 장바구니 번호는 mapper에서 시퀀스로
						.basketMemberId("qwer1234")
						//아이디 세션으로 넣어주기
						.basketUsedNo(usedDto.getUsedNo())
						.basketAmount(usedPayVO.getQuantity())
						.basketPrice(usedDto.getUsedPrice()*usedPayVO.getQuantity())
						.basketBookTitle(usedDto.getBookTitle())
						.basketBookImage(usedDto.getBookImage())
						.build();
				basketDao.insert2(basketDto);
				}
			}
		}
		
		return "redirect: book/detail?ok&bookNo="+bookNo;
	}
	
	//결제내역
	@GetMapping("/payList")
	public String payList(HttpSession session,Model model) {
		String memberId = (String)session.getAttribute("login");
		String auth = (String)session.getAttribute("auth");
		model.addAttribute("login",memberId);
		//로그인된 아이디(일반회원일때 결제내역에 기본주소 데이터 보내기
		if(auth.equals("일반회원")) {
			
		List<PayDto> payList = payDao.find(memberId);
		model.addAttribute("payList",payList);
		}
		return "pay/payList";
	}

}

