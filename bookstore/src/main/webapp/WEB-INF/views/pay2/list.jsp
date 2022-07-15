<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>묶음 상품 결제 예제</h1>

<div class="store-list">
	<c:forEach var="storeDto" items="${list}">
		<div class="store-item">
			<input type="checkbox" name="storeBookNo" value="${storeDto.storeBookNo}">
			번호 : ${storeDto.storeBookNo},
			이름 : ${storeDto.bookTitle},
			금액 : ${storeDto.storePrice}
			<input type="number" name="quantity" value="1">
		</div>
	</c:forEach>

	<button class="btn-purchase">구매하기</button>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		//목표 : 구매하기 버튼을 누르면 상품 목록 중 체크된 상품의 번호와 수량을 알아야 한다
		$(".btn-purchase").click(function(){
			if($("input[name=storeBookNo]:checked").length == 0) return;
			
			//form을 만들고 hidden input을 추가한 뒤 전송
			//<form action="pay2_purchase" method="get">
			var form = $("<form>").attr("action", "pay2_purchase").attr("method", "post");
			
			var count = 0;
			$(".store-list").find(".store-item").each(function(index, element){
				//this == .store-item == element
				var checkbox = $(this).find("input[name=storeBookNo]");
				var countInput = $(this).find("input[name=quantity]");
				
				//check가 안된 경우는 차단
				if(checkbox.prop("checked") == false) return;
				
				//console.log(checkbox, countInput);
				var storeBookNo = checkbox.val();//전송될 번호 값
				var quantity = countInput.val();//전송될 수량 값
				
				var storeBookNoInput = $("<input>").attr("type", "hidden")
															.attr("name", "purchase["+count+"].storeBookNo")
															.val(storeBookNo);//번호 전송 태그
				var quantityInput = $("<input>").attr("type", "hidden")
															.attr("name", "purchase["+count+"].quantity")
															.val(quantity);//수량 전송 태그
				
				form.append(storeBookNoInput).append(quantityInput);
															
				count++;
			});
			
			$("body").append(form);//body에 form 추가
			//form.submit();//form 전송 명령
			
		});
	});
</script>
