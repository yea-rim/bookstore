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
				<label>번호</label>
				<input type="text" class="form-input fill" v-model.number="currentData.libInfoNo" readonly>
			</div>
			<div class="row">
				<label>이름</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryName">
			</div>
			<div class="row">
				<label>주소</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryAddress">
			</div>
			<div class="row">
				<label>구</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryGu">
			</div>
			<div class="row">
				<label>번호</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryTel">
			</div>
			<div class="row">
				<label>사이트</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryUrl">
			</div>
			<div class="row">
				<label>운영시간</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryTime">
			</div>
			<div class="row">
				<label>휴관일</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryCloseDate">
			</div>
			<div class="row">
				<label>위도</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryXcnts">
			</div>
			<div class="row">
				<label>경도</label>
				<input type="text" class="form-input fill" v-model="currentData.libraryYdnts">
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
						<th>운영시간</th>
						<th>휴관일</th>
						<th>위도</th>
						<th>경도</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(lib_info, index) in libList" v-bind:key="index">
						<td>{{lib_info.libInfoNo}}</td>
						<td>{{lib_info.libraryName}}</td>
						<td>{{lib_info.libraryAddress}}</td>
						<td>{{lib_info.libraryGu}}</td>
						<td>{{lib_info.libraryTel}}</td>
						<td>{{lib_info.libraryUrl}}</td>
						<td>{{lib_info.libraryTime}}</td>
						<td>{{lib_info.libraryCloseDate}}</td>
						<td>{{lib_info.libraryXcnts}}</td>
						<td>{{lib_info.libraryYdnts}}</td>
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
				libList:[],
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