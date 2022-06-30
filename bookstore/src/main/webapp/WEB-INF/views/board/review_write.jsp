<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post">
<input type="hidden" name="boardHead" value="감상평">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

	<div class="container w800 m30">
	    <div class="row center">
	        <h1>감상평 작성</h1>
	    </div>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="boardTitle" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>내용</label>
	        <div id="editor"></div> 
	        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
			<script> 
			
				const Editor = toastui.Editor; 
				const editor = new Editor({ 
					el: document.querySelector('#editor'),
					height: '500px',
					initialEditType: 'markdown',
					previewStyle: 'markdown'
				});
				
				editor.on("change", function(){
					var content = editor.getMarkdown();
					$("input[name=boardContent]").val(content);
					console.log($("input[name=boardContent]").val());
				});
			</script>
			<input type="hidden" name="boardContent">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">등록</button>
	    </div>
	    <div class="row">
	        <a href="list" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>