<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script type="text/javascript">
$(document).ready(function(){
	
	$('#progressBtn').click(function(){
		document.hostform.action = "${root}/host/second.gbg";
		document.hostform.submit();
	});
	
	$('#backBtn').click(function(){
		window.history.back();
	});
	
});
</script>
<style>
body{
   font-family: 'Open Sans', sans-serif;
   color: #353535;
}

.basic {
	margin: 20px;
}
</style>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="5" aria-valuemin="0"
				aria-valuemax="100" style="width: 5%">5%</div>
		</div>
		<div class="basic">
			
			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-3 col-sm-push-1" style="padding-top:30px;">
				<form name="hostform" method="post">
				<h2>기본사항</h2>
			<br>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span> <font
						size="3px" color="blue" ><strong>숙박 시설 이름</strong> </font><br> <input
						id="houseName" name="houseName" type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>전체 객실 수</strong> </font><br>
					<div class="row">
						<div class="col-sm-6">
							<input id="houseTotal" name="houseTotal" type="text" class="form-control" placeholder="내용을 입력해주세요."
								size="1px">
						</div>
						<div class="col-sm-6"></div>
					</div>
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>웹 사이트 (선택사항)</strong> </font><br> <input
						id="houseSite" name="houseSite" type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>연락처 </strong></font><br> <input
						id="housePhone" name="housePhone" type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br>
					</form>
				</div>
				
				<div class="col-sm-2 col-sm-push-1"></div>
				<div class="col-sm-7">
					<div class="rightside">
						<img src="${root}/img/second.jpg" style="width: 90%; height: 70%; opacity:0.8;">
					</div>
				</div>
			</div>
			<div class="col-sm-12">
							<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
				<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
			</div>
		</div>
	</div>
	<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	