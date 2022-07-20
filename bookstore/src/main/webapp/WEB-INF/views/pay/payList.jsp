<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- Breadcrumb Section Begin -->
	<div class="container w1000 m30">
<section class="breadcrumb-section set-bg"
   style="background-color: #F09F00;">

   <div class="container">
      <div class="row">
         <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
               <h2>결제 내역</h2>
               <div class="breadcrumb__option">
                  <a href="./index.html">Home</a> <span>결제 내역</span>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Breadcrumb Section End -->
 <nav class="text-center header__menu">
                        <ul>
                            <li class="active"><a href="${root}/mypage">내 정보</a></li>
							<li><a href="${root}/information">개인정보 변경</a></li>
							<li><a href="${root}/password">비밀번호 변경</a></li>
							<li><a href="${pageContext.request.contextPath}/pay/payList">주문목록</a>
								<ul class="header__menu__dropdown">
										<li><a href="${pageContext.request.contextPath}/admin/booking1">대여 목록</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/booking2">반납 목록</a></li>
									</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/board/used_book_list?type=board_head&keyword=중고">중고 판매 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1 문의내역</a></li>
                        </ul>
                    </nav>
	<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				
				<!-- 도서 목록 -->
<!-- 				<div class="row"> -->

					<div class="shoping__cart__table">
						<table >
							<thead>
								<tr>
									<th class="shoping__product" colspan = "2" width="20%">결제상품</th>
<!-- 									<th></th> -->
									<th>결제가격</th>
									<th>배송주소</th>
									<th>배송상태</th>
								</tr>
							</thead>

								<tbody>
								<!-- payList 반복문 -->
								<c:forEach var="payDto" items="${payList }">
									<tr>
										<td style="text-align: left">
											<strong>${payDto.payName }</strong>
										</td>
										<td>
										</td>
										<td class="text-center">
											<h5>${payDto.payTotal }원</h5>
										</td>
										<td class="text-center" width="30%">
											<div style="text-align:left;">
											${payDto.payPost }
											</div>
										</td>
										<td> 
											<strong >${payDto.payDelivery }</strong>
										</td>
									</tr>
									</c:forEach>										
									
								</tbody>
						</table>
<!-- 					</div> -->


				</div>




				


			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
                        
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
