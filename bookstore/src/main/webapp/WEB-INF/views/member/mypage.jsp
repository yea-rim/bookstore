<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}/member"></c:set>
<div class="container w400 m30">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>마이페이지</h2>
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
                            <li class="active"><a href="${root}/mypage">내 정보</a></li>
							<li><a href="${root}/information">개인정보 변경</a></li>
							<li><a href="${root}/password">비밀번호 변경</a></li>
							<li><a href="${root}/delivery">주문목록</a></li>
							<li><a href="${root}/question">장바구니</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1 문의내역</a></li>
                        </ul>
                    </nav>
	
	<!-- 프로필 이미지 -->

	
	<div class="row">
		<table class="table table-border table-hover">
		<tr>
			<th>프로필 사진</th>
				<td><img src="${pageContext.request.contextPath}${profileUrl}" width="150" class="img img-circle img-shadow"></td>
		</tr>
			<tr>
				<th width="30%">아이디</th>
				<td>${memberDto.memberId}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${memberDto.memberNick}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${memberDto.memberBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${memberDto.memberPhone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberDto.memberEmail}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					[${memberDto.memberPost}]
					${memberDto.memberBasicAddress}
					${memberDto.memberDetailAddress}
				</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>${memberDto.memberPoint}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${memberDto.memberGrade}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${memberDto.memberJoindate}</td>
			</tr>
			<tr>
				<th>최종 접속일</th>
				<td>${memberDto.memberLogindate}</td>
			</tr>
		</table>
	</div>
	

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>