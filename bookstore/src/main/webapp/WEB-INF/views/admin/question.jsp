<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>1:1 문의 관리</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/bookstore/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<div class="row float-container mt-1" id="app">

		<div class="float-left" style="width:100%">

			<div class="row">
				<table class="table table-border">
					<thead>
						<tr class="text-center center">
							<th>번호</th>
							<th width="50%" class="center">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="boardDto" items="${list}">
						<tr>
							<td>${boardDto.boardNo}</td>
							<td class="left">
								<a href="${root}/bookstore/board/detail/${boardDto.boardNo}">${boardDto.boardTitle}</a>
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
							<td>
							수정중
<%-- 								<c:choose> --%>
<!-- 									답변 달렸는지 안 달렸는지 여부 처리 -->
<%-- 								</c:choose> --%>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row center pagination">
				<div class="col" style="float: none, margin:0 auto">
				
				<c:if test="${p > 1}">
					<c:choose>
						<c:when test="${search}">
							<a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=1&s=${s}">&laquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<a href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<!-- 숫자 링크 영역 -->
				<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
					<c:choose>
						<c:when test="${search}">
							<c:choose>
								<c:when test="${i == p}">
									<a class="active" href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<a class="active" href="list?p=${i}&s=${s}">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="list?p=${i}&s=${s}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<!-- 다음 버튼 영역 -->
				<c:if test="${endBlock < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<a href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${endBlock+1}&s=${s}">&gt;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${lastPage}&s=${s}">&raquo;</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			
			</div>
			
			<div class="row center text-center">
				<!-- 검색창 -->
				<div class="col" style="float: none, margin:0 auto">
					<form action="list" method="get">
						<select name="type" class="select-primary">
							<option value="board_title" <c:if test="${type == 'board_title'}">selected</c:if>>제목</option>
							<option value="board_content" <c:if test="${type == 'board_content'}">selected</c:if>>내용</option>
							<option value="board_writer" <c:if test="${type == 'board_writer'}">selected</c:if>>작성자</option>
						</select>

						<input type="search" name="keyword" placeholder="검색어를 입력하세요." required class="form-input input-round" value="${keyword}">

						<button type="submit" class="site-btn">검색</button>
					</form>
				</div>
			</div>
			</div>
		</div>

	</div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
	const app = Vue.createApp({
		data(){

		},
				
			};
		},

		computed:{

		},
		methods:{

		},
		created(){

		},
	});
	app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>