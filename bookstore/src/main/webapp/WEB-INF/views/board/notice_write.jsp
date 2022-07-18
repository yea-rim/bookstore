<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<form action="write" method="post">
	<input type="hidden" name="boardHead" value="공지">
<c:if test="${isAdmin}">
<c:set var="root" value="${pageContext.request.contextPath}/admin"></c:set>
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>공지사항 관리 페이지</h2>
                        <div class="breadcrumb__option">
							<a href="http://localhost:8080/bookstore/admin/book">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                    <nav class="text-center header__menu">
                        <ul>
                            <li class="active"><a href="${root}/book">도서 관리</a>
			                    <ul class="header__menu__dropdown">
									<li><a href="${root}/lib-book">도서관 도서</a></li>
									<li><a href="${root}/store-book">스토어 도서</a></li>
									<li><a href="${root}/used-book">중고 도서</a></li>
			                    </ul>
			                </li>	
							<li><a href="${root}/lib">도서관 관리</a></li>
							<li><a href="${root}/member">회원 관리</a></li>
							<li><a href="${root}/delivery">배송 관리</a></li>
							<li><a href="/bookstore/board/qna_list">1:1 관리</a></li>
							<li><a href="/bookstore/board/notice_write">공지사항 관리</a></li>
							<li><a href="${root}/faq">faq 관리</a></li>
                        </ul>
                    </nav>
	<div class="container w800 m30">
		<div class="row center">
		</div>
		<div class="row">
			<label>제목</label> <input type="text" name="boardTitle"
				autocomplete="off" required class="form-input fill input-round">
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
		        initialEditType: 'WYSIWYG',
		        previewStyle: 'WYSIWYG',
		        hooks: {
		            'addImageBlobHook': function(blob, callback){
		            	var data = new FormData();
		                //2. data에 업로드할 파일을 이름을 부여하여 추가
		                // - 이름은 서버에서 읽을 이름으로 설정
		                data.append("attachment", blob);
		                //3. ajax 요청을 통해 파일 업로드
		                axios.post("${pageContext.request.contextPath}/attachment/upload", data, {
		                    //multipart 설정
		                    headers: {
		                        "Content-Type" : "multipart/form-data"
		                    },
		                })
		                //4.업로드 한 이후 데이터 attachmentNo this.num 저장 다운로드 주소 뒤에 추가
		                .then((res)=> {
		                	console.log(res)
		                	this.num = res.data;
		                callback("${pageContext.request.contextPath}/attachment/download?attachmentNo="+this.num, "alt text");
		                })
		            	 .catch((err)=>{
		                	window.alert("업로드 실패");
		                })
		            }
		        }
		    })
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
	</c:if>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>