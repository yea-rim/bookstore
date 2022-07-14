<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
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
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                         <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan = "2">상품정보</th>
<!--                                     <th width = "630px">도서명</th> -->
                                    <th>판매가</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th>선택</th>
                                </tr>
                            </thead>
                            <tbody>
                            	
                                
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="https://bookthumb-phinf.pstatic.net/cover/224/583/22458391.jpg?type=m1&udate=20220610">
                                    </td>
                                  	<td  style = "text-align:left" width = "40%">
										<h5>1</h5>
                                  	</td>  
                                    <td class="shoping__cart__price">
                                       <h5>1</h5>                                   
                                        </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>1</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class = "shoping_cart_quantity">
                                    	<h5>10000원</h5>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <h5>선택 버튼</h5>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div>
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
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    