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
					<h2>도서관 목록</h2>
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

				<!-- 도서 대여 페이지 -->
				<div class="row">도서관 도서 대여</div>

			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


