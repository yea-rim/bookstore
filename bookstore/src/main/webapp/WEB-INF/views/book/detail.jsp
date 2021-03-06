<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 <style>
    .used-pay{
    }
    
 </style>
 
  <!-- Breadcrumb Section Begin -->
  	<div class="container w1000 m30">
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
                                          <th>대여</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr v-for="(yes, index) in yesList" v-bind:key="index">
                                          <td>{{yes.libGu}}</td>
                                          <td>{{yes.libName}} <a v-on:click="libInfo(index)">ℹ️</a></td>
                                          <c:if test="${isUser or isAdmin or isBookAdmin == true}">
                                          <td>
                                             <button class="site-btn m-1" style="padding: 5px 10px 5px;" v-on:click="rental(index)" >✓</button>
                                          </td>
                                          </c:if>
                                       </tr>

                                    </tbody>
                                 </table>
                              </div>
   
                              <button @click="handle_toggle" class="site-btn">닫기</button>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div v-show="is_show2" style="position: absolute; left: 700px; top: 300px; z-index: 400; border: solid #F09F00 3px; background-color: #FFFFFF;" class="m-1">
                        <div style="width: 450px;">
                           <div class="p-3" style="text-align: left; padding: 5px; background-color:#F09F00;">
                              <button style="padding: 0px 0px 5px;" class="site-btn">도서관 정보</button>
                           </div>
                           <div class="p-3">
                              <div>
                                 <table class="table table-border">
                                    <tbody>
                                       <tr>
                                          <td>도서관명</td>
                                          <td width="75%">{{libData.libraryName}}</td>
                                       </tr>
                                       <tr>
                                          <td>주소</td>
                                          <td width="75%">{{libData.libraryAddress}}</td>
                                       </tr>
                                       <tr>
                                          <td>전화번호</td>
                                          <td width="75%">{{libData.libraryTel}}</td>
                                       </tr>
                                       <tr>
                                          <td>운영시간</td>
                                          <td width="75%">{{libData.libraryTime}}</td>
                                       </tr>
                                       <tr>
                                          <td>휴일</td>
                                          <td width="75%">{{libData.libraryCloseDate}}</td>
                                       </tr>                                       <tr>
                                          <td>사이트</td>
                                          <td width="75%">{{libData.libraryUrl}}</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
   
                              <button @click="handle_toggle2" class="site-btn">닫기</button>
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
<!--                            <div v-show = "showUsed"> -->
<!--                               <p style="color:red;">중고 재고가 없습니다.</p> -->
<!--                            </div>    -->
<%--                         </c:if> --%>
                        <div v-show = "showUsed">
                        
                        <label>중고가 : &nbsp; ${usedDto.usedPrice }원</label>&nbsp;
                        <input type ="checkbox" name = "used[${status.index+1 }].usedNo" value = "${usedDto.usedNo }">
                        </div>
                  </c:forEach>
                   
                      
                        
                        <br>
                        <c:if test="${param.error != null}">
                                <p style="color:blue;">* 결제(장바구니) 상품이 없습니다.(수량을 확인하세요!)</p>
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
               
									<img src="https://blog.kakaocdn.net/dn/OcpVc/btrHHlioiV6/ALGCFcpLgHJsk4ZHdFWMQk/img.png" height="25px" style="height: 25px;" class="m-2">
									<img src="https://blog.kakaocdn.net/dn/zEZRZ/btrHKcDZj7N/HXYMHqarSOktGKkxCTmIl0/img.png" height="20px" style="height: 20px;" class="m-2"> 
									<img src="https://blog.kakaocdn.net/dn/b1t9yD/btrHKeaMB39/xiI9qixcQElnaPj3FntRt1/img.png" height="20px" style="height: 20px;" class="m-2"> 
									<img src="https://blog.kakaocdn.net/dn/bDqBnZ/btrHKpc5ZWT/jxMkDtAHl5dkF8s8WkSkT1/img.png" height="20px" style="height: 20px;" class="m-2"> 
									<img src="https://blog.kakaocdn.net/dn/6a7uM/btrHOcKoJRg/R8bKxYYnJkvlkLYABgXi00/img.png" height="25px" style="height: 25px;" class="m-2"> 
						
                            </li>
                        </ul>
                    </div>
                </div>
                                               
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">공지사항</a>
                            </li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>반품/교환가능 기간</h6>
                                    <p>변심반품의 경우 수령 후 7일 이내, 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</p>
                                </div>
                                <div class="product__details__tab__desc">
                                    <h6>반품/교환비용</h6>
                                    <p>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</p>
                                </div>
                                <div class="product__details__tab__desc">
                                    <h6>반품/교환 불가 사유</h6>
                                    <p>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우 (단지 확인을 위한 포장 훼손은 제외), 
                                    소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우, 예) 화장품, 식품, 가전제품(악세서리 포함) 등, 
                                    복제가 가능한 상품 등의 포장을 훼손한 경우, 예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집, 
                                    소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우, 
                                    디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우, 
                                    시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우, 
                                    전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우</p>
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
<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>도서관 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=11" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>인플레이션에서 살아남기</h6>
								</div>
							</a>
							
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=25" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/863/22486331.jpg?type=m1&udate=20220609">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자가 되기 위해 꼭 알아야 하는 IT 용어</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=27" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/175/913/17591325.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>자바 개발자를 위한 97가지 제안</h6>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=28" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/159/865/15986525.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> IT 개발자의 영어 필살기</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=82" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/859/22485918.jpg?type=m1&udate=20220706"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>역행자</h6>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>북스토어 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=11" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
								</div>
								<div class="latest-product__item__text">
									<h6>인플레이션에서 살아남기</h6>
									<span>20000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
									<span>14000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=21" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/213/679/21367904.jpg?type=m1&udate=20211217"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자로 살아남기</h6>
									<span>10000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=62" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/379/22537949.jpg?type=m1&udate=20220712"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>감정와해기법</h6>
									<span>16000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=28" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/159/865/15986525.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6> IT 개발자의 영어 필살기</h6>
									<span>30000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=82" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/859/22485918.jpg?type=m1&udate=20220706"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>역행자</h6>
									<span>21000원</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>중고도서 랭킹</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=113" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/453/22545323.jpg?type=m1&udate=20220701"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>원피스 102 (천왕산)</h6>
									<span>8500원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=126" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/696/22569622.jpg?type=m1&udate=20220705"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>나 혼자만 레벨업 6(만화) (만화)</h6>
									<span>11000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=91" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/224/529/22452981.jpg?type=m1&udate=20220610"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>세상의 마지막 기차역</h6>
									<span>14000원</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=139" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/225/056/22505675.jpg?type=m1&udate=20220705"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>너무 잘하려고 애쓰지 마라</h6>
									<span>15000원</span>
								</div>
							<a href="http://localhost:8080/bookstore/book/detail?bookNo=25" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="https://bookthumb-phinf.pstatic.net/cover/224/863/22486331.jpg?type=m1&udate=20220609">
								</div>
								<div class="latest-product__item__text">
									<h6>개발자가 되기 위해 꼭 알아야 하는 IT 용어</h6>
									<span>15000원</span>
								</div>
							</a> <a href="http://localhost:8080/bookstore/book/detail?bookNo=27" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img
										src="https://bookthumb-phinf.pstatic.net/cover/175/913/17591325.jpg?type=m1&udate=20211207"
										alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>자바 개발자를 위한 97가지 제안</h6>
									<span>17000원</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->
    
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
                    is_show2: false,
                    
                    libData:{},
                bookList:[],
                yesList:[],

                bookingData:{
                   bookingNo:"",
                   bookingId:"",
                   bookingBookNo:"",
                   bookingLibrary:"",
                   bookingBookTitle:"",
                },
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
                  
                  handle_toggle2: function(){ 
                      this.is_show2 = !this.is_show2; // #2, #3
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
             
             rental(index){
                var choice = window.confirm("해당 도서관에서 책을 대여하시겠습니까?");
                if(choice == false) return;
                
                this.bookingData.bookingId = '${login}';
                this.bookingData.bookingBookNo = ${bookDto.bookNo};
                this.bookingData.bookingLibrary = this.yesList[index].libName;
                this.bookingData.bookingBookTitle = '${bookDto.bookTitle}';
                
                console.log(this.bookingData);
                
                axios({
                   url:"${pageContext.request.contextPath}/rest/booking/",
                   method:"post",
                   data: this.bookingData,
                })
                .then((resp)=>{
                   window.alert("대여가 완료됐습니다. 당일 내에 해당 도서관에서 책을 찾아주세요.");
               });
            },
            
             libInfo(index){
                const libInfoNo = this.yesList[index].libLibInfoNo;
                console.log(libInfoNo);
                
                    axios.get("http://localhost:8080/bookstore/rest/lib/" + libInfoNo)
                    .then(resp=>{
                        this.libData = resp.data;
                        this.libData.libraryName = resp.data[0].libraryName;
                        this.libData.libraryAddress = resp.data[0].libraryAddress;
                        this.libData.libraryTel = resp.data[0].libraryTel;
                        this.libData.libraryTime = resp.data[0].libraryTime;
                        this.libData.libraryAddress = resp.data[0].libraryAddress;
                        this.libData.libraryCloseDate = resp.data[0].libraryCloseDate;
                        this.libData.libraryUrl = resp.data[0].libraryUrl;
                        this.is_show2 = !this.is_show2;
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
    <c:if test="${isUser or isAdmin or isBookAdmin == true}">
    <script type = "text/javascript">
   document.getElementById("demo").addEventListener('click', function () {
      
      alert("장바구니에 등록하시겠습니까?");
   });
   </script>
   </c:if>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>