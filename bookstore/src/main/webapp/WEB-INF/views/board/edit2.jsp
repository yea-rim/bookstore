<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- PathVariable 형태일 경우 -->
<form method="post">

	<div class="container w800 m30">
	    <div class="row center">
	        <h1>게시글 수정</h1>
	    </div>
	    <div class="row">
	        <label>말머리</label>
	        <select name="boardHead" class="form-input fill input-round">
				<option value=""  <c:if test="${boardDto.boardHead == null}">selected</c:if>>선택</option>
				<option  <c:if test="${boardDto.boardHead == '정보'}">selected</c:if>>정보</option>
				<option  <c:if test="${boardDto.boardHead == '유머'}">selected</c:if>>유머</option>
				<option  <c:if test="${boardDto.boardHead == '공지'}">selected</c:if>>공지</option>
			</select>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round" value="${boardDto.boardTitle}">
	    </div>
	    <div class="row">
	        <label>내용</label>
	        <textarea name="boardContent" required class="form-input fill input-round" rows="12">${boardDto.boardContent}</textarea>
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">수정</button>
	    </div>
	    <div class="row">
	        <a href="${pageContext.request.contextPath}/board/list" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    