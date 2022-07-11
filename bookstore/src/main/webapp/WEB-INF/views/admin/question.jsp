<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"></jsp:include>

    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>1:1 문의 관리</h2>
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

		},
	});
	app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"></jsp:include>