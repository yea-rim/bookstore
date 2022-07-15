<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서관 목록</h2>
					<div class="breadcrumb__option">
						<a href="${root}/">Home</a> <span>북스토어</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->


				<section class="product spad">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 col-md-12">

								<div class="filter__item">
									<div class="row">
										도서관 자리
									</div>
								</div>



								<!-- 도서 목록 -->
								<div class="row">도서관 자리</div>



								<!-- 타입이나 키워드 등 검색 조회 늘어나면 수정 할 수도 있음 -->
								<div class="product__pagination">
									<c:if test="${p > 1 }">
										<c:choose>
											<c:when test="${search }">
												<a href="list?page=1&size=${size}&type=${type}&keyword=${keyword}">&laquo;</a>
											</c:when>
											<c:otherwise>
												<a href="list?page=1&size=${size }">&laquo;</a>
											</c:otherwise>
										</c:choose>
									</c:if>

									<c:if test="${startBlock > 1}">
										<c:choose>
											<c:when test="${search}">
												<a href="list?page=${startBlock-1}&size=${size}&type=${type}&keyword=${keyword}">&laquo;</a>
											</c:when>
											<c:otherwise>
												<a href="list?page=${startBlock-1}&size=${size}">&laquo;</a>
											</c:otherwise>
										</c:choose>
									</c:if>

									<!-- 숫자 링크 영역 -->
									<c:forEach var="i" begin="${startBlock}" end="${endBlock}"
										step="1">
										<c:choose>
											<c:when test="${search}">
												<c:choose>
													<c:when test="${i == page}">
														<a class="active" href="list?page=${i}&size=${s}&type=${type}&keyword=${keyword}">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="list?page=${i}&s=${size}&type=${type}&keyword=${keyword}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${i == page}">
														<a class="active" href="list?page=${i}&size=${size}">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="list?page=${i}&size=${size}">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<!-- 다음 버튼 영역 -->
									<c:if test="${endBlock < lastPage}">
										<c:choose>
											<c:when test="${search}">
												<a href="list?page=${endBlock+1}&size=${size}&type=${type}&keyword=${keyword}">&gt;</a>
											</c:when>
											<c:otherwise>
												<a href="list?page=${endBlock+1}&size=${size}">&gt;</a>
											</c:otherwise>
										</c:choose>
									</c:if>

									<c:if test="${page < lastPage}">
										<c:choose>
											<c:when test="${search}">
												<a href="list?page=${lastPage}&size=${size}&type=${type}&keyword=${keyword}">&raquo;</a>
											</c:when>
											<c:otherwise>
												<a href="list?page=${lastPage}&size=${size}">&raquo;</a>
											</c:otherwise>
										</c:choose>
									</c:if>
									<!-- 템플릿 다음버튼 아이콘임(사용하려면 위에코드 수정해서 사용하자
									<a href="${root}/"><i class="fa fa-long-arrow-right"></i></a>
									-->
								</div>
								<!-- 페이지네이션  끝div -->


							</div>
						</div>
					</div>
				</section>
				<!-- Product Section End -->

		<script src="https://unpkg.com/vue@next"></script>
		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

		<script>
	const app = Vue.createApp({
		data(){
			return {

			};
		},
		
		computed:{

		},
		
		methods:{

		},
		watch:{
			currentData:{
				handler(v){
					console.log(v);
					console.log("value changed");
					console.log(this.currentData);
				},
				deep:true,
			},
		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/book/",
					method:"get"
				})
				.then((resp)=>{
					//console.log(resp);
					//console.log(resp.data);
					this.bookList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>