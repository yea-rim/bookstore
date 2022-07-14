<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/admin"></c:set>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 관리 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="http://localhost:8080/bookstore/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                    <nav class="text-center header__menu">
                        <ul>
                            <li class="active"><a href="${root}/book">도서 관리</a>
			                    <ul class="header__menu__dropdown">
									<li><a href="${root}/lib-book">도서관 도서</a></li>
									<li><a href="${root}/store-book">스토어 도서</a></li>
									<li><a href="${root}/used-book">중고 도서</a></li>
			                    </ul>
			                </li>	
							<li><a href="${root}/lib">도서관 관리</a></li>
							<li><a href="${root}/member">회원 관리</a></li>
							<li><a href="${root}/delivery">배송 관리</a></li>
							<li><a href="${root}/question">1:1 관리</a></li>
							<li><a href="${root}/notice">공지사항 관리</a></li>
							<li><a href="${root}/faq">faq 관리</a></li>
                        </ul>
                    </nav>

<div class="container">
	<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	<div class="row float-container mt-1" id="app">

		<div class="col-lg-6" style="width:100%; padding:10px;">
		<div class="row input-group mb-3 mt-5">
		  <span class="input-group-text" id="basic-addon1">도서관 번호</span>
		  <input type="text" class="form-control" placeholder="도서관 번호를 입력하세요." v-model.number="currentData.libLibInfoNo" aria-describedby="basic-addon1">
		</div>
			<button class="site-btn m-1 fill" v-on:click="findLib(currentData.libLibInfoNo)">도서관 선택</button>		
		<div class="row input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">도서 번호</span>
		  <input type="text" class="form-control" placeholder="도서 번호를 입력하세요." v-model.number="currentData.libBookNo" aria-describedby="basic-addon1">
		</div>
			<button class="site-btn m-1 fill" v-on:click="findBook(currentData.libBookNo)">도서 선택</button>
		</div>

		<div class="col-lg-6" style="width:100%; padding:10px;">
	
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">도서관 번호</span>
			  <input type="text" class="form-control" placeholder="도서관 번호를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libLibInfoNo" readonly>
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">도서관명</span>
			  <input type="text" class="form-control" placeholder="도서관명이 입력됩니다." aria-describedby="basic-addon1" v-model="libName" readonly>
			</div>

			<div class="row input-group mb-3" v-if="isEditMode">
			  <span class="input-group-text" id="basic-addon1">도서 번호</span>
			  <input type="text" class="form-control" placeholder="도서 번호를 입력하세요." aria-describedby="basic-addon1" v-model.number="currentData.libBookNo" readonly>
			</div>
				
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">도서명</span>
			  <input type="text" class="form-control" placeholder="도서명이 입력됩니다." aria-describedby="basic-addon1" v-model="bookTitle" readonly>
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">수량</span>
			  <input type="number" class="form-control" placeholder="도서 수량을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libAmount">
			</div>

			<div class="col mt-2">
				<button class="site-btn m-1 fill" @click="addItem">{{mode}}</button>
				<button class="site-btn m-1 fill" @click="clearItem">초기화</button>
			</div>
		</div>

		<div class="float-left mt-2" style="width:100%">
			<table class="table table-border">
				<thead>
					<tr>
						<th>번호</th>
						<th width="25%">도서관(번호)</th>
						<th width="35%">제목(도서번호)</th>
						<th>재고</th>
						<th>처리</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(book, index) in bookList" v-bind:key="index">
						<td>{{book.libNo}}</td>
						<td>{{book.libLibInfoNo}}</td>
						<td>{{book.libBookNo}}</td>
						<td>{{book.libAmount}}권</td>
						<td>
							<button class="site-btn m-1" v-on:click="selectItem(index);">✓</button>
							<button class="site-btn m-1" v-on:click="deleteItem(index);">X</button>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	const app = Vue.createApp({
		data(){
			return {
				libName:"",
				bookTitle:"",
				
				bookList:[],

				currentData:{
					libNo:"",
					libLibInfoNo:"",
					libBookNo:"",
					libAmount:"",
				},		
				index:-1,
			};
		},
		
		computed:{
			mode(){
				return this.index < 0 ? "등록" : "수정";
			},
			isInsertMode(){
				return this.mode == "등록";
			},
			isEditMode(){
				return this.mode == "수정";
			},
		},
		
		methods:{
			
			// 오류 해결해야 함 ~ 하는 중
// 			findLib(libLibInfoNo){
// 				const libLibInfoNo = this.libLibInfoNo;
// 				axios({
// 					url:"${pageContext.request.contextPath}/rest/lib/" + libLibInfoNo,
// 					method:"get",
// 					data: this.libName,
// 				})
// 				.then((resp)=>{
// 	            	this.libData.libName = resp.data[0].libraryName;
// // 					this.currentData.libBookNo = resp.data[0].libBookNo;
// // 					this.currentData.libLibInfoNo = resp.data[0].libLibInfoNo;
// // 					this.currentData.libAmount = resp.data[0].libAmount;
// 					console.log(this.libName);
// 				});
// 			},
			
			deleteItem(index){
				var choice = window.confirm("데이터를 정말 지우시겠습니까?");
				if(choice == false) return;
				
				const libNo = this.bookList[index].libNo;
				axios({
					url:"${pageContext.request.contextPath}/rest/lib-book/" + libNo,
					method:"delete"
				})
				.then(()=>{
					this.bookList.splice(index, 1);
					//+ 알람(외부 API)
				});
			},
			
			selectItem(index){
				this.currentData = this.bookList[index];
				this.index = index;
			},
			
			clearItem(){
				this.currentData = {
					libNo:"",
					libLibInfoNo:"",
					libBookNo:"",
					libAmount:"",
				}
				this.index = -1;
			},
			
			addItem(){
				let type;
				if(this.isInsertMode){ //등록
					type = "post";
				}
				else if(this.isEditMode){ //수정
					type = "put";
				}
				
				if(!type) return;
				
				axios({
					url:"${pageContext.request.contextPath}/rest/lib-book/",
					method:type,
					data: this.currentData,
				})
				.then((resp)=>{
					if(this.isInsertMode){
						this.bookList.push(resp.data);
						this.clearItem();
						window.alert("등록 완료!");
					}
					else if(this.isEditMode){
						this.bookList[this.index] = resp.data;
						window.alert("수정 완료!");
						window.alert("수정 완료!");
						window.alert("수정 완료!");
					}
				});
			},
		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/lib-book/",
					method:"get"
				})
				.then((resp)=>{
					this.bookList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>