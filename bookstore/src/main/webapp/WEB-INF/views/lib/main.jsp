<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/cosmo/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<style>
#map {
	width: 100%;
	height: 600px;
}

.info-title {
	display: block;
	background: #F09F00;
	color: #fff;
	text-align: center;
	height: 25px;
	line-height: 9px;
	border-radius: 4px;
	padding: 10px 10px;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	style="background-color: #F09F00;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>도서관 목록</h2>
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
	<div class="container-fluid" id="app">
		<div class="row">
			<div class="col-lg-12 col-md-12">

				<!-- 자치구 버튼 시작-->
				<div class="row center">
					<div class="col-md-12 text-center">
						<button class="btn site-btn m-2" @click="btn1">강남구</button>
						<button class="btn site-btn m-2" @click="btn2">강동구</button>
						<button class="btn site-btn m-2" @click="btn3">강북구</button>
						<button class="btn site-btn m-2" @click="btn4">강서구</button>
						<button class="btn site-btn m-2" @click="btn5">관악구</button>
						<button class="btn site-btn m-2" @click="btn6">구로구</button>
						<button class="btn site-btn m-2" @click="btn7">금천구</button>
						<button class="btn site-btn m-2" @click="btn8">노원구</button>
					</div>
					<div class="col-md-12 text-center">
						<button class="btn site-btn m-2" @click="btn9">도봉구</button>
						<button class="btn site-btn m-2" @click="btn10">동대문구</button>
						<button class="btn site-btn m-2" @click="btn11">동작구</button>
						<button class="btn site-btn m-2" @click="btn12">마포구</button>
						<button class="btn site-btn m-2" @click="btn13">서대문구</button>
						<button class="btn site-btn m-2" @click="btn14">서초구</button>
						<button class="btn site-btn m-2" @click="btn15">성동구</button>
						<button class="btn site-btn m-2" @click="btn16">성북구</button>
					</div>
					<div class="col-md-12 text-center">
						<button class="btn site-btn m-2" @click="btn17">송파구</button>
						<button class="btn site-btn m-2" @click="btn18">양천구</button>
						<button class="btn site-btn m-2" @click="btn19">영등포구</button>
						<button class="btn site-btn m-2" @click="btn20">용산구</button>
						<button class="btn site-btn m-2" @click="btn21">은평구</button>
						<button class="btn site-btn m-2" @click="btn22">종로구</button>
						<button class="btn site-btn m-2" @click="btn23">중구</button>
						<button class="btn site-btn m-2" @click="btn24">중랑구</button>
					</div>
				</div>

				<div class="row mt-4">
					<div class="col-md-6 offset-md-3 d-grid">
						<button class="btn btn-secondary" @click="reset">지역 전체 보기</button>
					</div>
				</div>

				<div class="row mt-4">
					<div class="col-md-10 offset-md-1">
						<div id="map"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->

<!-- vue js도 lazy loading을 사용한다 -->
<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb30bf62c68d21fff7adb5a4ffbd9cd4"></script>

<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    gu1:{},
                    gu2:{},
                    gu3:{},
                    gu4:{},
                    gu5:{},
                    gu6:{},
                    gu7:{},
                    gu8:{},
                    gu9:{},
                    gu10:{},
                    gu11:{},
                    gu12:{},
                    gu13:{},
                    gu14:{},
                    gu15:{},
                    gu16:{},
                    gu17:{},
                    gu18:{},
                    gu19:{},
                    gu20:{},
                    gu21:{},
                    gu22:{},
                    gu23:{},
                    gu24:{},

                    hospitalList:[],
                    map:null,
                };
            },

            computed:{
            },

            methods:{
                displayAllMarker(){
                    if(this.hospitalList.length == 0 || this.map == null) return;

                    for(let i=0; i < this.hospitalList.length; i++){
                        const hospital = this.hospitalList[i];
                        this.createMarker(hospital.libraryXcnts, hospital.libraryYdnts, hospital.libraryName);
                    }
                },
                createMarker(lat, lng, content) {
                    // 카카오에서 제공하는 위도경도 객체를 주어진 정보로 생성한다
                    
					var imageSrc = 'https://blog.kakaocdn.net/dn/bnxVUc/btrHwmayNmd/kAMzlrxsjuEbEMhFX5Sh7K/img.png', // 마커이미지의 주소입니다    
					imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
					imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
                    
                    const markerPosition  = new kakao.maps.LatLng(lat, lng);

                    // 배치를 위한 마커를 생성한다
                    const marker = new kakao.maps.Marker({
                        position: markerPosition,
                        image: markerImage

                    });

                    // 마커에 표시될 지도의 정보를 설정한다
                    marker.setMap(this.map);

                    //세번째 매개변수인 content에 값이 들어온 경우 인포윈도우 생성 코드를 추가
                    if(content !== undefined) {
                        const iwContent = '<div class="info-title">'+content+'</div>'
                            iwPosition = markerPosition; //인포윈도우 표시 위치입니다

                        // 인포윈도우를 생성합니다
                        const infowindow = new kakao.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });

                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(this.map, marker);
                        
                        var infoTitle = document.querySelectorAll('.info-title');

                        infoTitle.forEach(function(e) {
                            var w = e.offsetWidth;
                            var ml = w/2;
                            e.parentElement.style.top = "82px";
                            e.parentElement.style.left = "50%";
                            e.parentElement.style.marginLeft = -ml+"px";
                            e.parentElement.style.width = w+"px";
                            e.parentElement.previousSibling.style.display = "none";
                            e.parentElement.parentElement.style.border = "0px";
                            e.parentElement.parentElement.style.background = "unset";
                        });
                        
                    }
                },

                selectHospital(index){
                    const hospital = this.hospitalList[index];

                    // 카카오에서 제공하는 위도경도 객체를 주어진 정보로 생성한다
                    const lat = hospital.libraryXcnts;
                    const lng = hospital.libraryYdnts;
                    const moveLocation = new kakao.maps.LatLng(lat, lng);
                    console.log("X" + lat);

                    this.map.setLevel(3);

                    this.map.setCenter(moveLocation);//순간이동
                    //this.map.panTo(moveLocation);//부드럽게이동
                },

                reset(){
                    const moveLocation = new kakao.maps.LatLng(37.56557535727, 127.00523482779);
                    this.map.setLevel(8);
                    this.map.setCenter(moveLocation);//순간이동
                },

                // 자치구 선택 시작

                btn1(){
                    const moveLocation = new kakao.maps.LatLng(this.gu1.libraryXcnts, this.gu1.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn2(){
                    const moveLocation = new kakao.maps.LatLng(this.gu2.libraryXcnts, this.gu2.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn3(){
                    const moveLocation = new kakao.maps.LatLng(this.gu3.libraryXcnts, this.gu3.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn4(){
                    const moveLocation = new kakao.maps.LatLng(this.gu4.libraryXcnts, this.gu4.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn5(){
                    const moveLocation = new kakao.maps.LatLng(this.gu5.libraryXcnts, this.gu5.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn6(){
                    const moveLocation = new kakao.maps.LatLng(this.gu6.libraryXcnts, this.gu6.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn7(){
                    const moveLocation = new kakao.maps.LatLng(this.gu7.libraryXcnts, this.gu7.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn8(){
                    const moveLocation = new kakao.maps.LatLng(this.gu8.libraryXcnts, this.gu8.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn9(){
                    const moveLocation = new kakao.maps.LatLng(this.gu9.libraryXcnts, this.gu9.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn10(){
                    const moveLocation = new kakao.maps.LatLng(this.gu10.libraryXcnts, this.gu10.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn11(){
                    const moveLocation = new kakao.maps.LatLng(this.gu11.libraryXcnts, this.gu11.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn12(){
                    const moveLocation = new kakao.maps.LatLng(this.gu12.libraryXcnts, this.gu12.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn13(){
                    const moveLocation = new kakao.maps.LatLng(this.gu13.libraryXcnts, this.gu13.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn14(){
                    const moveLocation = new kakao.maps.LatLng(this.gu14.libraryXcnts, this.gu14.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn15(){
                    const moveLocation = new kakao.maps.LatLng(this.gu15.libraryXcnts, this.gu15.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn16(){
                    const moveLocation = new kakao.maps.LatLng(this.gu16.libraryXcnts, this.gu16.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn17(){
                    const moveLocation = new kakao.maps.LatLng(this.gu17.libraryXcnts, this.gu17.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn18(){
                    const moveLocation = new kakao.maps.LatLng(this.gu18.libraryXcnts, this.gu18.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn19(){
                    const moveLocation = new kakao.maps.LatLng(this.gu19.libraryXcnts, this.gu19.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn20(){
                    const moveLocation = new kakao.maps.LatLng(this.gu20.libraryXcnts, this.gu20.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn21(){
                    const moveLocation = new kakao.maps.LatLng(this.gu21.libraryXcnts, this.gu21.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn22(){
                    const moveLocation = new kakao.maps.LatLng(this.gu22.libraryXcnts, this.gu22.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn23(){
                    const moveLocation = new kakao.maps.LatLng(this.gu23.libraryXcnts, this.gu23.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },

                btn24(){
                    const moveLocation = new kakao.maps.LatLng(this.gu24.libraryXcnts, this.gu24.libraryYdnts);
                    this.map.setLevel(5);
                    this.map.setCenter(moveLocation);//순간이동
                },
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                hospitalList(){
                    //마커표시
                    this.displayAllMarker();
                },
                map(){
                    //마커표시
                    this.displayAllMarker();
                },
            },
            created(){
                axios.get("http://localhost:8080/bookstore/rest/lib/")
                .then(resp=>{
                    //this.hospitalList.push(...resp.data);
                    this.hospitalList = resp.data;
                });

                // 자치구 이동버튼 데이터
                axios.get("http://localhost:8080/bookstore/rest/lib/gu/강남구")
                .then(resp=>{
                    this.gu1 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/강동구")
                .then(resp=>{
                    this.gu2 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/강북구")
                .then(resp=>{
                    this.gu3 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/강서구")
                .then(resp=>{
                    this.gu4 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/관악구")
                .then(resp=>{
                    this.gu5 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/구로구")
                .then(resp=>{
                    this.gu6 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/금천구")
                .then(resp=>{
                    this.gu7 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/노원구")
                .then(resp=>{
                    this.gu8 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/도봉구")
                .then(resp=>{
                    this.gu9 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/동대문구")
                .then(resp=>{
                    this.gu10 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/동작구")
                .then(resp=>{
                    this.gu11 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/마포구")
                .then(resp=>{
                    this.gu12 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/서대문구")
                .then(resp=>{
                    this.gu13 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/서초구")
                .then(resp=>{
                    this.gu14 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/성동구")
                .then(resp=>{
                    this.gu15 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/성북구")
                .then(resp=>{
                    this.gu16 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/송파구")
                .then(resp=>{
                    this.gu17 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/양천구")
                .then(resp=>{
                    this.gu18 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/영등포구")
                .then(resp=>{
                    this.gu19 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/용산구")
                .then(resp=>{
                    this.gu20 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/은평구")
                .then(resp=>{
                    this.gu21 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/종로구")
                .then(resp=>{
                    this.gu22 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/중구")
                .then(resp=>{
                    this.gu23 = resp.data[0];
                });

                axios.get("http://localhost:8080/bookstore/rest/lib/gu/중랑구")
                .then(resp=>{
                    this.gu24 = resp.data[0];
                });
            },
            mounted(){
                //지도 생성
                const container = document.getElementById('map');
                const options = {
                    center: new kakao.maps.LatLng(37.56557535727, 127.00523482779),
                    level: 8
                };

                this.map = new kakao.maps.Map(container, options);
            },
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>