<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
	
	<!-- 프로필 이미지 -->
	<div class="row center m30">
		<img src="${pageContext.request.contextPath}${profileUrl}"
				width="150" class="img img-circle img-shadow">
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
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
	
	<div class="row center m30">
		<h2><a href="password">비밀번호 변경</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="information">개인정보 변경</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="exit">탈퇴하기</a></h2>
	</div>
	<div class="row center m30">
	<h2><a href="http://localhost:8080/bookstore/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1문의 내역</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>