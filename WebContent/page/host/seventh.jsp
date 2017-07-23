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
				role="progressbar" aria-valuenow="75" aria-valuemin="0"
				aria-valuemax="100" style="width: 75%">75%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>편의 시설</h2> <br>
					<div class="row">
						<div class="col-sm-8" style="font-size:17px;">
						<label> <input type="checkbox" value=""> 필수 품목(수건, 침대시트, 비누, 화장지) </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 무선인터넷 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 샴푸 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 옷장/서랍장 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> TV </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 난방 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 에어컨 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 조식, 커피, 차 </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 책상 (작업공간) </label><br>
							<label> <input type="checkbox" value="" class="ckbox"> 헤어 드라이어 </label><br>
						</div>
						<div class="col-sm-4">
						
						</div>
					</div>
					<br>
				</div>
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
								<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	