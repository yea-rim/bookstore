<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/admin"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 반납 관리 페이지</h2>
                        <div class="breadcrumb__option">
							<a href="http://localhost:8080/bookstore/admin/book">Home</a>
                            <span>도서관 관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<nav class="text-center header__menu">
		<ul>
			<li><a href="${root}/lib-book">도서 관리</a></li>
			<li class="active"><a href="${root}/return">반납 관리</a></li>
		</ul>
	</nav>

<div class="container">
	<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	<div class="row float-container mt-1" id="app">

		<div class="float-left" style="width:100%">
			<table class="table table-border">
				<thead>
					<tr>
						<th>대여 번호</th>
						<th>아이디</th>
						<th>대여일</th>
						<th>제목</th>
						<th>반납 처리</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(book, index) in bookingList" v-bind:key="index">
						<td>{{book.bookingNo}}</td>
						<td>{{book.bookingId}}</td>
						<td>{{book.bookingDate}}</td>
						<td>{{book.bookingBookTitle}}</td>
						<td>
				<button class="site-btn m-1" v-on:click="re(index);">✓</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	const app = Vue.createApp({
		data(){
			return {
				bookingList:[],

			};
		},
		computed:{

		},
		methods:{
			
			re(index){
				var choice = window.confirm("반납이 완료됐습니까?");
				if(choice == false) return;
				const bookingNo = this.bookingList[index].bookingNo;
				console.log(bookingNo);
				console.log(bookingNo);
				console.log(bookingNo);
				console.log(bookingNo);
				console.log(bookingNo);
				
				axios({
					url:"${pageContext.request.contextPath}/rest/booking/" + bookingNo,
					method:"delete",
					data: bookingNo,
				})
				.then((resp)=>{
					this.bookingList[index] = resp.data;
					window.alert("반납 처리했습니다.");
		            axios.get("http://localhost:8080/bookstore/rest/booking/")
		            .then(resp=>{
		                this.booking = resp.data;
		            });
		            
				})
			},
		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/booking/",
					method:"get"
				})
				.then((resp)=>{
					console.log(resp.data);
					this.bookingList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>