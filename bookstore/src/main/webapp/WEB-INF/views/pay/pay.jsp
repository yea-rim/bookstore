<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
     <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
      
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주문결제</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>주문 결제</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">도서표지</th>
                                    <th width = "630px">도서명</th>
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
                                    <td class="shoping__cart__item">
                                        <img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
                                    </td>
                                  	<td  style = "text-align:left">
										<h5>${storeDto.bookTitle }</h5>
                                  	</td>  
                                    <td class="shoping__cart__price">
                                        ${storeDto.storePrice }                                    </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>${storeAmount }개</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
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
                                        <img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
                                    </td>
                                  	<td  style = "text-align:left">
										<h5>${usedDto.bookTitle }</h5>
                                  	</td>
                                    <td class="shoping__cart__price">
                                        ${usedDto.usedPrice }                                    </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>1개</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
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
                  <div class="col-lg-4">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>${uesdNoList[0] }</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <input type = "submit" class = "primary-btn" value = "결제하기">
<!--                         <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a> -->
                    </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
<!--                             <form action="#"> -->
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
<!--                             </form> -->
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    