package com.trio.bookstore;

import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.trio.bookstore.service.KakaoPayService;
import com.trio.bookstore.vo.KakaoPayReadyRequestVO;
import com.trio.bookstore.vo.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class KakaoPayReadyTest {
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Test
	public void test() throws URISyntaxException {
		KakaoPayReadyResponseVO responseVO = 
									kakaoPayService.ready(
											KakaoPayReadyRequestVO.builder()
											.partner_order_id(UUID.randomUUID().toString())
											.partner_user_id("qwer1234")
											.item_name("인플레이션에서 살아남기")
											.quantity(1)
											.total_amount(15500)
										.build()	
										);
		log.debug("responseVO ={}",responseVO);
		log.debug(responseVO.getNext_redirect_pc_url());

	}
}
