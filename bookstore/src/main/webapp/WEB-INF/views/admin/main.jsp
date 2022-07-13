<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}/admin"></c:set>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>관리자 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="http://localhost:8080/bookstore/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                    <nav class="text-center header__menu">
                        <ul>
                            <li class="active"><a href="${root}/book">도서 관리</a>
			                    <ul class="header__menu__dropdown">
									<li><a href="${root}/lib-book">도서관 도서</a></li>
									<li><a href="${root}/store-book">스토어 도서</a></li>
									<li><a href="${root}/used-book">중고 도서</a></li>
			                    </ul>
			                </li>	
							<li><a href="${root}/lib">도서관 관리</a></li>
							<li><a href="${root}/member">회원 관리</a></li>
							<li><a href="${root}/delivery">배송 관리</a></li>
							<li><a href="${root}/question">1:1 관리</a></li>
							<li><a href="${root}/notice">공지사항 관리</a></li>
							<li><a href="${root}/faq">faq 관리</a></li>
                        </ul>
                    </nav>

	<h2>관리자 메인페이지</h2>

<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>