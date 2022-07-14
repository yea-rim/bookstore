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

		<div class="row input-group mb-3">
		  <span class="input-group-text" id="basic-addon1">ISBN</span>
		  <input type="text" class="form-control" placeholder="ISBN을 입력하세요." v-model.number="currentData.bookIsbn" aria-describedby="basic-addon1">
		</div>

			<button class="site-btn m-1 fill" v-on:click="readIsbn(currentData.bookIsbn)">ISBN 조회 등록</button>

				<div class="row mt-2">
					<label>11 로맨스 소설, 12 추리 소설, 13 전쟁/역사, 14 공포/스릴러, 15 판타지 소설</label>
					<label>21 경제/부동산, 22 시간 관리, 23 인간관계, 24 대화/협상</label>
					<label>31 한국시, 32외국시, 33 성공 에세이, 34 여행 에세이, 35 연애 에세이</label>
					<label>41 시사/사회, 42 경제/경영, 43 종교, 44 행정/정치</label>
					<label>51 웹/홈페이지, 52 컴퓨터입문/활용, 53 프로그래밍언어, 54 개발/OS/데이터베이스, 55 네트워크보안, 56 컴퓨터공학</label>
					<label>61 국어/문학, 62 외국어, 63 수학, 64 고시, 65 공무원</label>
				</div>
				<div class="row mt-2">
					<label>71 어린이, 81 가정/육아, 82 건강, 83 여행, 84 요리</label>
					<label>91 학원만화, 92 스포츠만화, 93 순정만화, 94 기타만화</label>
				</div>

		</div>

		<div class="col-lg-6" style="width:100%; padding:10px;">

			<div class="row input-group mb-3" v-if="isEditMode">
			  <span class="input-group-text" id="basic-addon1">도서 번호</span>
			  <input type="text" class="form-control" placeholder="도서 번호를 입력하세요." aria-describedby="basic-addon1" v-model.number="currentData.bookNo" readonly>
			</div>
				
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">제목</span>
			  <input type="text" class="form-control" placeholder="도서 제목을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookTitle">
			</div>
	
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">ISBN</span>
			  <input type="text" class="form-control" placeholder="ISBN을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookIsbn">
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">표지</span>
			  <input type="text" class="form-control" placeholder="표지 이미지 링크를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookImage">
			</div>
	
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">저자</span>
			  <input type="text" class="form-control" placeholder="저자 이름을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookAuth">
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">출판사</span>
			  <input type="text" class="form-control" placeholder="출판사를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookPubl">
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">출판일</span>
			  <input type="text" class="form-control" placeholder="출판일을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookPub">
			</div>
	
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">줄거리</span>
			  <input type="text" class="form-control" placeholder="줄거리를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookDescription">
			</div>
			
			<div class="row input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">분류</span>
			  <input type="text" class="form-control" placeholder="옆을 참고하시어 분류를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookType">

<!-- 				<select v-model="bookType1"> -->
<!-- 					<option disabled>───소설───</option> -->
<!-- 					<option value=11>로맨스 소설</option> -->
<!-- 					<option value=12>추리 소설</option> -->
<!-- 					<option value="13">전쟁/역사 소설</option> -->
<!-- 					<option value="14">공포/스릴러 소설</option> -->
<!-- 					<option value="15">판타지 소설</option> -->
					
<!-- 					<option disabled>───자기계발───</option> -->
<!-- 					<option value="21">경제/부동산</option> -->
<!-- 					<option value="22">시간 관리</option> -->
<!-- 					<option value="23">인간 관계</option> -->
<!-- 					<option value="24">대화/협상</option> -->

<!-- 					<option disabled>───시/에세이───</option> -->
<!-- 					<option value="31">한국시</option> -->
<!-- 					<option value="32">외국시</option> -->
<!-- 					<option value="33">성공 에세이</option> -->
<!-- 					<option value="34">여행 에세이</option> -->
<!-- 					<option value="35">연애 에세이</option> -->

<!-- 					<option disabled>───인문───</option> -->
<!-- 					<option value="41">시사/사회</option> -->
<!-- 					<option value="42">경제/경영</option> -->
<!-- 					<option value="43">종교</option> -->
<!-- 					<option value="44">행정/정치</option> -->

