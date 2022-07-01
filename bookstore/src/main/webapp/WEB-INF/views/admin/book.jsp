<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 관리 페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<div class="col float-container mt-1" id="app">
		<div class="float-left" style="width:100%; padding:10px;">
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
				<label>대분류</label>
					<select>
						<option id="1">소설</option>
						<option id="2">자기계발</option>
						<option id="3">시/에세이</option>
						<option id="4">인문</option>
						<option id="5">컴퓨터</option>
						<option id="6">참고서</option>
						<option id="7">어린이</option>
						<option id="8">취미</option>
						<option id="8">만화</option>
					</select>
			</div>
			<div class="row">
				<label>소분류</label>
					<select v-model.number="currentData.bookType">
						<option id="1">소설</option>
						<option id="2">자기계발</option>
						<option id="3">시/에세이</option>
						<option id="4">인문</option>
						<option id="5">컴퓨터</option>
						<option id="6">참고서</option>
						<option id="7">어린이</option>
						<option id="8">취미</option>
						<option id="8">만화</option>
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
						<th>표지</th>
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
						<td>{{book.bookImage}}</td>
						<td>{{book.bookAuth}}</td>
						<td>{{book.bookPub}}</td>
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
				
				index:-1, //-1이면 등록, 0이상이면 수정
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
//                     url:"http://localhost:8080/bookstore/admin/book",
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