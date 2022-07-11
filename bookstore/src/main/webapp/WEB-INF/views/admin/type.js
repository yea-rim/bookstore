			<div class="row">
				<label>대분류</label>
				<select name="sido1" id="sido1"></select>
			</div>

			<div class="row">
				<label>소분류</label>
				<select name="gugun1" id="gugun1"></select>
			</div>
			
(function ($) {

$('document').ready(function() {
	 var area0 = ["대분류 선택", "소설", "자기계발", "시/에세이", "인문", "컴퓨터/IT", "OS/데이터베이스", "참고서", "어린이", "취미", "만화"];
	 var area1 = ["로맨스 소설", "추리 소설", "전쟁/역사 소설", "공포/스릴러 소설", "판타지 소설"];
	 var area2 = ["경제/부동산", "시간 관리", "인간 관계", "대화/협상"];
	 var area3 = ["한국시", "외국시", "성공 에세이", "여행 에세이", "연애 에세이"];
	 var area4 = ["시사/사회", "경제/경영", "종교", "행정/정치"];
	 var area5 = ["웹/홈페이지", "컴퓨터입문/활용", "프로그래밍언어", "개발/OS/데이터베이스", "네트워크 보안", "컴퓨터공학"];
	 var area6 = ["국어/문학", "외국어", "수학", "고시", "공무원"];
	 var area7 = ["어린이"];
	 var area8 = ["가정/육아", "건강", "여행", "요리"];
	 var area9 = ["학원 만화", "스포츠 만화", "순정 만화", "기타 만화"];

	 //선택 박스 초기화
	 $("select[name^=sido]").each(function() {
	 $selsido = $(this);
	 $.each(eval(area0), function() {
	 $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>소분류 선택</option>");
	 });

	 // 대분류 선택시 소분류 설정

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	  $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	  $.each(eval(area), function() {
	  $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	});
	
})(jQuery);