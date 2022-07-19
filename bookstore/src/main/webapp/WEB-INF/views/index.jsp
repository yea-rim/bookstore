<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!--     Banner Begin -->

<nav class="text-center header__menu">
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

<div class="banner m-3">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img
						src="https://blog.kakaocdn.net/dn/sAjmN/btrHEdCTlqx/bIMI1AHf1pvnWAe4Ry8Rg0/img.png"
						alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img
						src="https://blog.kakaocdn.net/dn/I6seM/btrHAIqRpgS/xHdkKRVueTe3wO6mqjUub1/img.png"
						alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!--     Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>도서관 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
							
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>북스토어 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>중고도서 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>도서 신상품</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li class="active" data-filter="*">전체 보기</li>
						<li data-filter=".lid">도서관</li>
						<li data-filter=".store">북스토어</li>
						<li data-filter=".used">중고 거래</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row featured__filter">
			<c:forEach var="bookDto" items="${list}">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${bookDto.bookImage}">
							<ul class="product__item__pic__hover lib">
								<!--  li><a href="${root}/"><i class="fa fa-heart"></i></a></li>-->
								<li><a href="${root}/book/detail?bookNo=${bookDto.bookNo}"><i
										class="fa fa-retweet"></i></a></li>
								<!--  li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>-->
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="${root}/book/detail?bookNo=${bookDto.bookNo}">${bookDto.bookTitle }</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- Featured Section End -->

<!-- Blog Section Begin -->
<!-- 감상평 -->
<section class="from-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title from-blog__title">
					<h2>감상평</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="image/blog/blog-1.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">Cooking tips make cooking simple</a>
						</h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et
							dolore magnam aliquam quaerat</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="image/blog/blog-2.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">6 ways to prepare breakfast for 30</a>
						</h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et
							dolore magnam aliquam quaerat</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="image/blog/blog-3.jpg" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="#">Visit the clean farm in the US</a>
						</h5>
						<p>Sed quia non numquam modi tempora indunt ut labore et
							dolore magnam aliquam quaerat</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>