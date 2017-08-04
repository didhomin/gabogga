<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#startBtn').click(function(){
		$(location).attr('href', '${root}/host/first.gbg');
	});  
	
	$('#backBtn').click(function(){
		window.history.back();
	});
	
	$('#helpBtn').click(function(){
		$(location).attr('href', '${root}/admin/notice.gbg');
	});
	
});
</script>
<style>
body{
   font-family: 'Open Sans', sans-serif;
   color: #353535;
}
.leftside {
	font-size: 20px;
	padding-top: 180px;
	padding-left: 30px;
	position: absolute;
	width: 600px;
	height: 200px;
	vertical-align: middle;
}

.rightside {
	padding-top: 130px;
	vertical-align: middle;
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<div class="col-sm-6">
		<div class="leftside">
			<strong>${user.name}</strong>님 안녕하세요 ! <br> 회원님의 게스트 하우스 등록을 시작하시겠습니까? <br> 기본사항 부터
			입력해보세요. <br> <br>
			<button id="startBtn" type="button" class="btn btn-primary btn-lg"><i class="fa fa-smile-o" style="font-size:24px"></i>&nbsp;시작하기</button>
		</div>
	</div>

	<div class="col-sm-6">
		<d	iv class="rightside">
			<img src="${root}/img/guest.jpg"
				style="opacity: 0.6; width: 100%; height: 60%;">
						<br><br>
		호스트 등록 이용 방법이 궁금하다면 다음 버튼을 클릭 해주세요.
		<button id="helpBtn" type="button" class="btn btn-info"><i class="fa fa-warning"></i>&nbsp;도움말</button><br>
						<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
		</div>

<%@ include file="/page/template/footer.jsp" %>	