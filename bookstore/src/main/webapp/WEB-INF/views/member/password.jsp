<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/member"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="password" method="post">
	<div class="container w1000 m30">

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
                            <nav class="text-center header__menu">
                        <ul>
                            <li><a href="${root}/mypage">내 정보</a></li>
							<li><a href="${root}/information">개인정보 변경</a></li>
							<li><a href="${root}/password">비밀번호 변경</a></li>
							<li><a href="${pageContext.request.contextPath}/payList">주문목록</a></li>
							<li><a href="${root}/question">장바구니</a></li>
							<li><a href="${pageContext.request.contextPath}/board/used_book_list?type=board_writer&keyword=${memberDto.memberId}">중고 판매 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1 문의내역</a></li>
                        </ul>
                    </nav>
   	<div class="row">
		<table class="table table-border table-hover">
		<tr>
			<th>현재 비밀번호</th>
	        <td><input type="password" name="currentPw" required class="form-input fill input-round"></td>
	     </tr>
		<tr>
			<th>바꿀 비밀번호</th>
	        <td><input type="password" name="changePw" required class="form-input fill input-round"></td>
		</tr>
		<tr>
			<th></th>
	      <td><div align="right"><button type="submit" class="btn btn-primary fill">비밀번호 변경하기</button></div></td>
		</tr>
		</table>
	</div>
	    
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
