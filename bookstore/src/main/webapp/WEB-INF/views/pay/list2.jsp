<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>모든 거래내역 출력</h1>

<ul class="pay-history">
	<c:forEach var="payListVO" items="${list}">
	<li>
		<!-- 대표정보(PayDto) 출력 -->
		이름 : ${payListVO.payDto.payName},
		금액 : ${payListVO.payDto.payTotal}원
		<fmt:formatDate value="${payListVO.payDto.payTime}" pattern="yyyy-MM-dd"/>
		<fmt:formatNumber value="${payListVO.payDto.payTotal}" groupingUsed="true"/>
		<fmt:formatNumber value="${payListVO.payDto.payTotal}" pattern="#,##0.00" />
		<!-- 더보기  -->
		<a href = "more?payNo=${payListVO.payDto.payNo }">더보기</a>
		
		<!-- 상세정보(PayDetailDto) 출력 -->
		<ul>
			<c:forEach var="payDetailDto" items="${payListVO.payDetailList}">
			<li>
				상품명 : ${payDetailDto.payDetailName},
				금액 : ${payDetailDto.payDetailPrice}원
			</li>
			</c:forEach>
		</ul>
	</li>
	</c:forEach>
</ul>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		//.payment-history 밑에 있는 li를 클릭하면 바로 아래의 ul을 toggle한다
		//$(".payment-history > li").click(function(){});
		$(".pay-history").children("li").click(function(){
			//this == <li>
			$(this).children("ul").slideToggle();
		});
	});
</script>
