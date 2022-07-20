<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="find_id" method="post">
	<div class="container w400 m30">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>아이디 찾기</h2>
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
			<th>이름</th>
	        <td><input type="text" name="memberNick" autocomplete="off" required class="form-input fill input-round"></td>
		</tr>
			<tr>
			<th>전화번호</th>
	        <td><input type="tel" name="memberPhone" autocomplete="off" required class="form-input fill input-round"></td>
		</tr>
			<tr>
			<th>생년월일</th>
	        <td><input type="date" name="memberBirth" autocomplete="off" required class="form-input input-round"></td>
		</tr>
			<tr>
	        		<th></th>
	      <td><div align="right"><button type="submit" class="btn btn-primary fill">아이디 찾기</button></div></td>
	        </tr>
		</table>
	</div>
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>