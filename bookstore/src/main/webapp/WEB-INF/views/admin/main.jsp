<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/admin"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<div class="container w1000 m30">
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>관리자 페이지</h2>
					<div class="breadcrumb__option">
						<a href="http://localhost:8080/bookstore/admin/">Home</a> <span>관리자
							페이지</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<nav class="text-center header__menu">
	<ul>
		<li class="active"><a href="${root}/">MAIN</a>
		<li><a href="${root}/book">도서 관리</a>
			<ul class="header__menu__dropdown">
				<li><a href="${root}/lib-book">도서관 도서</a></li>
				<li><a href="${root}/store-book">스토어 도서</a></li>
				<li><a href="${root}/used-book">중고 도서</a></li>
			</ul></li>
						<li><a href="${root}/lib">도서관 관리</a></li>
						<li><a href="${root}/member">회원 관리</a></li>
						<li><a href="${root}/delivery">배송 관리</a></li>
						<li><a href="/bookstore/board/qna_list">1:1 관리</a></li>
						<li><a href="/bookstore/board/used_book_list">중고 도서 등록</a></li>
						<li><a href="${root}/faq">faq 관리</a></li>
					</ul>
				</nav>

<div class="container">
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="row float-container mt-1" id="app">

				<h3>관리자 메인</h3>

			</div>
			<script src="https://unpkg.com/vue@next"></script>
			<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
			<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

			<script>
	const app = Vue.createApp({
		data(){
			return {
			};
		},
		
		computed:{
		},
		
		methods:{
		},
		
		created(){
		},
	});
	app.mount("#app");
</script>
<%-- 			<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include> --%>