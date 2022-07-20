<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.inner {
	position: absolute;
	left: 75%;
	transform: translateX(-50%);
	z-index: 999;
}

.board1 {
	width: 400px;
}

/* absolute */
.outer, .inner {
	position: relative
}

.absolute1 {
	position: absolute;
	bottom: 0;
	right: 50
}
</style>
	<div class="container w1000 m30">
	    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항</h2>
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
	<div class="row center m30">

	</div>	
	
	<div class="row">
		<table class="table table-border">
			<thead>
			<tbody align="center">
				<tr>
					<th width="50%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
				<c:forEach var="boardDto" items="${list2}">
				<tr>
					<td class="left">
					
					
						<!-- 
							게시글 제목 링크
							[1] 일반 파라미터 방식의 링크
							[2] 경로 변수 방식의 링크 
						-->
						
						<!-- [1] -->
						<%--
						<a href="detail?boardNo=${boardDto.boardNo}">
							${boardDto.boardTitle}
						</a>
						 --%>
							
						<!-- [2] -->
						<a href="detail/${boardDto.boardNo}">
							${boardDto.boardTitle}
						</a>
						

					<td>
						<c:choose>
							<c:when test="${boardDto.boardWriter == null}">
								(탈퇴한 사용자)
							</c:when>
							<c:otherwise>
								${boardDto.boardWriter}
							</c:otherwise>
						</c:choose>
					</td>					
					<td>${boardDto.boardTime}</td>
					<td>${boardDto.boardReadcount}</td>
					
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div align="center">
	
		<c:if test="${p > 1}">
			<c:choose>
				<c:when test="${search2}">
					<a href="notice_list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="notice_list?p=1&s=${s}">&laquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<c:if test="${startBlock > 1}">
			<c:choose>
				<c:when test="${search2}">
					<a href="notice_list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="notice_list?p=${startBlock-1}&s=${s}">&laquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<!-- 숫자 링크 영역 -->
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
			<c:choose>
				<c:when test="${search2}">
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="notice_list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="notice_list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="notice_list?p=${i}&s=${s}">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="notice_list?p=${i}&s=${s}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 버튼 영역 -->
		<c:if test="${endBlock < lastPage}">
			<c:choose>
				<c:when test="${search2}">
					<a href="notice_list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="notice_list?p=${endBlock+1}&s=${s}">&gt;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
		
		<c:if test="${p < lastPage}">
			<c:choose>
				<c:when test="${search2}">
					<a href="notice_list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="notice_list?p=${lastPage}&s=${s}">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
	<br>
<c:if test="${isAdmin}">
					<div align="right" >
			<a href="review_write" class="btn btn-primary" >글쓰기</a>
			</div>
</c:if>
		<!-- 검색창 -->
	<form action="review_list" method="get">
	  <div class="outer">
    <div class="inner">
		<div class="absolute1">
			<select name="type" class="form-input input-round">
				<option value="board_title"
					<c:if test="${type == 'board_title'}">selected</c:if>>제목</option>
				<option value="board_content"
					<c:if test="${type == 'board_content'}">selected</c:if>>내용</option>
				<option value="board_writer"
					<c:if test="${type == 'board_writer'}">selected</c:if>>작성자</option>
			</select> <input type="text" name="keyword" autocomplete="off"
				placeholder="검색어 입력" required class="board1"
				value="${keyword}"> <input type="submit" value="검색"
				class="btn btn-primary">
		</div>
		</div>
		</div>
	</form>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

