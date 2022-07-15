<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memberId" value="${login}"></c:set>
<c:set var="isLogin" value="${memberId != null}"></c:set>
<c:set var="isAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>BookStore</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
	
	<style>
		div.fixed {
			position: fixed;
			bottom: 12px;
			right: 12px;
			width: 150px;
		}
		
	    * {font-family: ‘SUIT’, sans-serif;}

		div.chat1 {
			position: absolute;
			bottom: 15px;
			right: 130px;
			width: 150px;
		}
		
		div.chat2 {
			position: absolute;
			bottom: 15px;
			right: 0px;
			width: 70px;
		}
		
		#modal {
			display: none;
			position: relative;
			width: 0;
			top: 0;
			left: 79.1%;
			height: 0;
			z-index: 1;
		}
		
		#modal h2 {
			margin: 0;
		}
		
		#modal button {
			border: 1px solid gray;
			border-radius: 0.25em;
		}
		
		#modal .modal_content {
			position: fixed;
			width: 300px;
			height: 400px;
			top: 53.4%;
			margin: 0;
			background: #fff;
			border: 1px solid #666;
			border: 1px solid gray;
			border-radius: 0.5em;
		}
		
		#modal .modal_layer {
			position: fixed;
			top: 0;
			left: 0;
			width: 0;
			height: 0;
			background: rgba(0, 0, 0, 0.5);
			z-index: -1;
		}
		
		.btn-chat {
			border: 1px solid gray;
			border-radius: 0.25em;
			padding: 0.5em;
			background-color: white;
			cursor: pointer;
			width: 300px;
		}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			//this == form
			$(this).find("input[type=password]").each(function() {
				//this == 입력창
				var rawData = $(this).val();
				//var encData = 암호화(rawData);
				var hash = CryptoJS.SHA1(rawData);//암호화
				var encData = CryptoJS.enc.Hex.stringify(hash);//문자열화
				$(this).val(encData);
			});
		});
	});
</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="${root}/"><img
				src="${pageContext.request.contextPath}/image/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="${root}/"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="${root}/"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<a href="${root}/member/join">회원가입</a>
			</div>
			<div class="header__top__right__auth">
				<a href="${root}/member/login"><i class="fa fa-user"></i> 로그인</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="${root}/">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="${root}/"><i class="fa fa-facebook"></i></a> <a
				href="${root}/"><i class="fa fa-twitter"></i></a> <a href="${root}/"><i
				class="fa fa-linkedin"></i></a> <a href="${root}/"><i
				class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> hello@world.com</li>
				<li>3만원 이상 주문시 무료 배송</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> hello@world.com</li>
								<li>3만원 이상 주문시 무료 배송</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="${root}/"><i class="fa fa-facebook"></i></a> <a
									href="${root}/"><i class="fa fa-twitter"></i></a> <a
									href="${root}/"><i class="fa fa-linkedin"></i></a> <a
									href="${root}/"><i class="fa fa-pinterest-p"></i></a>
							</div>
							<c:choose>
								<c:when test="${isLogin}">
									<div class="header__top__right__language">
										<a href="${root}/member/mypage">마이페이지</a>
									</div>
									<div class="header__top__right__auth">
										<a href="${root}/member/logout"><i class="fa fa-user"></i>
											로그아웃</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="header__top__right__language">
										<a href="${root}/member/join">회원가입</a>
									</div>
									<div class="header__top__right__auth">
										<a href="${root}/member/login"><i class="fa fa-user"></i>
											로그인</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="${root}/"><img
							src="${pageContext.request.contextPath}/image/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="${root}/board/notice_list">공지사항</a></li>
							<li><a href="${root}/lib/main">도서관</a></li>
							<li><a href="${root}/book/list">북스토어</a></li>
							<li><a href="${root}/used/list">중고 거래</a>
								<ul class="header__menu__dropdown">
	                            	<li><a href="${root}/used/write">중고 판매신청</a></li>
								</ul></li>
							<li><a href="${root}/board/review_list">감상평</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="${root}/"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><a href="${root}/"><i class="fa fa-shopping-bag"></i>
									<span>3</span></a></li>
						</ul>
					</div>
				</div>
				<div class="humberger__open">
					<i class="fa fa-bars"></i>
				</div>
			</div>
