<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc58507d96bb54372ac861c953ed175&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#progressBtn').click(function() {
			$(location).attr('href', '${root}/host/fourth.gbg');
		});

		$('#backBtn').click(function() {
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
					<font size="3px" color="blue"> <strong>도로명 주소 </strong></font><br>
					<input type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>세부주소</strong> </font><br>
					<input type="text" class="form-control" placeholder="내용을 입력해주세요.">
					<br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-6">
					<p style="margin-top: -12px">
						<em class="link"> <a href="javascript:void(0);"
							onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
								혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
						</em>
					</p>
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {

			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">위치가 맞으면 확인버튼을 눌러주세요.</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
			</div>
		</div>
		<div class="col-sm-12">
			<button id="backBtn" type="button" class="btn btn-info">
				<span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span>
			</button>
			<br> <br>
			<button id="progressBtn" type="button"
				class="btn btn-primary btn-lg btn-block">진행</button>
		</div>
	</div>
	</div>
	<br>
	<br>
	<br>
	<%@ include file="/page/template/footer.jsp"%>