<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/3.0.2/toastui-editor.min.css" >

<style>
	.reply-header {
		padding:1em;
		font-size:1.2em;	
	}
	.reply-header > span {
		margin-right:1em;
	}
	.reply-body {
		padding:1em;
		border-bottom: 1px solid gray;
	}
	.reply-header .fa-solid {
		margin-right:0.5em;
		cursor:pointer;
	}
	.reply-header .fa-solid:hover {
		color:red;
	} 
	.reply1{
		width: 1025px;
	}
</style>
<body>
<div id="app" class="container w800 m30">
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
				<div align="right" >
					<a href="${pageContext.request.contextPath}/board/write" class="link link-btn">글쓰기 </a>
					<c:if test="${isOwner || isAdmin}">
					<a href="${pageContext.request.contextPath}/board/edit?boardNo=${boardDto.boardNo}" class="link link-btn">수정 </a>
<!--					<a href="${pageContext.request.contextPath}/board/edit/${boardDto.boardNo}" class="link link-btn">수정</a>
-->					<a href="${pageContext.request.contextPath}/board/delete?boardNo=${boardDto.boardNo}" class="link link-btn">삭제 </a>
<!-- 			<a href="${pageContext.request.contextPath}/board/delete/${boardDto.boardNo}" class="link link-btn">삭제</a>
-->							</c:if>
					<a href="${pageContext.request.contextPath}/board/list" class="link link-btn">목록</a>
					</div>
				</td>
			</tr>
			
			<!-- 댓글 작성란 -->
			<tr>
			<td>
			<div class="row">
					<textarea class="reply1" rows="5" :disabled="isAnonymous" :placeholder="textareaPlaceholder" v-model="boardContent"  style= float:left;></textarea>
					<button class="btn btn-primary fill" :disabled="isAnonymous" @click="addReply" style= float:right;>{{buttonPlaceholder}}</button>
			</div>
			</td>
			</tr>

			<!-- 댓글 목록 -->
			<tr>
				<td>
					<div class="row" v-for="(reply, index) in replyList" v-bind:key="index">
						<!-- 일반적인 출력화면 -->
						<div v-if="!reply.edit">
							<!-- 첫 번째 줄 : 작성자, 작성시각, 수정/삭제 버튼 -->
							<div class="reply-header">
								<span>{{reply.replyWriter}}</span>
								<span>{{convertTime(reply.replyTime)}}</span>
								<span v-if="isEditAndDeleteAvailable(reply.replyWriter)">
									<img src="${pageContext.request.contextPath}/image/edit.png"  width="25"  v-if="!isAdmin"  @click="changeEditMode(index);">
									<img src="${pageContext.request.contextPath}/image/delet-button.png" @click="deleteReply(index);" width="25">
								</span>
							</div>
							<!-- 두 번째 줄 : 내용 -->
							<div class="reply-body">
								{{reply.replyContent}}
							</div>
						</div>
						<!-- 수정화면 -->
						<div class="right" v-else>
						<label>　　　　　　　</label>
							<textarea class="reply1" rows="5" :disabled="isAnonymous" placeholder="수정 댓글 작성" v-model="replyList[index].replyContent" style= float:left;></textarea>
							<br><br><br>
							<button class="btn btn-secondary" :disabled="isAnonymous" @click="changeDisplayMode(index);" style= float:right;>취소</button>
							<button class="btn btn-primary" :disabled="isAnonymous" @click="editReply(index);" style= float:right;>수정</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
      integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
<script src="https://unpkg.com/vue@next"></script>
<!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
//div[id=app]을 제어할 수 있는 Vue instance를 생성
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	//서버에서 전달된 정보
            memberId:"${boardDto.boardWriter}",
            memberGrade:"${auth}",
            boardNo:${boardDto.boardNo},
            
            //댓글 입력 정보
            boardContent:"",
            
            //댓글 목록
            replyList:[],
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{
        isAnonymous(){
        	return this.memberId == "" || this.memberGrade == "";
        },
        isMember(){
        	return this.memberId != "" && this.memberGrade != "";
        },
        isAdmin(){
        	return this.isMember && this.memberGrade == "관리자";
        },
        textareaPlaceholder(){
        	return this.isAnonymous ? "로그인 후 댓글을 작성할 수 있습니다" : "댓글 내용 입력";
        },
        buttonPlaceholder(){
        	return this.isAnonymous ? "댓글 작성 불가" : "댓글 등록하기";
        },
        boardContentIsEmpty(){
        	return this.boardContent.length == 0;
        },
    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
       	//endpoint - /home/rest/reply/
        addReply(){
        	//미입력 시 차단
        	if(this.boardContentIsEmpty) return;
        	
        	axios({
        		url:"${pageContext.request.contextPath}/rest/reply/",
        		method:"post",
        		data:{
        			replyTarget:this.boardNo,
        			replyContent:this.boardContent
        		},
        	})
        	.then(resp=>{
        		//완성 시 코드
        		//window.alert("댓글 등록 완료!");
        		this.boardContent = "";
        		this.loadReply();
        	});
        },
        loadReply(){
        	axios({
        		url:"${pageContext.request.contextPath}/rest/reply/"+this.boardNo,
        		method:"get",
        	})
        	.then(resp=>{
        		this.replyList = resp.data;
        	});
        },
        isEditAndDeleteAvailable(replyWriter){
        	//1.관리자면 통과
        	if(this.isAdmin) return true;
        	
        	//2. 현재사용자가 작성자라면 통과
        	if(this.memberId == replyWriter) return true;
        	
        	//나머지 다 차단
        	return false;
        },
        convertTime(time){
        	return moment(time).format('YYYY-MM-DD hh:mm:ss');
        },
        deleteReply(index){
        	//확인창 출력
        	const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
        	if(!choice) return;
        	
        	const reply = this.replyList[index];
        	axios({
        		url:"${pageContext.request.contextPath}/rest/reply/"+reply.replyNo,
        		method:"delete"
        	})
        	.then(resp=>{
        		this.loadReply();
        	});
        },
        
        changeEditMode(index){
        	this.replyList[index].edit = true;
        },
        changeDisplayMode(index){
        	this.replyList[index].edit = false;	
        },
        
        editReply(index){
        	const reply = this.replyList[index];
        	if(reply.replyContent.length == 0) return;
        	
        	axios({
        		url:"${pageContext.request.contextPath}/rest/reply/",
        		method:"put",
        		data:{
        			replyNo:reply.replyNo,
        			replyContent:reply.replyContent
        		},
        	})
        	.then(resp=>{
        		this.loadReply();
        	});
        },
    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{
        
    },
    created(){
    	this.loadReply();
    },
});
app.mount("#app");
</script>


</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>