<!-- 					<option disabled>───컴퓨터/IT───</option> -->
<!-- 					<option value="51">웹/홈페이지</option> -->
<!-- 					<option value="52">컴퓨터입문/활용</option> -->
<!-- 					<option value="53">프로그래미 언어</option> -->
<!-- 					<option value="54">개발/OS/데이터베이스</option> -->
<!-- 					<option value="55">네트워크 보안</option> -->
<!-- 					<option value="56">컴퓨터 공학</option> -->

<!-- 					<option disabled>───참고서───</option> -->
<!-- 					<option value="61">국어/문학</option> -->
<!-- 					<option value="62">외국어</option> -->
<!-- 					<option value="63">수학</option> -->
<!-- 					<option value="64">고시</option> -->
<!-- 					<option value="65">공무원</option> -->

<!-- 					<option disabled>───어린이───</option> -->
<!-- 					<option value="71">어린이</option> -->

<!-- 					<option disabled>───취미───</option> -->
<!-- 					<option value="81">가정/육아</option> -->
<!-- 					<option value="82">건강</option> -->
<!-- 					<option value="83">여행</option> -->
<!-- 					<option value="84">요리</option> -->

<!-- 					<option disabled>───만화───</option> -->
<!-- 					<option value="91">학원 만화</option> -->
<!-- 					<option value="92">스포츠 만화</option> -->
<!-- 					<option value="93">순정 만화</option> -->
<!-- 					<option value="94">기타 만화</option> -->
<!-- 				</select> -->
</div>
				<div class="col mt-2">
					<button class="site-btn m-1 fill" @click="addItem">{{mode}}</button>
					<button class="site-btn m-1 fill" @click="clearItem">초기화</button>
				</div>
			</div>
			
<!-- 		<!-- 도서관, 스토어, 중고 추가 -->
<!-- 		<div class="col-lg-6" style="width:100%; padding:10px;"> -->
<!-- 			<button class="site-btn m-1 fill" @click="openLib = true">도서관</button> -->
<!-- 			<button class="site-btn m-1 fill" @click="openStore = true">쇼핑몰</button> -->
<!-- 			<button class="site-btn m-1 fill" @click="openUsed = true">중고</button> -->
<!-- 		</div> -->
		
		<!-- v-if 영역 -->
		<!-- 도서관 -->
<!-- 		<div class="col-lg-6" style="width:100%; padding:10px;" v-if="openLib"> -->
<!-- 			<div class="row input-group mb-3"> -->
<!-- 			  <span class="input-group-text" id="basic-addon1">도서관명</span> -->
<!-- 			  <input type="text" class="form-control" placeholder="도서관 이름을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookPubl"> -->
<!-- 			</div> -->
<!-- 			<div class="row input-group mb-3"> -->
<!-- 			  <span class="input-group-text" id="basic-addon1">책 수량</span> -->
<!-- 			  <input type="number" class="form-control" aria-describedby="basic-addon1" v-model="currentData.bookPubl"> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<!-- 쇼핑몰 --> -->
<!-- 		<div class="col-lg-6" style="width:100%; padding:10px;" v-if="openStore"> -->
<!-- 			<div class="row input-group mb-3"> -->
<!-- 			  <span class="input-group-text" id="basic-addon1">출판사</span> -->
<!-- 			  <input type="text" class="form-control" placeholder="출판사를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookPubl"> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<!-- 중고 --> -->
<!-- 		<div class="col-lg-6" style="width:100%; padding:10px;" v-if="openUsed"> -->
<!-- 			<div class="row input-group mb-3"> -->
<!-- 			  <span class="input-group-text" id="basic-addon1">출판사</span> -->
<!-- 			  <input type="text" class="form-control" placeholder="출판사를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.bookPubl"> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="float-left mt-2" style="width:100%">
			<table class="table table-border">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>출판사</th>
						<th>분류</th>
						<th>처리</th>
					</tr>
				</thead>
				<tbody>

					<tr v-for="(book, index) in bookList" v-bind:key="index">
						<td>{{book.bookNo}}</td>
						<td>{{book.bookTitle}}</td>
						<td>{{book.bookAuth}}</td>
						<td>{{book.bookPubl}}</td>
						<td>{{book.bookType}}</td>

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
				bookList:[],

				currentData:{
					bookNo:"",
					bookTitle:"",
					bookIsbn:"",
					bookImage:"",
					bookAuth:"",
					bookPubl:"",
					bookPub:"",
					bookDescription:"",
					bookType:"",
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
			
			readIsbn(bookIsbn){
				const query = this.currentData.bookIsbn;
				axios({
					url:"${pageContext.request.contextPath}/admin/api/book?query=" + query,
					method:"get",
					data: this.currentData,
				})
				.then((resp)=>{
	            	console.log(resp.data.items[0].title);
// 					this.currentData = resp.data.items[0];
					this.currentData.bookTitle = resp.data.items[0].title;
					this.currentData.bookImage = resp.data.items[0].image;
					this.currentData.bookAuth = resp.data.items[0].author;
					this.currentData.bookPubl = resp.data.items[0].publisher;
					this.currentData.bookPub = resp.data.items[0].pubdate;
					this.currentData.bookDescription = resp.data.items[0].description;
					console.log(this.currentData);
				});
			},

			deleteItem(index){
				var choice = window.confirm("데이터를 정말 지우시겠습니까?");
				if(choice == false) return;
				
				const bookNo = this.bookList[index].bookNo;
				axios({
					url:"${pageContext.request.contextPath}/rest/book/" + bookNo,
					method:"delete"
				})
				.then(()=>{
					this.bookList.splice(index, 1);
					//+ 알람(외부 API)
				});
			},
			
			selectItem(index){
				//선택한 행의 데이터를 현재 데이터로 설정
				this.currentData = this.bookList[index];
				this.index = index;
			},
			
			clearItem(){
				this.currentData = {
						bookNo:"",
						bookTitle:"",
						bookIsbn:"",
						bookImage:"",
						bookAuth:"",
						bookPub:"",
						bookPubl:"",
						bookDescription:"",
						bookType:"",
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
					url:"${pageContext.request.contextPath}/rest/book/",
					method:type,//계산된 method(POST/PUT)
					data: this.currentData,
				})
				.then((resp)=>{
					//실제 등록/수정된 결과가 resp.data에 들어 있다
					//등록이면 마지막에 추가하고, 수정이면 해당위치(this.index)를 갱신
					if(this.isInsertMode){
						this.bookList.push(resp.data);
						this.clearItem();
						window.alert("등록 완료!");
					}
					else if(this.isEditMode){
						this.bookList[this.index] = resp.data;
						window.alert("수정 완료!");
					}
				});
			},
			
