<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="find_pw" method="post">
	<div class="container w400 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>비밀번호 찾기</h2>
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
	        <label>아이디</label>
	        <input type="text" name="memberId" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>이름</label>
	        <input type="text" name="memberNick" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" required class="form-input input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 찾기</button>
	    </div>
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">입력한 정보와 일치하는 데이터가 없습니다</h3>
		</div>
		<% } %>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>