<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#progressBtn').click(function(){
		$(location).attr('href', '${root}/host/ninth.gbg');
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
</head>
<body>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="90" aria-valuemin="0"
				aria-valuemax="100" style="width: 90%">90%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>숙소의 모습을 보여주세요.</h2> <br>
					<div class="row" >
						<div class="col-sm-12">
						<div style="width:890px; height:300px; border:1px dotted black;">
						<div class="row" style="padding-top:110px">
						<div class="col-sm-5"></div>
						<div class="col-sm-2" >
						<button type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-cloud" aria-hidden="true"></span> 사진업로드</button>
						</div>
						<div class="col-sm-5"></div>
						</div>
						</div>
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