<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post" enctype="multipart/form-data">
<input type="hidden" name="boardHead" value="감상평">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
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
	        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
			<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
			<script> 
			const Editor = toastui.Editor;
		    const editor = new Editor({
		        el: document.querySelector('#editor'),
		        height: '600px',
		        initialEditType: 'markdown',
		        previewStyle: 'markdown',
		        hooks: {
		            'addImageBlobHook': function(blob, callback){
		            	
		            	var data = new FormData();
		                
		                //2. data에 업로드할 파일을 이름을 부여하여 추가
		                // - 이름은 서버에서 읽을 이름으로 설정
		                data.append($("input[name=boardAttachment]"), blob);
		                
		                //3. ajax 요청을 통해 파일 업로드
		                axios.post("http://localhost:8080/bookstore/board/file", data, {
		                    //multipart 설정
		                    headers: {
		                        "Content-Type" : "multipart/form-data"
		                    }
		                })
		            }
		        }
		    });
		    
		    const uploadImage =  (blob) => {
		        const formData = new FormData();
		        formData.append('image', blob);
		        // 서버로부터 이미지 주소 받아오는거 구현 필요
		        const url = "${pageContext.request.contextPath}${boardAttachmentUrl}";
		        return url;
		    };

			
			editor.on("change", function(){
				var content = editor.getMarkdown();
				$("input[name=boardContent]").val(content);
				console.log($("input[name=boardContent]").val());
			});
	
			
			</script>
	
			<input type="hidden" name="boardContent">
	    </div>
	    <!-- 
	    <div class="row">
	    	<label>게시판이미지</label><br>
	    	<input type="file" name="boardAttachment" class="form-input input-round">	
	    </div>
	     -->
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">등록</button>
	    </div>
	    <div class="row">
	        <a href="list" class="link link-btn fill">목록</a>
	    </div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>