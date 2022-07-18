<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/3.0.2/toastui-editor.min.css" >
<div class="container w800 m30">
	 
	<div class="row">
		<table class="table table-border">
			<tr>
				<td class="left">
					<h2>
						${boardDto.boardTitle}
					</h2>
				</td>
			</tr>
			
			<tr>
				<td class="left">	
					<c:choose>
						<c:when test="${boardDto.boardWriter == null}">
							(탈퇴한 사용자)
						</c:when>
						<c:otherwise>
							${boardDto.boardWriter}
				 			(${memberDto.memberGrade})
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<!-- 
				내용 표시 영역 
				(주의) pre 태그는 아무런 에디터도 쓰지 않았을 경우에만 사용
			-->

			<textarea class="content"  style=display:none>${(boardDto.boardContent)}</textarea>

			
			<tr height="250">
				<td valign="top" class="left">
				<div class="toast-custom-viewer"></div>
<script src="https://uicdn.toast.com/editor/3.0.2/toastui-editor-all.min.js"></script>
    <script>
    var content = $(".content").val();
        //Viewer용 CDN을 사용할 경우
        // const editor = new toastui.Editor({
        //     el : document.querySelector(".toast-custom-viewer"),
        //     initialValue : "Hello toast ui editor~!"
        // });
        //전체(ALL)용 CDN을 사용할 경우
        const editor = toastui.Editor.factory({
            el : document.querySelector(".toast-custom-viewer"),
            viewer:true,
        	initialEditType: "markdown",
            initialValue : content
        })
        
        
    </script>
    
    
    
				</td>
			</tr>
			
			<!-- 버튼 영역 -->
			<tr>
				<td class="right">
					<a href="${pageContext.request.contextPath}/board/write" class="link link-btn">글쓰기</a>
					<c:if test="${isOwner || isAdmin}">
					<a href="${pageContext.request.contextPath}/board/edit?boardNo=${boardDto.boardNo}" class="link link-btn">수정</a>
<!--					<a href="${pageContext.request.contextPath}/board/edit/${boardDto.boardNo}" class="link link-btn">수정</a>
-->					<a href="${pageContext.request.contextPath}/board/delete?boardNo=${boardDto.boardNo}" class="link link-btn">삭제</a>
<!-- 			<a href="${pageContext.request.contextPath}/board/delete/${boardDto.boardNo}" class="link link-btn">삭제</a>
-->							</c:if>
					<a href="${pageContext.request.contextPath}/board/list" class="link link-btn">목록</a>
				</td>
			</tr>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>