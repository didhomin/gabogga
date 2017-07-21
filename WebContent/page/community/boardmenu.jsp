<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#boardmenu p.category_name").click(function(){
		$(this).next("div.board_name").slideDown(500).siblings("div.board_name").slideUp("slow");
	});
});
</script>
<style type="text/css">
body {
	margin: 10px auto;
}

.category_name {
	padding: 5px 10px;
	cursor: pointer;
	position: relative;
	margin: 2px;
	font-weight: bold;
	text-align: left;
	background-color: #FFB2D9;	#F361A6;
}

.board_name {
	display: none;
	text-align: left;
}

.board_name a{
	display: block;
	color: #1266FF;
	background: #D9E5FF;
	padding-left: 10px;
	text-decoration: none;
}

.board_name a:hover {
	color: #000000;
	text-decoration: underline;
}

.sidenav {
      background-color: #f1f1f1;
      height: 100%;
}
    
</style>

<div class="col-sm-3 sidenav">
	<div class="board_list" id="boardmenu">
		<p class="category_name">동행게시판</p>
			<div class="board_name">
				<a href="">* 안전한 동행공지</a>
				<a href="">- 동행 대중교통</a>
				<a href="">- 동행 내일로</a>
				<a href="">- 동행 제주도</a>
				<a href="">- 동행 여행중/현지</a>
				<a href="">- 동행 택시/같이타기</a>
			</div>
		<p class="category_name">내일로</p>
			<div class="board_name">
				<a href="">이야기</a>
				<a href="">질문/답변</a>
				<a href="">코스상담</a>
				<a href="">코스뽐내기</a>
				<a href="">여행후기</a>
				<a href="">여행팁</a>
			</div>
		<p class="category_name">제주도</p>
			<div class="board_name">
				<a href="">이야기</a>
				<a href="">질문/답변</a>
				<a href="">코스상담</a>
				<a href="">코스뽐내기</a>
				<a href="">여행후기</a>
				<a href="">여행팁</a>
			</div>
	</div>
</div>