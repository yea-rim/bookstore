<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
<form action="join" method="post" enctype="multipart/form-data">

	<div class="container w450 m30" id="app">
	    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회원가입</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/bookstore/">Home</a>
                            <span>북스토어</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<div class="row">
		<table class="table table-border table-hover">
		<tr>
			<th>아이디</th>
			 <td><input type="text" v-model="memberId"
				v-on:input="memberId = $event.target.value" name="memberId"
				class="id-input">
				<input type = "button" type="button" id="idChk" onclick="fn_idChk();"
					value="중복체크"></input>
				<div>{{memberIdMessage}}</div></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
	                <input type="password" v-model="memberPw" v-on:input="memberPw = $event.target.value" name="memberPw">
     			  	<div>{{memberPwMessage}}</div>
     			  </td>
			</tr>
				<tr>
				<th>비밀번호 확인</th>
				<td>
	                <input type="password" v-model="memberPwAgain" v-on:input="memberPwAgain = $event.target.value" >
     			  	<div>{{memberPwAgainMessage}}</div>
     			  </td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
	        	 <input type="text" v-model="memberNick" v-on:input="memberNick = $event.target.value" name="memberNick">
       			 <div>{{memberNickMessage}}</div>
	        	</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
	        <input type="date" name="memberBirth" required class="form-input input-round" autocomplete="off">
	    		</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
	        <input type="tel" name="memberPhone" required placeholder="- 제외하고 입력" class="form-input fill input-round" autocomplete="off">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
	<input type="email" name="memberEmail"  name="memberEmail" class="email-input fill input-round">
	<input type="button" value="인증메일 보내기" class="btn-send-mail">
	<div class="cert-area">
		<input type="text" name="certNumber" class="number-input fill input-round">
		<input type="button" value="인증하기" class="btn-cert-check">
		</div>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
	        <input type="text" name="memberPost" size="6" maxlength="6" placeholder="우편번호" class="form-input input-round" autocomplete="off">
	        <input type="button" class="address-find-btn btn" value="우편번호 찾기" >
				<br>
	        <input type="text" name="memberBasicAddress" placeholder="기본주소" class="form-input fill input-round" autocomplete="off">
					<br>
	        <input type="text" name="memberDetailAddress" placeholder="상세주소" class="form-input fill input-round" autocomplete="off">
				</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
	    	<input type="file" name="memberProfile" class="form-input input-round">
				</td>
			</tr>
			<tr>
				<th>
				<td>
	        	<div align="right" ><button type="submit" class="btn btn-primary fill">회원가입</button></div>
	        </td>
			</tr>
			</table>
	</div>
	</div>
</form>



<script src="https://unpkg.com/vue@next"></script>
<script>
        const app = Vue.createApp({
            data(){
                return {
                    memberNick:"",
                    memberId:"",
                    memberPw:"",
                    memberPwAgain:"",
                };
            },
            computed:{
                memberNickJudge(){
                    const regex = /^[가-힣0-9]{2,10}$/;
                    return regex.test(this.memberNick);
                },
                memberNickMessage(){
                    if(this.memberNick == ""){
                        return "";
                    }
                    else if(this.memberNickJudge){
                        return "멋진 이름이네요!";
                    }
                    else {
                        return "한글 또는 숫자 2~10자로 작성하세요";
                    }
                },
                memberIdJudge(){
                    const regex = /^[a-z][a-z0-9]{7,19}$/;
                    return regex.test(this.memberId);
                },
                memberIdMessage(){
                    if(this.memberId == ""){
                        return "";
                    }
                    else if(this.memberIdJudge){
                        return "멋진 아이디네요!";
                    }
                    else {
                        return "영문 소문자, 숫자 8~20자로 작성하세요";
                    }
                },
                memberPwJudge(){
                    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/;
                    return regex.test(this.memberPw);
                },
                memberPwMessage(){
                    if(this.memberPw == ""){
                        return "";
                    }
                    else if(this.memberPwJudge){
                        return "형식에 맞는 비밀번호 입니다";
                    }
                    else {
                        return "영어 대문자, 영문 소문자, 숫자, 특수문자 8~16자로 작성하세요";
                    }
                },
                memberPwAgainMessage(){
                    //typescript에서는 === 가 없다
                    if(this.memberPwAgain == ""){
                        return "";
                    }
                    else if(this.memberPwAgain == this.memberPw){
                        return "비밀번호가 일치합니다";
                    }
                    else {
                        return "비밀번호가 일치하지 않습니다";
                    }
                },
            },
        });
        app.mount("#app");
    </script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
   $(function(){
      var object = {
         email:"",
         cert:false,
      };
      
      $(".cert-area").hide();
      
      $(".btn-send-mail").click(function(){
         var email = $(".email-input").val();
         
         $.ajax({
            url:"${pageContext.request.contextPath}/asyncSend",
            type:"post",
            data:{
               certTarget:email
            },
            beforeSend:function(){
               $(".btn-send-mail").prop("disabled", true);
               $(".btn-send-mail").val("메일 발송중...");
            },
            complete:function(){
               $(".btn-send-mail").prop("disabled", false);
               $(".btn-send-mail").val("인증메일 보내기");
            },
            success:function(resp){
               //이메일 발송이 성공한 경우
               console.log("성공");
               $(".cert-area").show();
               $(".email-input").prop("readonly", true);
               object.email = email;//상태 객체에 발송된 이메일을 따로 저장(조작이 불가능)
            },
            error:function(){
               console.log("실패");   
            }
         });
      });
      
      $(".btn-cert-check").click(function(){
         var email = object.email;
         var number = $(".number-input").val();
         //email, number 입력에 대한 검사
         
         $.ajax({
            url:"${pageContext.request.contextPath}/asyncCheck",
            type:"post",
            data:{
               certTarget:email,
               certNumber:number
            },
            success:function(resp){
               console.log(resp);
               if(resp){
                  $(".btn-cert-check").prop("disabled", true);
                  $(".number-input").prop("disabled", true);
                  object.cert = true;
                  alert("인증 성공");
               }
               else {
                  alert("인증번호가 일치하지 않습니다");
               }
            },
            error:function(){
               console.log("통신 오류");   
            }
         });
      });
      
   });
   
 //아이디 검사
   function fn_idChk(){
		var id = $(".id-input").val();
		  $.ajax({
		    url : "${pageContext.request.contextPath}/member/idCheck",
		    type : "post",
		    dataType : "json",
		    data : {memberId : id},
		    success : function(data){
		      if(data == 1){
		        alert("중복된 아이디입니다.");
		      }else if(data == 0){
		        alert("사용가능한 아이디입니다.");
		      }else {
		        alert("이메일을 입력해주세요.");
		 		     }
				 }
		  })
	}	

   
</script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('sample6_postcode').value = data.zonecode;
                    $("input[name=memberPost]").val(data.zonecode);
                    //document.getElementById("sample6_address").value = addr;
                    $("input[name=memberBasicAddress]").val(addr);
                    // 커서를 상세주소 필드로 이동한다.
                    //document.getElementById("sample6_detailAddress").focus();
                    $("input[name=memberDetailAddress]").focus();
                }
            }).open();
        }
    </script>
    
        <script type="text/javascript">
        $(function(){
            $(".address-find-btn").click(findAddress);
        });
    </script>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>