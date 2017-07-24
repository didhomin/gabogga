<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#progressBtn').click(function(){
		$(location).attr('href', '${root}/host/seventh.gbg');
	});
	
	$('#backBtn').click(function(){
		window.history.back();
	});
	
});
</script>
<style>
.basic {
	margin: 20px;
}
</style>

	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="60" aria-valuemin="0"
				aria-valuemax="100" style="width: 60%">60%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<font size="3px" color="black">
					귀하의 객실 등록 현황</font><br><br>
					<div class="row">
						<div class="col-sm-8"style="padding:20px; border:1px solid #ededed; box-shadow:1px 1px 0 rgba(0,0,0, .2);">
						_________(이름)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 유형의 객실 수 :______ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-primary">삭제</button>
						</div>
						<div class="col-sm-4" style="align:center">
						<br>
						 <button type="button" class="btn btn-default btn-lg">+ 다른 객실 타입 추가</button>
						</div>
					</div>
					<br>
				</div>
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
								<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	