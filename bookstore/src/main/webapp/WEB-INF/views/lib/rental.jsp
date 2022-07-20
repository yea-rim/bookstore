<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
	<div class="container w1000 m30">
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서관 도서 대여</h2>
					<div class="breadcrumb__option">
						<a href="${root}/">Home</a> <span>북스토어</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container" id="app">
		<div class="row">
			<div class="col-lg-12 col-md-12">

				<!-- 도서 대여 페이지 -->
				<div class="row">도서관 도서 대여</div>

				<div class="row input-group mb-3">
					<span class="input-group-text" id="basic-addon1">bookingNo</span> <input
						type="text" class="form-control" placeholder="도서관 자리"
						aria-describedby="basic-addon1" v-model="currentData.bookingNo">
				</div>

				<div class="row input-group mb-3">
					<span class="input-group-text" id="basic-addon1">bookingNo</span> <input
						type="text" class="form-control" placeholder="도서관 자리"
						aria-describedby="basic-addon1" v-model="currentData.bookingId">
				</div>

				<div class="row input-group mb-3">
					<span class="input-group-text" id="basic-addon1">bookingNo</span> <input
						type="text" class="form-control" placeholder="도서관 자리"
						aria-describedby="basic-addon1" v-model="currentData.bookingBookNo">
				</div>

				<div class="row input-group mb-3">
					<span class="input-group-text" id="basic-addon1">bookingNo</span> <input
						type="text" class="form-control" placeholder="도서관 자리"
						aria-describedby="basic-addon1" v-model="currentData.bookingNo">
				</div>

			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	const app = Vue.createApp({
		data(){
			return {
				currentData:{
					bookingNo:"",
					bookingId:"",
					bookingBookNo:"",
					bookingLibrary:"",
				},		
			};
		},
		
		computed:{

		},
		
		methods:{
			
			rental(){
				var choice = window.confirm("해당 도서관에서 책을 대여하시겠습니까?");
				if(choice == false) return;
				
				axios({
					url:"${pageContext.request.contextPath}/rest/booking/",
					method:POST,
					data: this.currentData,
				})
				.then((resp)=>{
					this.bookingList.push(resp.data);
					window.alert("대여가 완료됐습니다. 당일 내에 해당 도서관에서 책을 수령해 주세요.");
					}
				});
			},
		},
		watch:{
			
		},
		created(){
			
		},
	});
	app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
