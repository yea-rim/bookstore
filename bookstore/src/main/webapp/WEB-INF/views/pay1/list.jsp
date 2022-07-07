<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <h1>단품 구매 예제</h1>
    
<c:forEach var ="storeDto" items="${list }">
		<div>
		<!--이름을 가져오려면 프론트적으로 파라미터로 가져오기? 아마 조인해서 테이블하나를만들던가vo?를 만들던가 해야할듯 -->
			이름 : ${storeDto.bookTitle },
			가격 : ${storeDto.storePrice }원,
			<a href = "pay1_purchase?storeBookNo=${storeDto.storeBookNo }">구매하기</a>
		</div>
</c:forEach>    