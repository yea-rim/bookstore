<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="saveIdExist" value="${cookie.saveId != null}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
#content1{
float:left;
width:60%

}
#sidebar1{
float:right;
width:40%

}
#footer1{
clear:both;
}
.hight1{
 Hight= 200;
 }
</style>


<form action="login" method="post">
	<input type="hidden" name="referer" value="${referer}">

    <div class="container w400 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>로그인</h2>
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
    <br>
    	
		<div id="wrap">
		<div id="content1">
		<div align="right">
            <label>아이디　</label>
    		<input type="text" name="memberId" required class="form-input fill input-round" autocomplete="off" value="${cookie.saveId.value}">
        </div>
        <div align="right">
            <label>비밀번호</label>
            <input type="password" name="memberPw" required class="form-input fill input-round">
        </div>
        </div>
        <div id="sidebar1">
        
        <input type="submit" value="로그인" class="btn btn-primary fill" style="WIDTH: 50pt; HEIGHT: 50pt"; float:left;>
        </div>
        </div>
        <div id="footer1">
        <div align="center">
        	<label>
        		<c:choose>
        			<c:when test="${saveIdExist}">
		        		<input type="checkbox" name="remember" checked>
        			</c:when>
        			<c:otherwise>
        				<input type="checkbox" name="remember">
        			</c:otherwise>
        		</c:choose>
        		아이디 저장하기
        	</label>
        </div>
        </div>
        <div align="center">
            <a href="find_id" class="link">아이디가 기억나지 않아요</a>
        </div>
        <div align="center">
            <a href="find_pw" class="link">비밀번호가 기억나지 않아요</a>
        </div>
        <br>
        
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">로그인 정보가 일치하지 않습니다</h3>	
		</div>
		</c:if>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>