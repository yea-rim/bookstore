<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/member"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="information" method="post">
	<div class="container w1000 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>개인정보 변경</h2>
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
    
                       <nav class="text-center header__menu">
                        <ul>
                            <li class="active"><a href="${root}/mypage">내 정보</a></li>
							<li><a href="${root}/information">개인정보 변경</a></li>
							<li><a href="${root}/password">비밀번호 변경</a></li>
							<li><a href="${pageContext.request.contextPath}/pay/payList">주문목록</a>
								<ul class="header__menu__dropdown">
										<li><a href="${pageContext.request.contextPath}/admin/booking1">대여 목록</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/booking2">반납 목록</a></li>
									</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/board/used_book_list?type=board_head&keyword=중고">중고 판매 내역</a></li>
							<li><a href="${pageContext.request.contextPath}/board/qna_list?type=board_writer&keyword=${memberDto.memberId}">1:1 문의내역</a></li>
                        </ul>
                    </nav>
   	<div class="row">
		<table class="table table-border table-hover">
		<tr>
	        <th>이름</th>
	        <td><input type="text" name="memberNick" autocomplete="off" required class="form-input fill input-round" value="${memberDto.memberNick}"></td>
	     </tr>
		<tr>
	        <th>생년월일</th>
	       <td><input type="date" name="memberBirth" autocomplete="off" required class="form-input input-round" value="${memberDto.memberBirth}"></td>
	    </tr>
		<tr>
	        <th>전화번호</th>
	        <td><input type="tel" name="memberPhone" autocomplete="off" required class="form-input fill input-round" value="${memberDto.memberPhone}"></td>
		</tr>
		<tr>
	        <th>이메일</th>
	       <td><input type="email" name="memberEmail" autocomplete="off" class="form-input fill input-round" value="${memberDto.memberEmail}"></td>
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
	        <th>비밀번호 확인</th>
	        <td><input type="password" name="memberPw" required class="form-input fill input-round"></td>
		</tr>
		<tr>
		<th></th>
	      <td><div align="right"><button type="submit" class="btn btn-primary fill">정보 변경하기</button></div></td>
		</tr>
	    		</table>
	</div>
	
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
	    
	    <c:if test="${param.error != null}">
		<div class="row center" >
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>