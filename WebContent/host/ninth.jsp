<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
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
				role="progressbar" aria-valuenow="100" aria-valuemin="0"
				aria-valuemax="100" style="width: 100%">100%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>기본 요금</h2> <br>
					<font size="3px" color="black">
					기본 요금은 회원님이 정한 기본 1박당 요금입니다.</font><br><br>
					<div class="row" >
						<div class="col-sm-5">
							<font size="3px" color="blue"> <strong> 기본요금 </strong></font><br> <input
						type="text" class="form-control" placeholder="$/박">
							
						</div>
						<div class="col-sm-7"></div>
					</div>
					</div>
					<br>
				</div>
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
				완료 버튼을 누르면 숙박 상세 정보를 한눈에 볼 수 있습니다.<br><br>
				<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<div class="col-sm-6">
					<button type="button" class="btn btn-primary btn-lg btn-block">임시저장</button>
					</div>
					<div class="col-sm-6">
					<button type="button" class="btn btn-primary btn-lg btn-block">완료</button>
					</div>
				</div>
			</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	