<!-- 		</div> -->
	</header>
	<!-- Header Section End -->

	<!-- 챗봇 -->
	<div class="fixed">
		<div id="modal_opne_btn" class="btn-connect">
			<img src="${pageContext.request.contextPath}/image/chat.png" alt="">
		</div>
	</div>
	<div id="modal">

		<div class="modal_content">

			<div class="message-wrapper"></div>
			<!--<iframe src="http://localhost:8080/bookstore/chatbot"  height="350px">
       </iframe>-->
			<div class="chat1">
				<button class="btn-prev">뒤로가기</button>
			</div>
			<div class="chat2">
				<button type="button" id="modal_close_btn" class="btn-disconnect">닫기</button>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(function() {
			disconnectOperation();//최초 상태 설정

			//이전 질문으로 돌아가는 기능을 구현하기 위해 뭘 눌렀었는지 기록하도록 저장소 구현
			var memory = [];

			$(".btn-connect").click(
					function() {
						//주소 자동 계산
						var uri = "ws://";
						uri += location.host;
						uri += "${pageContext.request.contextPath}";
						uri += "/ws/chatbot";

						//접속
						socket = new WebSocket(uri);

						socket.onopen = function(e) {
							connectOperation();
						};
						socket.onclose = function(e) {
							disconnectOperation();
						};
						socket.onerror = function(e) {
							console.log(e);
							alert("서버와의 연결 오류가 발생하였습니다");
							disconnectOperation();
						};
						socket.onmessage = function(e) {
							$(".message-wrapper").empty();//다지워

							//console.log(e.data);
							//console.log(typeof e.data);

							//서버에서 온 값이 string이므로 이를 자바스크립트 객체 형식으로 변환해야 한다
							// - JSON.parse(문자열) --> 객체
							// - JSON.stringify(객체) --> 문자열
							var data = JSON.parse(e.data);
							//console.log(data);

							for (var i = 0; i < data.length; i++) {
								//console.log(data[i]);
								//태그를 만들어서 영역 내에 배치
								var button = $("<button>").addClass("btn-chat")
										.text(data[i].chatbotContent).attr(
												"data-chatbot-no",
												data[i].chatbotNo);
								if (data[i].count > 0) {//답변이 있을 때만 클릭이벤트를 부여
									button.click(function() {//클릭하면 서버로 번호를 전송
										var chatbotNo = $(this).attr(
												"data-chatbot-no");
										sendMessage(chatbotNo);
										memory.push(chatbotNo);
										//console.log(memory);
									});
								}
								$(".message-wrapper").append(button);
							}
						};

					});

			$(".btn-disconnect").click(function() {
				socket.close();
			});

			$(".btn-prev").click(function() {
				var chatbotNo = memory.pop();//pop()은 마지막 요소를 제거하여 반환
				console.log(memory, memory.length);
				if (memory.length > 0) {//memory에 남은게 있다면 마지막 항목 화면을 요청
					sendMessage(memory[memory.length - 1]);
					//sendMessage(memory.slice(-1));
				} else {//memory에 남은게 없다면 첫화면을 요청
					sendMessage(0);
				}
			});

			function sendMessage(text) {
				if (text === "" || text === undefined || text === null)
					return;
				socket.send(text);
			}
			function connectOperation() {//연결되면 처리할 화면 작업을 구현
				$(".btn-connect").prop("disabled", true);//연결버튼 비활성화
				$(".btn-disconnect").prop("disabled", false);//종료버튼 활성화
				$(".btn-prev").prop("disabled", false);//뒤로가기 활성화
				$(".btn-prev").show();
			}
			function disconnectOperation() {//연결 종료되면 처리할 화면 작업을 구현
				$(".btn-connect").prop("disabled", false);//연결버튼 활성화
				$(".btn-disconnect").prop("disabled", true);//종료버튼 비활성화
				$(".btn-prev").prop("disabled", true);//뒤로가기 비활성화
				$(".btn-prev").hide();
			}
		});
	</script>


	<script>
		document.getElementById("modal_opne_btn").onclick = function() {
			document.getElementById("modal").style.display = "block";
		}

		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById("modal").style.display = "none";
		}
	</script>

