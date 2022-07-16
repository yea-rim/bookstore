<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/member"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="information" method="post">
<div class="container w400 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>개인정보 변경</h2>
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
							<li><a href="${root}/delivery">주문목록</a></li>
							<li><a href="${root}/question">장바구니</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1 문의내역</a></li>
                        </ul>
                    </nav>
   	<div class="row">
		<table class="table table-border table-hover">
		<tr>
	        <th>닉네임</th>
	        <td><input type="text" name="memberNick" autocomplete="off" required class="form-input fill input-round" value="${memberDto.memberNick}"></td>
	     </tr>
		<tr>
	        <th>생년월일</th>
	       <td><input type="date" name="memberBirth" autocomplete="off" required class="form-input input-round" value="${memberDto.memberBirth}"></td>
	    </tr>
		<tr>
	        <th>전화번호</th>
	        <td><input type="tel" name="memberPhone" autocomplete="off" required class="form-input fill input-round" value="${memberDto.memberPhone}"></td>
		</tr>
		<tr>
	        <th>이메일</th>
	       <td><input type="email" name="memberEmail" autocomplete="off" class="form-input fill input-round" value="${memberDto.memberEmail}"></td>
	     </tr>
		<tr>
	        <th>주소</th>
	       <td><input type="text" name="memberPost" autocomplete="off" size="6" maxlength="6" class="form-input input-round" placeholder="우편번호" value="${memberDto.memberPost}">
	        <a href="#" class="link link-btn">검색</a>
	        <br>
	        <input type="text" name="memberDetailAddress" autocomplete="off" class="form-input fill input-round" placeholder="상세주소" value="${memberDto.memberDetailAddress}"></td>
	      </tr>
		<tr>
	        <th>비밀번호 확인</th>
	        <td><input type="password" name="memberPw" required class="form-input fill input-round"></td>
		</tr>
		<tr>
		<th></th>
	      <td><div align="right"><button type="submit" class="btn btn-primary fill">정보 변경하기</button></div></td>
		</tr>
	    		</table>
	</div>
	    
	    <c:if test="${param.error != null}">
		<div class="row center" >
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>