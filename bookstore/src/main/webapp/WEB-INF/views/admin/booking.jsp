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
               <h2>대여 목록</h2>
               <div class="breadcrumb__option">
                  <a href="./index.html">Home</a> <span>대여 목록</span>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Breadcrumb Section End -->
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
									<th class="shoping__product" colspan = "2" width="20%">도서명</th>
<!-- 									<th></th> -->
									<th>대여날짜</th>
									<th>도서관명</th>
								</tr>
							</thead>

								<tbody>
								<!-- payList 반복문 -->
								<c:forEach var="bookingDto" items="${bookingList }">
									<tr>
										<td style="text-align: left">
											<strong>${bookingDto.bookingBookTitle }</strong>
										</td>
										<td>
										</td>
										<td class="text-center">
											<h5>${bookingDto.bookingDate }</h5>
										</td>
										<td class="text-center" width="30%">
												${bookingDto.bookingLibrary }
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
