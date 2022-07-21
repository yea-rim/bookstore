<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
	<div class="container w1000 m30">
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서 목록</h2>
					<div class="breadcrumb__option">
						<a href="${root}/">Home</a> <span>북스토어</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<nav class="text-center header__menu" style="padding-top:30px;">
	<ul>
		<li>
		<a href="${pageContext.request.contextPath}/book/list1?typeNumber1=10&typeNumber2=19">소설</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=11">로맨스 소설</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=12">추리 소설</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=13">전쟁/역사 소설</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=14">공포/스릴러 소설</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=15">판타지 소설</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=20&typeNumber2=29">자기계발</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=21">경제/부동산</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=22">시간 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=23">인간 관계</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=24">대화/협상</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=30&typeNumber2=39">시/에세이</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=31">한국시</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=32">외국시</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=33">성공 에세이</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=34">여행 에세이</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=35">연애 에세이</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=40&typeNumber2=49">인문</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=41">시사/사회</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=42">경제/경영</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=43">종교</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=44">행정/정치</a></li>
			</ul></li>  
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=50&typeNumber2=59">컴퓨터</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=51">웹/홈페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=52">컴퓨터 입문/활용</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=53">프로그래밍 언어</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=54">개발/OS/데이터베이스</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=55">네트워크 보안</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=56">컴퓨터 공학</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=60&typeNumber2=69">참고서</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=61">국어/문학</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=62">외국어</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=63">수학</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=64">고시</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=65">공무원</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=70&typeNumber2=79">어린이</a></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=80&typeNumber2=89">취미</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=81">가정/육아</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=82">건강</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=83">여행</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=84">요리</a></li>
			</ul></li>
		<li><a href="${pageContext.request.contextPath}/book/list1?typeNumber1=90&typeNumber2=99">만화</a>
			<ul class="header__menu__dropdown">
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=91">학원 만화</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=92">스포츠 만화</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=93">순정 만화</a></li>
				<li><a href="${pageContext.request.contextPath}/book/list2?typeNumber1=94">기타 만화</a></li>
			</ul></li>
	</ul>
</nav>
<!-- Product Section Begin -->
<section class="product spad" style="padding-top:50px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
								<span>Sort By</span> <select>
									<option value="0">Default</option>
									<option value="0">Default</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${count }</span> books found
								</h6>
							</div>
						</div>
						<div class="col-lg-4 col-md-3">
							<div class="filter__option">
								<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
							</div>
						</div>
					</div>
				</div>
				<!-- 도서 목록 -->
				<div class="row">

					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th></th>
									<th class="shoping__product" colspan="3" width="85%"></th>
									<th></th>
								</tr>
							</thead>
						
							<c:forEach var="bookDto" items="${list}">
								<tbody>
									<tr>
										<td class="text-center"><img src="${bookDto.bookImage}"></td>
										<td style="text-align: left">
											<h4 class="m-3">
												<a href="${root}/book/detail?bookNo=${bookDto.bookNo}">${bookDto.bookTitle}</a>
											</h4>
											<h6 class="m-3">${bookDto.bookDescription}</h6>
										</td>
										<td class="text-center">
											<a href = "${pageContext.request.contextPath}/basket2?bookNo=${bookDto.bookNo}&storeAmount=1" id="demo"><button  class="btn site-btn m-2">
												<i class="fa fa-shopping-bag"></i>
											</button></a>
											<a href = "${pageContext.request.contextPath}/pay?bookNo=${bookDto.bookNo}&storeAmount=1"><button class="btn site-btn m-2">
												<i class="fa fa-credit-card"></i>
											</button></a>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>


				</div>



<!-- 				pagination -->
				<!-- 타입이나 키워드 등 검색 조회 늘어나면 수정 할 수도 있음 -->
				<div class="product__pagination text-center">
					<c:if test="${page > 1 }">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list2?page=1&size=${size}&typeNumber1=${typeNumber1}">&laquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list2?page=1&size=${size }">&laquo;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${startBlock > 1}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list2?page=${startBlock-1}&size=${size}&typeNumber1=${typeNumber1}">&laquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list2?page=${startBlock-1}&size=${size}">&laquo;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<!-- 숫자 링크 영역 -->
					<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
						<c:choose>
							<c:when test="${search}">
								<c:choose>
									<c:when test="${i == page}">
										<a class="active"
											href="list2?page=${i}&size=${size}&typeNumber1=${typeNumber1}">${i}</a>
									</c:when>
									<c:otherwise>
										<a
											href="list2?page=${i}&s=${size}&typeNumber1=${typeNumber1}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${i == page}">
										<a class="active" href="list2?page=${i}&size=${size}">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="list2?page=${i}&size=${size}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 버튼 영역 -->
					<c:if test="${endBlock < lastPage}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list2?page=${endBlock+1}&size=${size}&typeNumber1=${typeNumber1}">&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="list2?page=${endBlock+1}&size=${size}">&gt;</a>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:if test="${page < lastPage}">
						<c:choose>
							<c:when test="${search}">
								<a
									href="list2?page=${lastPage}&size=${size}&typeNumber1=${typeNumber1}">&raquo;</a>
							</c:when>
							<c:otherwise>
								<a href="list2?page=${lastPage}&size=${size}">&raquo;</a>
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
<script type = "text/javascript">
	document.getElementById("demo").addEventListener('click', function () {

		alert("장바구니에 등록되었습니다.");

		});
	</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

