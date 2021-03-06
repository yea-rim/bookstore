<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</div>
<div class="col-lg-1"></div>
</div>
</div>
<!-- Hero Section End -->

<!-- Footer Section Begin -->
<footer class="footer spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="${root}/"><img
							src="${pageContext.request.contextPath}/image/footlogo.png"
							alt=""></a>
					</div>
					<ul>
						<li>서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</li>
						<li>대표전화 : 0000-0000</li>
						<li>Email: hello@world.com</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<ul>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">청소년 보호정책</a></li>
						<li><a href="#">판매자 이용약관</a></li>
						<li><a href="#">개인정보 관리 약정서</a></li>
					</ul>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/board/qna_write">1:1
								문의</a></li>
						<li><a href="http://localhost:8080/bookstore/chatbot">자주 묻는 질문</a></li>
						<li><a href="http://localhost:8080/bookstore/member/join">회원가입</a></li>
						<li><a href="http://localhost:8080/bookstore/lib/main">도서관</a></li>
						<li><a href="http://localhost:8080/bookstore/book/list">북스토어</a></li>
						<li><a href="http://localhost:8080/bookstore/book/list">중고 도서</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-12">
				<div class="footer__widget">
					<h6>지금 뉴스레터에 가입하세요.</h6>
					<p>최신 정보 및 특별 행사에 대한 메일을 받으세요.</p>
					<form action="#">
						<input type="text" placeholder="Enter your mail">
						<button type="submit" class="site-btn">구독하기</button>
					</form>
					<div class="footer__widget__social">
						<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a> <a
							href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a> <a
							href="https://twitter.com/"><i class="fa fa-twitter"></i></a> <a
							href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="footer__copyright">
					<div class="footer__copyright__text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;1998-
							<script>
								document.write(new Date().getFullYear());
							</script>
							Book Store All Right Reserved
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="footer__copyright__payment">
						<img src="${pageContext.request.contextPath}/image/kakaopay.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>

</html>