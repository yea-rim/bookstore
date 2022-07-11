<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="password" method="post">
	<div class="container w400 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>비밀번호 변경</h2>
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
    
	    <div class="row">
	        <label>현재 비밀번호</label>
	        <input type="password" name="currentPw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>바꿀 비밀번호</label>
	        <input type="password" name="changePw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 변경하기</button>
	    </div>
	    
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
