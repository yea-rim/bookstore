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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trio.bookstore.entity.PayDetailDto;
import com.trio.bookstore.entity.PayDto;
import com.trio.bookstore.entity.StoreDto;
import com.trio.bookstore.repository2.PayDao;
import com.trio.bookstore.repository2.StoreDao;
import com.trio.bookstore.service.KakaoPayService;
import com.trio.bookstore.service.PayService;
import com.trio.bookstore.vo.KakaoPayApproveRequestVO;
import com.trio.bookstore.vo.KakaoPayApproveResponseVO;
import com.trio.bookstore.vo.KakaoPayCancelRequestVO;
import com.trio.bookstore.vo.KakaoPayCancelResponseVO;
import com.trio.bookstore.vo.KakaoPayOrderRequestVO;
import com.trio.bookstore.vo.KakaoPayOrderResponseVO;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;
import com.trio.bookstore.vo.PurchaseListVO;
import com.trio.bookstore.vo.PurchaseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class hanseokController {
	
	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private PayDao payDao;
	
	@Autowired
	private PayService payService;
	
	
	@GetMapping("/han")
	public String han() {
		return "han";
	}
	
	
	@GetMapping("/pay1")
	public String pay1(Model model) {
		model.addAttribute("list",storeDao.list());
		return "pay1/list";
	}
	
	@GetMapping("/pay1_purchase")
	public String pay1Purchase(@RequestParam int storeBookNo, Model model) {
		model.addAttribute("storeDto", storeDao.find(storeBookNo));
		return "pay1/purchase";
		
	}
	@PostMapping("/pay1_purchase")
	public String pay1Purchase(
			//@RequestParam int storeBookNo, @RequestParam int quantity
			@ModelAttribute PurchaseVO purchaseVO,HttpSession session
			) throws URISyntaxException {
		
		StoreDto storeDto = storeDao.find(purchaseVO.getStoreBookNo());
		//도서가 없으면 결제 진행 안됌
		if(storeDto == null) {
			return "redirect:pay1_purchase";
		}
		
		//결제 ready
		int totalAmount = storeDto.getStorePrice() * purchaseVO.getQuantity();
		int payNo = payDao.sequence(); 
		KakaoPayReadyRequestVO requestVO = 
										KakaoPayReadyRequestVO.builder()
													.partner_order_id(String.valueOf(payNo))
													.partner_user_id("qwer1234")
													.item_name(storeDto.getBookTitle())
													.quantity(purchaseVO.getQuantity())
													.total_amount(totalAmount)
										.build();
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
														.tid(responseVO.getTid())
														.partner_order_id(requestVO.getPartner_order_id())
														.partner_user_id(requestVO.getPartner_user_id())
													.build());
		//상품이 여러개
		session.setAttribute("purchase", List.of(purchaseVO));
		
		//결제 번호 세션으로
		session.setAttribute("payNo", payNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
		
	}
	
	@GetMapping("/pay/approve2")
	public String paySuccess(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {
		KakaoPayApproveRequestVO requestVO =
								(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		
		List<PurchaseVO> purchaseList = (List<PurchaseVO>) session.getAttribute("purchase");
		session.removeAttribute("purchase");
		
		int payNo = (int) session.getAttribute("payNo");
		session.removeAttribute("payNo");
		
		
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		
		payService.insert(payNo,responseVO,purchaseList);
		
		return "redirect:finish";
	}
	
	@GetMapping("/pay/finish2")
	public String payFinish() {
		return "pay/finish";
	}
	
	@GetMapping("/pay/cancel")
	public String payCancel(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("payNo");
		return "pay/cancel";
	}
	@GetMapping("/pay/fail") 
	public String payFail(HttpSession session) {
		session.removeAttribute("pay");
		session.removeAttribute("purchase");
		session.removeAttribute("payNo");
		
		return "pay/fail";
	}
	
	@GetMapping("/pay2")
	public String pay2(Model model) {
		model.addAttribute("list",storeDao.list());
		return "pay2/list";
	} 
	
	@PostMapping("/pay2_purchase")
	public String pay2Purchase(@ModelAttribute PurchaseListVO listVO,
			HttpSession session) throws URISyntaxException {
		if(listVO == null || listVO.getPurchase() == null) {
			//상품을 구매한것이 없을떄
			return "redirect:pay2";//또는 에러처리나 내가 원하는 화면으로 보내버리자
		}
		//listVO의 내용을 가지고 묶음 결제 준비

		int totalAmount = 0;
		List<String> itemNames = new ArrayList<>();
		for(PurchaseVO purchaseVO : listVO.getPurchase() ) {
			StoreDto storeDto = storeDao.find(purchaseVO.getStoreBookNo());
			totalAmount += storeDto.getStorePrice() * purchaseVO.getQuantity();
			itemNames.add(storeDto.getBookTitle());
		}
		String itemName = itemNames.get(0);
		if(itemNames.size() >= 2) {
			itemName += " 외 " + (itemNames.size()-1) + "건";
		}
		
		//결제 준비 요청
		int payNo = payDao.sequence();
		KakaoPayReadyRequestVO requestVO = 
								KakaoPayReadyRequestVO.builder()
																	.partner_order_id(String.valueOf(payNo))
																	.partner_user_id("qwer1234")
																	.item_name(itemName)
																	.quantity(1)
																	.total_amount(totalAmount)
															.build();
		
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		

		//결제성공 페이지에서 승인요청 보내기 위한 데이터를 세션에 임시로 추가
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
				.tid(responseVO.getTid())
				.partner_order_id(requestVO.getPartner_order_id())
				.partner_user_id(requestVO.getPartner_user_id())
			.build());
	//추가적으로 결제성공 페이지에서 완료정보를 등록하기 위해 알아야 할 상품구매개수 정보를 같이 전달
			session.setAttribute("purchase", listVO.getPurchase());//실제 구매 상품 명단

		//결제 번호도 세션으로 전달
				session.setAttribute("payNo", payNo);

				return "redirect:"+responseVO.getNext_redirect_pc_url();
		
	}
	
	@GetMapping("/history")
	public String history(Model model) {
		model.addAttribute("list",payDao.list());
		return "pay/list";
	}
	
	@GetMapping("/more")
	public String more(@RequestParam int payNo, Model model) throws URISyntaxException {
		PayDto payDto = payDao.find(payNo);
		model.addAttribute("payDto",payDto);
		
		List<PayDetailDto> payDetailList = payDao.listDetail(payNo);
		model.addAttribute("payDetailList",payDetailList);
		
		KakaoPayOrderResponseVO responseVO = 
				kakaoPayService.order(KakaoPayOrderRequestVO.builder()
																			.tid(payDto.getPayTid())
																		.build());
			model.addAttribute("responseVO", responseVO);

			return "pay/more";
	}
	
	
	@GetMapping("/cancel")
	public String cancelDetail(@RequestParam int payDetailNo) throws URISyntaxException {
		
		PayDetailDto payDetailDto = payDao.findDetail(payDetailNo);
		if(payDetailDto == null) {
			
			
		}
		PayDto payDto = payDao.find(payDetailDto.getPayNo());
	
		//실제 취소
				KakaoPayCancelRequestVO requestVO = 
											KakaoPayCancelRequestVO.builder()
												.tid(payDto.getPayTid())
												.cancel_amount(payDetailDto.getPayTotal())
											.build();
				KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);

				//DB 처리
				payDao.cancelDetail(payDetailDto);

				return "redirect:more?payNo="+payDetailDto.getPayNo();
			}
	
	@GetMapping("/cancel_all")
	public String cancelAll(@RequestParam int payNo, RedirectAttributes attr) throws URISyntaxException {
		PayDto payDto = payDao.find(payNo);
		if(payDto == null) {
			
		}
		
		int cancelAmount = payDao.calculateCancelAmountByOracle(payNo);
		if(cancelAmount == 0) {
			
		}
		KakaoPayCancelRequestVO requestVO = KakaoPayCancelRequestVO.builder()
				.tid(payDto.getPayTid())
				.cancel_amount(cancelAmount)
				.build();
		
		KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(requestVO);

	
		//보유 DB의 정보 삭제로 수정(pay,pay_detail)
		payDao.cancelAll(payNo);
		
		attr.addAttribute("payNo",payNo);
		
		return "redirect:more";
	}
	
	@GetMapping("/history2")
	public String history2(Model model) {
		model.addAttribute("list",payDao.treeList());
		return "pay/list2";
	}
}
