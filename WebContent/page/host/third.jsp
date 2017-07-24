<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc58507d96bb54372ac861c953ed175"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#progressBtn').click(function(){
		$(location).attr('href', '${root}/host/fourth.gbg');
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
				role="progressbar" aria-valuenow="15" aria-valuemin="0"
				aria-valuemax="100" style="width: 15%">15%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-5 col-sm-push-1" style="padding-top: 30px;">
					<h2>기본사항</h2>
					<font size="3px" color="black"> <strong>숙박 시설 주소</strong></font> <br>
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"> <strong>도로명 주소 </strong></font><br> <input
						type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>세부주소</strong> </font><br> <input
						type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-6">
					<div id="map" style="width: 500px; height: 400px;"></div>
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new daum.maps.LatLng(33.450701, 126.570667),
							level : 3
						};

						var map = new daum.maps.Map(container, options);
					</script>
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