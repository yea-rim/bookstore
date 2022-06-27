package com.trio.bookstore.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class BoardTestInterceptor implements HandlerInterceptor{
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		System.out.println(handler);
//		Map<String, Object> map = modelAndView.getModel();
//		System.out.println("startBlock = " + map.get("startBlock"));
//		System.out.println("endBlock = " + map.get("endBlock"));
//		System.out.println("lastPage = " + map.get("lastPage"));
//		System.out.println("p = " + map.get("p"));
//		System.out.println("s = " + map.get("s"));
//		System.out.println("type = " + map.get("type"));
//		System.out.println("keyword = " + map.get("keyword"));
	}
}
