<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="find_id" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>아이디 찾기</h1>
	    </div>
	    <div class="row">
	        <label>닉네임</label>
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
	        <button type="submit" class="btn btn-primary fill">아이디 찾기</button>
	    </div>
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>