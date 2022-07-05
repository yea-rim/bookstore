<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- fmt에서는 formatDate, formatNumber를 사용한다 --%>

<h1>결제 내역 상세 페이지</h1>

<h2>대표 정보</h2>

<ul>
	<li>결제 번호 : ${payDto.payNo}</li>
	<li>거래 번호 : ${payDto.payTid}</li>
	<li>거래 상품명 : ${payDto.payName}</li>
	<li>거래 금액 : ${payDto.payTotal}</li>
	<li>거래 상태 : ${payDto.payStatus }</li>
	<li>거래 시각 : ${payDto.payTime}</li>
	<li>
		거래 시각 : 
		<fmt:formatDate 
				value="${payDto.payTime}" 
				pattern="y년 M월 d일 E a h시 m분 s초"></fmt:formatDate>
	</li>
</ul>

<c:if test="${payDto.payStatus != '취소' }">
	<a href="cancel_all?payNo=${payDto.payNo }">전체 취소</a>
</c:if>

<h2>상세 내역</h2>

<c:forEach var="payDetailDto" items="${payDetailList}">
	<div>
		<h3>
			이름 : ${payDetailDto.payDetailName} , 
			개수 : ${payDetailDto.payDetailQuantity}개 , 
			금액 : ${payDetailDto.payDetailPrice}원
			<c:if test="${payDetailDto.payDetailStatus != '취소' }">
				<a href = "cancel?payDetailNo=${payDetailDto.payDetailNo }">취소하기</a>
			</c:if>
		</h3>
	</div>
</c:forEach>

<h2>API 조회 결과</h2>

<ul>
	<li>결제 상태 : ${responseVO.status}</li>
	<li>결제 방법 : ${responseVO.payment_method_type}</li>
</ul>

<h3>결제 진행 단계</h3>
<ul>
	<c:forEach var="paymentActionDetailVO" items="${responseVO.payment_action_details}">
		<li>
			[${paymentActionDetailVO.payment_action_type}]
			금액 : ${paymentActionDetailVO.amount}원
			(${paymentActionDetailVO.approved_at})

		</li>
	</c:forEach>
</ul>
