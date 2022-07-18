<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서 목록</h2>
					<div class="breadcrumb__option">
						<a href="${root}/">Home</a> <span>북스토어</span>
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
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
								<span>Sort By</span> <select>
									<option value="0">Default</option>
									<option value="0">Default</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>16</span> Products found
								</h6>
							</div>
						</div>
						<div class="col-lg-4 col-md-3">
							<div class="filter__option">
								<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 도서 목록 -->
				<div class="row">

					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th></th>
									<th class="shoping__product" colspan="3" width="85%"></th>
									<th></th>
								</tr>
							</thead>

							<c:forEach var="bookDto" items="${list}">
								<tbody>
									<tr>
										<td class="text-center"><img src="${bookDto.bookImage}"></td>
										<td style="text-align: left">
											<h4 class="m-3">
												<a href="${root}/book/detail?bookNo=${bookDto.bookNo}">${bookDto.bookTitle}</a>
											</h4>
											<h6 class="m-3">${bookDto.bookDescription}</h6>
										</td>
										<td class="text-center">
											<button class="btn site-btn m-2">
												<i class="fa fa-shopping-bag"></i>
											</button>
											<button class="btn site-btn m-2">
												<i class="fa fa-credit-card"></i>
											</button>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>


				</div>




				<!-- 타입이나 키워드 등 검색 조회 늘어나면 수정 할 수도 있음 -->
				<div class="product__pagination text-center">
					<c:if test="${p > 1 }">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list?page=1&size=${size}&type=${type}&keyword=${keyword}">&laquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list?page=1&size=${size }">&laquo;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${startBlock > 1}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list?page=${startBlock-1}&size=${size}&type=${type}&keyword=${keyword}">&laquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list?page=${startBlock-1}&size=${size}">&laquo;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<!-- 숫자 링크 영역 -->
					<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
						<c:choose>
							<c:when test="${search}">
								<c:choose>
									<c:when test="${i == page}">
										<a class="active"
											href="list?page=${i}&size=${s}&type=${type}&keyword=${keyword}">${i}</a>
									</c:when>
									<c:otherwise>
										<a
											href="list?page=${i}&s=${size}&type=${type}&keyword=${keyword}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${i == page}">
										<a class="active" href="list?page=${i}&size=${size}">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="list?page=${i}&size=${size}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 버튼 영역 -->
					<c:if test="${endBlock < lastPage}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list?page=${endBlock+1}&size=${size}&type=${type}&keyword=${keyword}">&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="list?page=${endBlock+1}&size=${size}">&gt;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${page < lastPage}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list?page=${lastPage}&size=${size}&type=${type}&keyword=${keyword}">&raquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list?page=${lastPage}&size=${size}">&raquo;</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<!-- 템플릿 다음버튼 아이콘임(사용하려면 위에코드 수정해서 사용하자
                        <a href="${root}/"><i class="fa fa-long-arrow-right"></i></a>
                          -->
				</div>
				<!-- 페이지네이션  끝div -->


			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

