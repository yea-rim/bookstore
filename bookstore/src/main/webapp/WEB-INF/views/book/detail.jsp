<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 <style>
 	.used-pay{
 	}
 </style>
 
  <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 소개 </h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath }">Home</a>
                            <span>북스토어</span>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container" id = "app">
  
            <div class="row">
           	<div class = "col-lg-1 col-md-1">
           	</div>
                <div class="col-lg-2 col-md-6">
                    <div class="product__details__pic">
					<div class="product__details__pic__item text-center">
						<img class="product__details__pic__item--large"
							src="${bookDto.bookImage }" alt="">
						<button class="site-btn m-2" @click="handle_toggle">도서관 조회</button>
						
						
						<!-- 모달창 도전 !! -->
						<div>
							<div v-show="is_show" style="position: absolute; left: 30px; top: 300px; z-index: 300; border: solid #F09F00 3px; background-color: #FFFFFF;" class="m-1">
								<div style="width: 650px;">
									<div class="p-3" style="text-align: left; padding: 5px; background-color:#F09F00;">
										<button style="padding: 0px 0px 5px;" class="site-btn">도서관 재고 및 대여</button>
									</div>
									<div class="p-3">
										<div>
											<table class="table table-border">
												<thead>
													<tr>
														<th>지역</th>
														<th width="50%">도서관명</th>
														<th>재고</th>
														<th>대여</th>
													</tr>
												</thead>
												<tbody>
													<tr v-for="(yes, index) in yesList" v-bind:key="index">
														<td>{{yes.libGu}}</td>
														<td>{{yes.libName}}</td>
														<td>{{yes.libAmount}}권</td>
														<td>
															<button class="site-btn m-1" style="padding: 5px 10px 5px;" v-on:click="rental(index)" >✓</button>
														</form>
														</td>
													</tr>

												</tbody>
											</table>
										</div>
	
										<button @click="handle_toggle" class="site-btn">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                src="img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                src="img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                src="img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="img/product/details/thumb-4.jpg" alt="">
                        </div>
                    </div>
                </div>
             
                <div class="col-lg-6 col-md-6">
                   <div class="product__details__text" style="padding: 0px 0px 0px 40px;">
                        <h3> &nbsp;${bookDto.bookTitle }</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <p>${bookDto.bookDescription }</p>
						<hr>
						<!-- 폼 시작!! -->
						<form method = "post">
						<input type = "hidden" name = "bookNo" value = "${bookDto.bookNo }">
						판매가 : &nbsp; <div class="product__details__price" style = "display:inline;">  ${storeDto.storePrice }원</div>
						
						 <!--판매가 주문 수량 -->
						 &nbsp;  <div class="product__details__quantity">
                            <div class="quantity">
                                주문 수량 &nbsp;&nbsp; <div class="pro-qty">                                    
                               		 <input type="text" value="0" name = "storeAmount">
                               </div>
                            </div>
                        </div>
                        <p style="color:red;">* 쇼핑몰 원하시면 중고가 옆에 체크 후 구매버튼</p>
                        <hr>
                        
                       <!--  좀 문제가 있을 수 있어서 시간있으면 좀 더 생각해보기(show-hide로 바꾸고 list를 처음부터 뽑아낼수 있을듯?) -->
                        <c:choose>
                        	<c:when test="${usedCheap == null}">
                        		   중고(최저가) : &nbsp; <div class="product__details__price" style = "display:inline;">재고없음</div>&nbsp;       								
                        	</c:when>
                        	<c:otherwise>
                        	
                        중고(최저가) : &nbsp; <div class="product__details__price" style = "display:inline;">${usedCheap.usedPrice }원</div>&nbsp;       								
                        <input type = "checkbox" name = "used[${0}].usedNo" value = "${usedCheap.usedNo }">
                        	</c:otherwise>
                        </c:choose>
                          	<c:choose>
                           	<c:when test="${usedCheap == null }">
                           		
                           	</c:when>
                           <c:when test="${usedList.size() == 0 && usedCheap != null}">
                              <div><input type = "button"  value = "추가재고없음" ></div>
                           	</c:when>
                           	<c:otherwise>
                        <div><input type = "button" v-on:click = "showUsed =!showUsed" value = "중고+"></div>
                              	</c:otherwise>    
                          	</c:choose>
                       	<!-- 조회구문에서 싼 값 다음번째 부터 나오는 리스트임 -->
                       	<c:forEach var="usedDto" items = "${usedList }" varStatus="status">
