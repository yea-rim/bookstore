<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>단품 구매 예제 - 구매페이지</h1>

<hr>

	<h2>도서 정보</h2>
	<h2>도서명 : ${storeDto.bookTitle }</h2>
	<h2>가격 : ${storeDto.storePrice }원</h2>
	
<hr>

<form method = "post">
		<input type = "hidden" name = "storeBookNo" value = "${storeDto.storeBookNo }">
		<input type = "number" name = "quantity" value = "1" min = "1" required>
		<input type = "submit" value = "구매하기" formaction = "pay1_purchase">
		<input type = "submit" value = "장바구니" formaction = "pay1_basket">
		
</form>
	