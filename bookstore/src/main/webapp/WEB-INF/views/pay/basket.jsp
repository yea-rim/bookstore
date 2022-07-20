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
                        <h2>장바구니 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>내 장바구니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
<%-- 	<form @submit.prevent="sendPost" action = "${pageContext.request.contextPath }/pay2" method = "post"> --%>
    <form action = "${pageContext.request.contextPath }/pay2" method = "post">
    <section class="shoping-cart spad">
        <div id = "app" class="container">
            <div class="row" >
				
                <div class="col-lg-12" >
                    <div class="shoping__cart__table">
                     	 <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan = "2">상품정보</th>
                                    <th>새상품/중고</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th>선택</th>
                                </tr>
                            </thead>
                            <tbody >
                           		<input type = "hidden" name = "total" :value = "total">
                            	
                                <tr v-for = "(basket, index) in dataList" v-bind:key="index" >
                                <!-- 책 이미지 보여주는 칸 -->
                                    <td class="shoping__cart__item">                                   
                                   	<div>
<%-- 									<c:set var="i" value = "{{index}}"/> --%>
                                   	<input v-if = "storeSeen(index)" type = "hidden" :name = "store(index)" :value = "basket.basketBookNo" >
                                   	<input v-if = "storeSeen(index)" type = "hidden" :name = "storeQuantity(index)" :value = "basket.basketAmount" >
									
									<input v-if = "usedSeen(index)" type = "hidden" :name = "used(index)" :value = "basket.basketUsedNo">                                   	
									<input v-if = "usedSeen(index)" type = "hidden" :name = "usedQuantity(index)" :value = "basket.basketAmount">                                   	
                                   	</div>
									<img :src= "basket.basketBookImage"/>
								</td>
                                    <!-- 책제목 보여주는 칸 -->
                                  	<td  style = "text-align:left" width = "40%">
                                  		<h5 v-if = "usedSeen(index)" >중고랍니다</h5>
										<h5>{{basket.basketBookTitle}}</h5>
                                  	</td>  
                                    <td class="shoping__cart__price">
                                       <h5 v-if = "usedSeen(index)">중고도서</h5>                                   
                                       <h5 v-if = "storeSeen(index)">새도서</h5>                                   
                                        </td>
                                    <td class="shoping__cart__quantity">
                                    	<h5>{{basket.basketAmount}}개</h5>
<!--                                         <div class="quantity"> -->
<!--                                             <div class="pro-qty"> -->
<!--                                                 <input type="text" value="1"> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </td>
                                    <td class = "shoping_cart_quantity">
                                    	<h5>{{basket.basketPrice}}원</h5>
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
<!--                            </form> -->
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${pageContext.request.contextPath }/book/list" class="primary-btn cart-btn">도서목록으로 가기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                           	${login }님의 장바구니</a>
                    </div>
                </div>
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="shoping__continue"> -->
<!--                         <div class="shoping__discount"> -->
<!--                             <h5>Discount Codes</h5> -->
<!--                             <form action="#"> -->
<!--                                 <input type="text" placeholder="Enter your coupon code"> -->
<!--                                 <button type="submit" class="site-btn">APPLY COUPON</button> -->
                            
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="col-lg-12">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li> <span></span></li>
                            <li>총 결제금액<span>{{total}}원</span></li>
                        </ul>
<!--                         <a href="#" class="primary-btn">주문하기</a> -->
                      	<input type = "submit" value = "주문하기" class = "primary-btn">
                        
                    </div>
                </div>
        	</div>
       </div>
    </section>
    </form>
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
         			memberId:"${memberId}",
                    dataList:[],
					//쇼핑몰에 체크여부 데이터
                    storeCheck:false,  
                    total:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
            	
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	sendPost() {
						axios.post('')
            	},
				
            	storeCheck(index){
            		this.storeCheck.push(index);
            	},
            	//중고 input 에 네임 생성하기위한 코드
				
            	storeBuy(index){
					const storeBuyNo = this.storeCheck[index]
					return storeBuyNo>0;
				},
         		used(index) {
         			return "used["+index+"].usedNo";
         		},
         		usedQuantity(index) {
         			return "used["+index+"].quantity";
         		},
         		store(index) {
         			return "store["+index+"].storeNo";
         		},
         		storeQuantity(index) {
         			return "store["+index+"].quantity";
         		},
            	
         		//쇼핑몰이면서 체크박스에 체크되었을떄만
         		
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
            		//삭제시 총금액 동기화
            		axios({
    					url:"${pageContext.request.contextPath}/rest/basket/total/"+this.memberId,
    					method:"get"
    				})
    				.then((resp)=>{
    					//console.log(resp);
    					console.log(resp.data);
    					this.total = resp.data;
    				});
            	}
                
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
            created(){
//     			ajax 통신을 사용하여 exam list를 불러온다
//     			1. jquery ajax를 이용하는 방법
//     			const that = this;
//     			$.ajax({
//     				url:"${pageContext.request.contextPath}/rest/exam/",
//     				type:"get",
//     				dataType:"json",
//     				success:function(resp){
//     					//for(let i=0; i < resp.length; i++){
//     					//	that.dataList.push(resp[i]);
//     					//}
//     					that.dataList.push(...resp);//javascript 전개 연산자(ES6)
//     				},
//     				error:function(e){
//     					console.log("error");
//     				},
//     			});
    			
//     			2. axios 이용하는 방법
//     			axios({옵션}).then(성공콜백).catch(에러콜백);
    				
    				axios({
    					url:"${pageContext.request.contextPath}/rest/basket/"+this.memberId,
    					method:"get"
    				})
    				.then((resp)=>{
    					//console.log(resp);
    					//console.log(resp.data);
    					this.dataList.push(...resp.data);
    				}),
    				axios({
    					url:"${pageContext.request.contextPath}/rest/basket/total/"+this.memberId,
    					method:"get"
    				})
    				.then((resp)=>{
    					//console.log(resp);
    					//console.log(resp.data);
    					this.total = resp.data;
    				})
    					
    		},
        });
        app.mount("#app");
    </script>
    
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    