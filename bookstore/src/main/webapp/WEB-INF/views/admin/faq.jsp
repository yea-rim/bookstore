<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>faq 작성</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/bookstore/admin/">Home</a>
                            <span>관리자 페이지</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<div class="row float-container mt-1" id="app">

		<div class="float-left" style="width:100%">
			<form action="write" method="post">
			<input type="hidden" name="boardHead" value="공지">
				<div class="container w800 m30">
			
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

				</div>
			</form>
		</div>

	</div>

    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	const app = Vue.createApp({
		data(){

		},
				
			};
		},
		computed:{

		},
		methods:{

		},
		created(){
				axios({
					url:"${pageContext.request.contextPath}/rest/book/",
					method:"get"
				})
				.then((resp)=>{
					//console.log(resp);
					console.log(resp.data);
					this.bookList.push(...resp.data);
				})
		},
	});
	app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>