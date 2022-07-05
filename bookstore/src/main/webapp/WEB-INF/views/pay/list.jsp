<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <h1>결제 내역 조회</h1>
	    
    <ul>
    	<c:forEach var="payDto" items="${list }">
    		<li>
    			${payDto }
    			<a href = "more?payNo=${payDto.payNo }">더보기</a>
    		</li>
    	</c:forEach>
    </ul>