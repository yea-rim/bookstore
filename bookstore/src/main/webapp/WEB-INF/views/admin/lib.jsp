<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서관 관리 페이지</h2>
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
				  <input type="text" class="form-control" placeholder="도서관 번호를 입력하세요." v-model="currentData.libInfoNo" aria-describedby="basic-addon1">
				</div>
				<button class="site-btn m-1 fill" v-on:click="findLib">공공데이터 조회</button>
			</div>
			
			<div class="col-lg-6" style="width:100%; padding:10px;">
	
				<div class="row input-group mb-3" v-if="isEditMode">
				  <span class="input-group-text" id="basic-addon1">도서관 번호</span>
				  <input type="text" class="form-control" placeholder="도서관 번호를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libInfoNo" readonly>
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">도서관명</span>
				  <input type="text" class="form-control" placeholder="도서관명을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryName">
				</div>
				
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">주소</span>
				  <input type="text" class="form-control" placeholder="도서관 주소를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryAddress">
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">구</span>
				  <input type="text" class="form-control" placeholder="도서관 구를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryGu">
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">전화번호</span>
				  <input type="text" class="form-control" placeholder="도서관 전화번호를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryTel">
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">사이트 링크</span>
				  <input type="text" class="form-control" placeholder="도서관 링크를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryUrl">
				</div>
				
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">운영시간</span>
				  <input type="text" class="form-control" placeholder="도서관 운영시간을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryTime">
				</div>
				
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">휴관일</span>
				  <input type="text" class="form-control" placeholder="도서관 휴관일을 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryCloseDate">
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">위도</span>
				  <input type="text" class="form-control" placeholder="도서관 위도를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryXcnts">
				</div>
	
				<div class="row input-group mb-3">
				  <span class="input-group-text" id="basic-addon1">경도</span>
				  <input type="text" class="form-control" placeholder="도서관 경도를 입력하세요." aria-describedby="basic-addon1" v-model="currentData.libraryYdnts">
				</div>
	
				<div class="col">
					<button class="site-btn m-1 fill" v-on:click="addItem">{{mode}}</button>
					<button class="site-btn m-1 fill" v-on:click="clearItem">초기화</button>
				</div>
			</div>

			<div class="float-left" style="width:100%">
				<table class="table table-border">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>주소</th>
							<th>구</th>
							<th>번호</th>
							<th>사이트</th>
							<th>처리</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(lib, index) in libList" v-bind:key="index">
							<td>{{lib.libInfoNo}}</td>
							<td>{{lib.libraryName}}</td>
							<td>{{lib.libraryAddress}}</td>
							<td>{{lib.libraryGu}}</td>
							<td>{{lib.libraryTel}}</td>
							<td>{{lib.libraryUrl}}</td>
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
				libList:[],
				libData:{},
				
				currentData:{
					libInfoNo:"",
					libraryName:"",
					libraryAddress:"",
					libraryGu:"",
					libraryTel:"",
					libraryUrl:"",
					libraryTime:"",
					libraryCloseDate:"",
					libraryXcnts:"",
					libraryYdnts:"",
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

			findLib(){
				const number = this.currentData.libInfoNo;
				axios({
					url:"${pageContext.request.contextPath}/admin/api/lib?number=" + number,
					method:"get",
					data: this.libData,
				})
				.then((resp)=>{
	            	console.log(resp.data.seoulPublicLibraryInfo.row[0].lbrry_NAME);
					this.currentData.libraryName = resp.data.seoulPublicLibraryInfo.row[0].lbrry_NAME;
					this.currentData.libraryAddress = resp.data.seoulPublicLibraryInfo.row[0].adres;
					this.currentData.libraryGu = resp.data.seoulPublicLibraryInfo.row[0].code_VALUE;
					this.currentData.libraryTel = resp.data.seoulPublicLibraryInfo.row[0].tel_NO;
					this.currentData.libraryUrl = resp.data.seoulPublicLibraryInfo.row[0].hmpg_URL;
					this.currentData.libraryTime = resp.data.seoulPublicLibraryInfo.row[0].op_TIME;
					this.currentData.libraryCloseDate = resp.data.seoulPublicLibraryInfo.row[0].fdrm_CLOSE_DATE;
					this.currentData.libraryXcnts = resp.data.seoulPublicLibraryInfo.row[0].xcnts;
					this.currentData.libraryYdnts = resp.data.seoulPublicLibraryInfo.row[0].ydnts;
				});
			},

			deleteItem(index){
				var choice = window.confirm("데이터를 정말 지우시겠습니까?");
				if(choice == false) return;
				
				const libInfoNo = this.libList[index].libInfoNo;
				axios({
					url:"${pageContext.request.contextPath}/rest/lib/" + libInfoNo,
					method:"delete"
				})
				.then(()=>{
					this.libList.splice(index, 1);
					//+ 알람(외부 API)
				});
			},
			
			selectItem(index){
				//선택한 행의 데이터를 현재 데이터로 설정
				this.currentData = this.libList[index];
				this.index = index;
			},
			
			clearItem(){
				this.currentData = {
						libInfoNo:"",
						libraryName:"",
						libraryAddress:"",
						libraryGu:"",
						libraryTel:"",
						libraryUrl:"",
						libraryTime:"",
						libraryCloseDate:"",
						libraryXcnts:"",
						libraryYdnts:"",
				}
				this.index = -1;
			},
			
			addItem(){
				let type;
				if(this.isInsertMode){//등록이라면
					type = "post";
				}
				else if(this.isEditMode){//수정이라면
					type = "put";	
				}
				
				if(!type) return;
				
				axios({
					url:"${pageContext.request.contextPath}/rest/lib/",
					method:type,//계산된 method(POST/PUT)
					data: this.currentData
				})
				.then((resp)=>{
					//실제 등록/수정된 결과가 resp.data에 들어 있다
					//등록이면 마지막에 추가하고, 수정이면 해당위치(this.index)를 갱신
					if(this.isInsertMode){
						this.libList.push(resp.data);
						this.clearItem();
						window.alert("등록 완료");
					}
					else if(this.isEditMode){
						this.libList[this.index] = resp.data;
						window.alert("수정 완료");
					}
				});
			},
		},

		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/lib/",
					method:"get"
				})
				.then((resp)=>{
					console.log(resp.data);
					this.libList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>