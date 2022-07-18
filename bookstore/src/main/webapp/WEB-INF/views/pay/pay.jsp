<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
   style="background-color: #F09F00;">

   <div class="container">
      <div class="row">
         <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
               <h2>주문결제</h2>
               <div class="breadcrumb__option">
                  <a href="./index.html">Home</a> <span>주문 결제</span>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- Breadcrumb Section End -->

<div class="container">
   <section class="shoping-cart spad">
      <!-- form(결제구현 )-->
      
         <div class="row">
            <div class="col-lg-8">
               <div class="row float-container mt-1">
                  <div class="table" id="app">
                    
                     <h3>
                        [배송정보]
                     </h3>

                     <table>
                        <tbody>
                           <tr style="border-bottom: none;">
                              <th class="col-lg-3"><h5>이름 *</h5></th>
                              <td class="col-lg-9"><input type="text"
                                 v-model="currentData.memberName" style="width: 150px;">
                                 &nbsp;
                                 <input type="button" v-on:click="readMember"
                                    style="border: none; background: #F09F00; color: #ffffff; height: 30px;" value = "내정보">

                              </td>
                           </tr>
                           <tr>
                              <th><h5>전화번호 *</h5></th>
                              <td><input type="text" v-model="currentData.memberPhone">
                              </td>
                           </tr>
                           <tr>
                              <th><h5>주소 *</h5></th>
                              <td><input type="text" v-model="currentData.memberPost"
                                 v-model="used" style="width: 170px;"></td>
                           </tr>
                           <tr>
                              <th></th>
                              <td><input type="text"
                                 v-model="currentData.memberBasicAddress"
                                 style="width: 350px;"></td>
                           </tr>
                           <tr>
                              <th></th>
                              <td><input type="text"
                                 v-model="currentData.memberDetailAddress"
                                 style="width: 350px;"></td>
                           </tr>

                        </tbody>
                     </table>
                  </div>
                  <!-- 주문상품 -->
                   <form action="${pageContext.request.contextPath }/pay/purchase" method="get">
                  <div class="row float-container mt-1">
                  
                         <div class="shoping__cart__table">
                  <h3>[주문상품]</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan ="2" width = "65%">상품정보</th>
<!--                                     <th width = "630px">도서명</th> -->
                                    <th>판매가</th>
                                    <th>수량</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                               <!-- form(결제구현 )-->
                               <form action="${pageContext.request.contextPath }/pay/purchase" method = "get">
                                <!-- 쇼핑몰책 먼저 보이게 하기(수량이 0보다 클때만 나오게) -->
                                  <c:if test="${storeAmount>0}">
                        <input type = "hidden" name = "finalStore[${0 }].storeBookNo" value = "${storeDto.storeBookNo }">
                        <input type = "hidden" name = "finalStore[${0 }].quantity" value = "${storeAmount }">
                                
                                <tr>
                                    <td class="shoping__cart__item" width = "10%">
                                        <img src="${storeDto.bookImage }">
                                    </td>
                                     <td  style = "text-align:left" width="50%">
                              <h5>${storeDto.bookTitle }</h5>
                                     </td>  
                                    <td class="shoping__cart__price">
                                        ${storeDto.storePrice }원                                   </td>
                                    <td class="shoping__cart__quantity">
                                       <h5>${storeAmount }개</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class="shoping__cart__total">
                 							${storeDto.storePrice * storeAmount}원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                  </c:if>
                                <!-- 중고데이터 보여주기 -->
                                <c:forEach var="usedDto" items="${usedList }" varStatus="status">
                                <input type = "hidden" name = "finalUsed[${status.index }].usedNo" value = "${usedDto.usedNo }">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${usedDto.bookImage }">
                                    </td>
                                     <td  style = "text-align:left">
                              <h5>${usedDto.bookTitle }</h5>
                                     </td>
                                    <td class="shoping__cart__price">
                                        ${usedDto.usedPrice }원                                   </td>
                                    <td class="shoping__cart__quantity">
                                       <h5>1개</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class="shoping__cart__total">
                                      ${usedDto.usedPrice }원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                </c:forEach>
<!--                                 <tr> -->
<!--                                     <td class="shoping__cart__item"> -->
<!--                                         <img src="img/cart/cart-2.jpg" alt=""> -->
<!--                                         <h5>Fresh Garden Vegetable</h5> -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__price"> -->
<!--                                         $39.00 -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__quantity"> -->
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__total"> -->
<!--                                         $39.99 -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__item__close"> -->
<!--                                         <span class="icon_close"></span> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td class="shoping__cart__item"> -->
<!--                                         <img src="img/cart/cart-3.jpg" alt=""> -->
<!--                                         <h5>Organic Bananas</h5> -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__price"> -->
<!--                                         $69.00 -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__quantity"> -->
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__total"> -->
<!--                                         $69.99 -->
<!--                                     </td> -->
<!--                                     <td class="shoping__cart__item__close"> -->
<!--                                         <span class="icon_close"></span> -->
<!--                                     </td> -->
<!--                                 </tr> -->
                            </tbody>
                        </table>
                    </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="shoping__cart__table">

                  <div class="shoping__checkout">
                     <h5>결제정보</h5>
                     <ul>
<%--                         <li>상품금액 <span>${total}원</span></li> --%>
<!--                         <li>할인금액<span>적림금 안해줄거야</span></li> -->
                        <li>Total <span>${total}원</span></li>
                     </ul>
                     <input type="submit" class="primary-btn" value="결제하기">
                  </div>
               </div>
            </div>
         </div>
      </form>
   </section>
</div>

<!-- Shoping Cart Section End -->
<script src="https://unpkg.com/vue@next"></script>
<!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- Shoping Cart Section End -->
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                   memberList:[],
                   currentData: {
                       memberName:"",
                       memberPhone:"",
                       memberPost:"",
                       memberBasicAddress:"",
                       memberDetailAddress:"",
                    },
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
               readMember(){
                const query = "${login}";
                axios({
                   url:"${pageContext.request.contextPath}/rest/basket/" + query,
                   method:"get",
                   data: this.currentData,
                })
                .then((resp)=>{
                      console.log(resp.data);
//                    this.currentData = resp.data.items[0];
                   this.currentData.memberName = resp.data.memberNick;
                   this.currentData.memberPhone = resp.data.memberPhone;
                   this.currentData.memberPost = resp.data.memberPost;
                   this.currentData.memberBasicAddress = resp.data.memberBasicAddress;
                   this.currentData.memberDetailAddress = resp.data.memberDetailAddress;
                   console.log(this.currentData);
                });
             },
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
        });
        
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