<%--                         <c:if test="${usedList.length == 0}"> --%>
<!--                         	<div v-show = "showUsed"> -->
<!--                         		<p style="color:red;">중고 재고가 없습니다.</p> -->
<!--                         	</div>	 -->
<%--                         </c:if> --%>
                        <div v-show = "showUsed">
                        
                        <label>중고가 : &nbsp; ${usedDto.usedPrice }원</label>&nbsp;
                        <input type ="checkbox" name = "used[${status.index+1 }].usedNo" value = "${usedDto.usedNo }">
                        </div>
						</c:forEach>
       				
       					
                    	 
                  		<br>
                  		<c:if test="${param.error != null}">
                  			     <p style="color:blue;">* 결제 상품이 없습니다.(결제 수량을 확인하세요!)</p>
                  			</c:if>
<!--                         <a href="#" class="primary-b77tn">장바구니 담기</a> -->
						<input type = "submit" class = "primary-btn" value = "장바구니 담기" formaction = "${pageContext.request.contextPath }/basket" style="border:none;" id="demo">
						<input type = "submit" class = "primary-btn" value = "바로구매" formaction = "${pageContext.request.contextPath }/pay"  style="border:none;">
<%--                         <a href="${pageContext.request.contextPath }/pay" class="primary-btn">바로구매</a> --%>
                        <p style="color:red;">* 중고 구매를 원하시면 중고가 옆에 체크 후 구매버튼</p>
                       	</form>
                          
                        <ul>
                            <li><b>도서 저자</b> <span>${bookDto.bookAuth }</span></li>
                            <li><b>도서 출판사</b> <span>${bookDto.bookPubl }</span></li>
                            <li><b>ISBN</b> <span>${bookDto.bookIsbn }</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                                               
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">도서 목차</a>
                            </li>
                            <!--  li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li-->
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">감상평 <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
                                        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
                                        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
                                        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
                                        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
                                        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
                                        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
                                        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
                                        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
                                        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
                                        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
                                        sed sit amet dui. Proin eget tortor risus.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
    
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	

	 <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    showUsed:false,
                    is_show: false,
                    
    				bookList:[],
    				yesList:[],

    				bookingData:{},
    				currentData:{
    					libNo:"",
    					libLibInfoNo:"",
    					libBookNo:"",
    					libAmount:"",
    					bookTitle:"",
    					libName:"",
    					libGu:"",
    				},
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{

                // this와 바인딩 되지 않는다. 
                arrow_function: () => {  
                  console.log(this.is_show); // undefined
                },

                // bind로 묶어도 마찬가지다.
                bind_function: (() => { 
                  console.log(this.is_show); // undefined
                }).bind(this),

                // 정상적으로 동작한다.
                it_is_work: function(){
                  this.is_show = !this.is_show;
                },
                
                handle_toggle: function(){ 
                    this.is_show = !this.is_show; // #2, #3
                  },
                
                  removeHidden(){
              		this.isHidden["hidden"] = false;
              	},
              	
              	addHidden(){
              		this.isHidden["hidden"] = true; 
              	},
              	
    			yesBook(){
    				const number = this.currentData.libBookNo;
    				axios({
    					url:"${pageContext.request.contextPath}/rest/book/" + number,
    					method:"get",
    					data: this.currentData,
    				})
    				.then((resp)=>{
    	            	console.log(resp.data.bookTitle);
    					this.currentData.bookTitle = resp.data.bookTitle;
    				});
    			},
    			
    			rental(){
    				var choice = window.confirm("해당 도서관에서 책을 대여하시겠습니까?");
    				if(choice == false) return;
    				
    				console.log(${login});
    				
    				axios({
    					url:"${pageContext.request.contextPath}/rest/booking/",
    					method:POST,
    					data: this.bookingData,
    				})
    				.then((resp)=>{
    					this.bookingList.push(resp.data);
    					window.alert("대여가 완료됐습니다. 당일 내에 해당 도서관에서 책을 찾아주세요.");
					});
				},
    			
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
            created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/lib-book/",
					method:"get"
				})
				.then((resp)=>{
					this.bookList.push(...resp.data);
				})
				
                axios.get("http://localhost:8080/bookstore/rest/lib-book/book/" + ${bookDto.bookNo})
                .then(resp=>{
                    this.yesList = resp.data;
                });
            },
        });
        app.mount("#app");
    </script>
    	 <script type = "text/javascript">
	document.getElementById("demo").addEventListener('click', function () {
		
		alert("장바구니에 등록되었습니다.");
	});
	</script>
   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>