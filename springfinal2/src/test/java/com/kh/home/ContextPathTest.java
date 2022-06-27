package com.kh.home;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class ContextPathTest {
	
//	@Value("${project.context-path}")
//	private String contextPath;
//	@Value("${project.port}")
//	private int port;

	@Test
	public void test() {
		log.debug("path = {}", 
				ServletUriComponentsBuilder
										.fromCurrentContextPath()//protocol + host + port + context
//										.port(port)
//										.path(contextPath)
										.path("/member/reset")
										.queryParam("memberId", "test")
										.queryParam("cert", "012345")
									.toUriString());
	}
	
}