// 			addLib(){
// 				axios({
// 					url:"${pageContext.request.contextPath}/rest/book/",
// 					method:type,//계산된 method(POST/PUT)
// 					data: this.currentData,
// 				})
// 				.then((resp)=>{
// 					//실제 등록/수정된 결과가 resp.data에 들어 있다
// 					//등록이면 마지막에 추가하고, 수정이면 해당위치(this.index)를 갱신
// 					if(this.isInsertMode){
// 						this.bookList.push(resp.data);
// 						this.clearItem();
// 						window.alert("등록 완료!");
// 					}
// 					else if(this.isEditMode){
// 						this.bookList[this.index] = resp.data;
// 						window.alert("수정 완료!");
// 					}
// 				});
// 			},
			
// 			addStore(){
// 				axios({
// 					url:"${pageContext.request.contextPath}/rest/book/",
// 					method:type,//계산된 method(POST/PUT)
// 					data: this.currentData,
// 				})
// 				.then((resp)=>{
// 					//실제 등록/수정된 결과가 resp.data에 들어 있다
// 					//등록이면 마지막에 추가하고, 수정이면 해당위치(this.index)를 갱신
// 					if(this.isInsertMode){
// 						this.bookList.push(resp.data);
// 						this.clearItem();
// 						window.alert("등록 완료!");
// 					}
// 					else if(this.isEditMode){
// 						this.bookList[this.index] = resp.data;
// 						window.alert("수정 완료!");
// 					}
// 				});
// 			},
			
// 			addUsed(){
// 				axios({
// 					url:"${pageContext.request.contextPath}/rest/book/",
// 					method:type,//계산된 method(POST/PUT)
// 					data: this.currentData,
// 				})
// 				.then((resp)=>{
// 					//실제 등록/수정된 결과가 resp.data에 들어 있다
// 					//등록이면 마지막에 추가하고, 수정이면 해당위치(this.index)를 갱신
// 					if(this.isInsertMode){
// 						this.bookList.push(resp.data);
// 						this.clearItem();
// 						window.alert("등록 완료!");
// 					}
// 					else if(this.isEditMode){
// 						this.bookList[this.index] = resp.data;
// 						window.alert("수정 완료!");
// 					}
// 				});
// 			},

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



<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>