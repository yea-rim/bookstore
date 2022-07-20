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
<hr>
<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>도서관 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=11" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>인플레이션에서 살아남기</h6>
								</div>
							</a>
							
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=25" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/863/22486331.jpg?type=m1&udate=20220609">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자가 되기 위해 꼭 알아야 하는 IT 용어</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=27" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/175/913/17591325.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>자바 개발자를 위한 97가지 제안</h6>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=28" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/159/865/15986525.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> IT 개발자의 영어 필살기</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=82" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/859/22485918.jpg?type=m1&udate=20220706"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>역행자</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
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
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=11" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>인플레이션에서 살아남기</h6>
									<span>20000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
									<span>14000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=21" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/213/679/21367904.jpg?type=m1&udate=20211217"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자로 살아남기</h6>
									<span>10000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=62" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/379/22537949.jpg?type=m1&udate=20220712"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>감정와해기법</h6>
									<span>16000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=28" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/159/865/15986525.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> IT 개발자의 영어 필살기</h6>
									<span>30000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=82" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/859/22485918.jpg?type=m1&udate=20220706"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>역행자</h6>
									<span>21000원</span>
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
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=113" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/453/22545323.jpg?type=m1&udate=20220701"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>원피스 102 (천왕산)</h6>
									<span>8500원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=126" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/696/22569622.jpg?type=m1&udate=20220705"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>나 혼자만 레벨업 6(만화) (만화)</h6>
									<span>11000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
									<span>14000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=139" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/056/22505675.jpg?type=m1&udate=20220705"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>너무 잘하려고 애쓰지 마라</h6>
									<span>15000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=25" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/863/22486331.jpg?type=m1&udate=20220609">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자가 되기 위해 꼭 알아야 하는 IT 용어</h6>
									<span>15000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=27" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/175/913/17591325.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>자바 개발자를 위한 97가지 제안</h6>
									<span>17000원</span>
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
<hr>
<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>도서관 새로 등록된 책</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=171" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/204/730/20473021.jpg?type=m1&udate=20210917">
								</div>
								<div class="latest-product__item__text">
									<h6>5년 후 나에게 Q&A a Day (오로라 Edition)</h6>
								</div>
							</a>
							
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=25" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/863/22486331.jpg?type=m1&udate=20220609">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자가 되기 위해 꼭 알아야 하는 IT 용어</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=170" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/986/22498606.jpg?type=m1&udate=20220702"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>한 컷 한국사 (사진으로 시대를 읽는다)</h6>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=169" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/621/22562147.jpg?type=m1&udate=20220701"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> 도쿄 큐레이션 (에디터 관찰자 시점으로 전하는 6년의 기록)</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=167" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/128/012/12801235.jpg?type=m1&udate=20200613"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>백년 목 (100년 가는 목 만드는 단 하나의 방법)</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=166" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/207/539/20753912.jpg?type=m1&udate=20220614"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>밝은 밤 (최은영 첫 장편소설)</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>북스토어 새로 등록된 책</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=163" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/225/620/22562094.jpg?type=m1&udate=20220630">
								</div>
								<div class="latest-product__item__text">
									<h6>100% 네이티브 영국 영어 (진짜 생생한 영국 영어를 체험하다)</h6>
									<span>16000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=162" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/379/22537939.jpg?type=m1&udate=20220712"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>비상식적 성공 법칙 (부의 추월차선에 올라타는 가장 강력한 8가지 습관)</h6>
									<span>17000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=201" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/139/944/13994490.jpg?type=m1&udate=20210929"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>어린왕자 (초판본)</h6>
									<span>25000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=181" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/290/22529088.jpg?type=m1&udate=20220623"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>나를 내려놓으니 내가 좋아졌다</h6>
									<span>16000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=177" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/213/471/21347128.jpg?type=m1&udate=20220128"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> 테라피스트 (B. A. 패리스 장편소설)</h6>
									<span>22000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=82" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/859/22485918.jpg?type=m1&udate=20220706"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>역행자</h6>
									<span>21000원</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>중고도서 새로 등록 된 책</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=176" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/219/931/21993164.jpg?type=m1&udate=20220419"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>나에게 고맙다 (30만 부 기념 전면 개정판,전승환 에세이)</h6>
									<span>13000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=175" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/177/246/17724664.jpg?type=m1&udate=20220702"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>돈의 심리학 (당신은 왜 부자가 되지 못했는가)</h6>
									<span>22000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
									<span>14000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=174" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/001/510/00151055.jpg?type=m1&udate=20130129"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>인간 실격 (세계문학전집 103)</h6>
									<span>16000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=173" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/225/453/22545366.jpg?type=m1&udate=20220701">
								</div>
								<div class="latest-product__item__text">
									<h6>비터스위트 (불안한 세상을 관통하는 가장 위대한 힘)</h6>
									<span>27000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=172" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/140/683/14068322.jpg?type=m1&udate=20220528"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>이기적 유전자 (40주년 기념판)</h6>
									<span>33000원</span>
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
<hr>
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
						<img src="http://localhost:8080/bookstore/attachment/download?attachmentNo=112" alt="" Height ="300px">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 2022.07.20</li>
							<li><i class="fa fa-comment-o"></i> 2</li>
						</ul>
						<h5>
							<a href="http://localhost:8080/bookstore/board/detail/3">인플레이션에서 살아남기를 읽고</a>
						</h5>
						<p>이번에 같이 경제책 읽는 모임에서 읽게 된 책은 오건영 저자님의 "인플레이션에서 살아남기"이다. 그간의 책을 언뜻 본 것 같기는 한데 그동안 쓰신 책을 제대로 읽어본 적은 없었는데...</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="http://localhost:8080/bookstore/attachment/download?attachmentNo=121" alt="" Height ="300px">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 2022.07.20</li>
							<li><i class="fa fa-comment-o"></i> 2</li>
						</ul>
						<h5>
							<a href="http://localhost:8080/bookstore/board/detail/21">(리뷰) 박종천 님의 『개발자로 살아남기』를 읽고</a>
						</h5>
						<p>안녕하세요. 지난 12월에 '박종천 님의 『개발자로 살아남기』 리뷰 이벤트' 에 응모 후 당첨되어 책을 선물 받았습니다.한 달 내에 책을 읽고 리뷰를 써야 하는 미션이 있어 리뷰를 남겨...</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="http://localhost:8080/bookstore/attachment/download?attachmentNo=122" alt="" Height ="300px">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 2022.07.20</li>
							<li><i class="fa fa-comment-o"></i> 1</li>
						</ul>
						<h5>
							<a href="http://localhost:8080/bookstore/board/detail/22">[역행자]를 읽고 진짜 역행자가 되려합니다.</a>
						</h5>
						<p>이 책은 어떤 책인가? 사전 지식 없이 책을 접하는 사람을 위하여 먼저 읽은 느낌을 적어본다. 쉽다. 구체적이다. 가르치려 들지 않는다. 저자의 실제 사례를 쓴 논픽션이다. 솔직하게...</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>