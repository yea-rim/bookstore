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
        <div id = "app" class="container" width = "850px">
<%--                     	<form action = "${pageContext.request.contextPath }/pay" method = "post"> --%>
			<form v-on:submit.prevent="submitForm">
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="shoping__cart__table">
                         <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan = "2">상품정보</th>
                                    <th>판매가</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th>선택</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <tr v-for = "(basket, index) in dataList" v-bind:key="index">
                                <!-- 책 이미지 보여주는 칸 -->
                                    <td class="shoping__cart__item">                                   
                                   	<div>
<%-- 									<c:set var="i" :value = "index"/> --%>
                                   	<input v-if = "storeSeen(index)" type = "checkbox" :value = "basket.basketBookNo" >
                                   	<input v-if = "storeSeen(index)" type = "hidden" :value = "basket.basketAmount" >
									
									<input v-if = "usedSeen(index)" type = "checkbox" :value = "basket.basketUsedNo">                                   	
                                   	</div>
									<img :src= "basket.basketBookImage"/>
								</td>
                                    <!-- 책제목 보여주는 칸 -->
                                  	<td  style = "text-align:left" width = "40%">
                                  		<h5 v-if = "usedSeen(index)" >중고랍니다</h5>
										<h5>{{basket.basketBookTitle}}</h5>
                                  	</td>  
                                    <td class="shoping__cart__price">
                                       <h5>{{basket.basketPrice}}</h5>                                   
                                        </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>{{basket.basketAmount}}</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class = "shoping_cart_quantity">
                                    	<h5>수량</h5>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <a href = "#" v-on:click.prevent = "deleteItem(index);" class = "primary-btn">삭제</a> 
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
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="shoping__continue"> -->
<!--                         <div class="shoping__discount"> -->
<!--                             <h5>Discount Codes</h5> -->
<!--                             <form action="#"> -->
<!--                                 <input type="text" placeholder="Enter your coupon code"> -->
<!--                                 <button type="submit" class="site-btn">APPLY COUPON</button> -->
<!--                             </form> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="col-lg-12">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
<!--                         <a href="#" class="primary-btn">주문하기</a> -->
                      	<input type = "submit" value = "주문하기" class = "primary-btn">
                      	</form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
    
    <!-- vue js도 lazy loading을 사용한다 -->
     <script src="https://unpkg.com/vue@next"></script>
   <!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                	listVO:[],
                    dataList:[],
                    formData:[],
                };
            },
            computed:{
            },
            methods:{
            	
//             	submitForm(){
//     				axios({
//     					url:"${pageContext.request.contextPath}/pay",
//     					method:"post",
//     					data: this.formData,
//     				})
//     				.then((resp)=>{
//     	            	console.log(resp.data.items[0].title);
// //     					this.formData = resp.data.items[0];
//     					this.currentData.bookTitle = resp.data.items[0].title;
//     					console.log(this.formData);
//     				});
//     			},
            	
            	submitForm(){
            		console.log(this.dataList);
            	      var url = 'http://localhost:8080/bookstore/pay';
            	      var data = {
            	    		  bookNo: this.username,
            	    		  storeAmount: this.password,
            	    		  listVO: this.listVO
            	      }
            	      axios.post(url, data)
            	        .then(function(response){
            	        console.log(response);
            	       })
            	        .catch(function(error){
            	          console.log(error);
            	        });
            	},
            	
				//쇼핑몰일떄만 보이게
				storeSeen(index) {
					const basketBookNo = this.dataList[index].basketBookNo;
					return basketBookNo != 0;
				},
            	
            	
            	//중고일떄만 보이게
            	usedSeen(index){
            		const basketUsedNo = this.dataList[index].basketUsedNo;
            		return basketUsedNo != 0;
            	},            	
            	
            	deleteItem(index) {
            		
            		const basketNo = this.dataList[index].basketNo;
            		axios({
            			url:"${pageContext.request.contextPath}/rest/basket/"+basketNo,
            			method:"delete"
            		})
            		.then(()=>{
            			this.dataList.splice(index,1);
            			//+ 알람 (외부 API)
            		});
            	}
                
            },
            watch:{
                
            },
    		created(){
    				axios({
    					url:"${pageContext.request.contextPath}/rest/basket/",
    					method:"get"
    				})
    				.then((resp)=>{
    					this.dataList.push(...resp.data);
    				})
    		},
        });
        app.mount("#app");
    </script>
    
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    