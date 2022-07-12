<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 관리 페이지</h2>
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

		<div class="col-lg-6" style="width:100%; padding:10px;">
			<label>ISBN</label>
			<input type="text" class="form-input fill" v-model.number="currentData.bookIsbn">
			<button class="site-btn m-1 fill">ISBN 조회 등록</button>
		</div>
		
		<div class="col-lg-6" style="width:100%; padding:10px;">
			<div class="row" v-if="isEditMode">
				<label>도서 번호</label>
				<input type="site-text" class="form-input fill" v-model.number="currentData.bookNo" readonly>
			</div>
			
			<div class="row">
				<label>제목</label>
				<input type="text" class="form-input fill" v-model="currentData.bookTitle">
			</div>
			<div class="row">
				<label>ISBN</label>
				<input type="text" class="form-input fill" v-model="currentData.bookIsbn">
			</div>
			<div class="row">
				<label>표지</label>
				<input type="text" class="form-input fill" v-model="currentData.bookImage">
			</div>
			<div class="row">
				<label>저자</label>
				<input type="text" class="form-input fill" v-model="currentData.bookAuth">
			</div>
			<div class="row">
				<label>출판사</label>
				<input type="text" class="form-input fill" v-model="currentData.bookPubl">
			</div>
			<div class="row">
				<label>출판일</label>
				<input type="text" class="form-input fill" v-model="currentData.bookPub">
			</div>
			<div class="row">
				<label>줄거리</label>
				<input type="text" class="form-input fill" v-model="currentData.bookDescription">
			</div>
			<div class="row">
				<label>분류</label>
				<input type="text" class="form-input fill" v-model="currentData.bookType">
			</div>

			<!-- 오류 해결 필요 -->
			<div class="row">
				<label>대분류</label>
				<select id="bigType" onchange="changeType(this.value);">
					<option disabled selected>대분류를 선택해 주세요.</option>
					<option value="1">소설</option>
					<option value="2">자기계발</option>
					<option value="3">시/에세이</option>
					<option value="4">인문</option>
					<option value="5">컴퓨터/IT</option>
					<option value="6">참고서</option>
					<option value="7">어린이</option>
					<option value="8">취미</option>
					<option value="9">만화</option>
				</select>
			</div>

			<div class="row">
				<label>소분류</label>
		     	<select id="smallType">
		    		<option></option>
		    	</select>
			</div>

			
			<div class="col">
				<button class="site-btn m-1 fill" @click="addItem">{{mode}}</button>
				<button class="site-btn m-1 fill" @click="clearItem">초기화</button>
			</div>
			
		</div>

		<div class="float-left" style="width:100%">
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
				
// 				type1 : ["로맨스 소설", "추리 소설", "전쟁/역사 소설", "공포/스릴러 소설", "판타지 소설"],
// 		        type2 : ["경제/부동산", "시간 관리", "인간 관계", "대화/협상"],
// 		        type3 = ["한국시", "외국시", "성공 에세이", "여행 에세이", "연애 에세이"],
// 		        type4 : ["시사/사회", "경제/경영", "종교", "행정/정치"],
// 		        type5 : ["웹/홈페이지", "컴퓨터입문/활용", "프로그래밍언어", "개발/OS/데이터베이스", "네트워크 보안", "컴퓨터공학"],
// 		        type6 : ["국어/문학", "외국어", "수학", "고시", "공무원"],
// 		        type7 : ["어린이"],
// 		        type8 : ["가정/육아", "건강", "여행", "요리"],
// 		        type9 : ["학원 만화", "스포츠 만화", "순정 만화", "기타 만화"],
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
			
// 			typeChange() {
// 		          var v = this.bigType;
// 		          var o;
		          
// 		          if ( v == 1 ) {
// 		            o = type1;
// 		          } else if ( v == 2 ) {
// 		            o = type2;
// 		          } else if ( v == 3 ) {
// 		            o = type3;
// 		          } else if ( v == 4 ) {
// 		            o = type4;
// 		          } else if ( v == 5 ) {
// 		            o = type5;
// 		          } else if ( v == 6 ) {
// 		            o = type6;
// 		          } else if ( v == 7 ) {
// 		            o = type7;
// 		          } else if ( v == 8 ) {
// 		            o = type8;
// 		          } else if ( v == 9 ) {
// 		            o = type9;
// 		          } else {
// 		            o = [];
// 		          }
		          
// 		          this.smallType.empty();
// 		          this.smallType.append( '<option></option>' );
// 		          for ( var i = 0; i < o.length; i++ ) {
// 		          	this.smallType.append( '<option>' + o[ i ] + '</option>' );
// 		          }
// 		        },
			
		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/book/",
					method:"get"
				})
				.then((resp)=>{
					//console.log(resp);
					console.log(resp.data);
					this.bookList.push(...resp.data);
				})
				
//                 axios({
//                     url:"${pageContext.request.contextPath}/admin/api/book?query=" + query,
//                     method:"get"
//                 })
//                 .then((resp)=>{
//                     console.log(resp.data);
//                     console.log(resp.data.items[0]);
//                     console.log(resp.data.items[0].title);
//                     // this.bookList = resp.data.items;
//                     this.bookList.push(...resp.data.items);
//                 })
//                 .catch(err=>{
//                     console.log(err);
//                 });
		},
	});
	app.mount("#app");
</script>



<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>