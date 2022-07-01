<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w500 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>아이디 검색 결과</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/bookstore/">Home</a>
                            <span>북스토어</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
	<div class="row center">
		찾으시는 아이디는 ${findUserId} 입니다
	</div>
	<div class="row center m30">
		<h2><a href="login">로그인 하러가기</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="${pageContext.request.contextPath}">메인 페이지로 이동</a></h2>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>