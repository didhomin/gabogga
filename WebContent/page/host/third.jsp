<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc58507d96bb54372ac861c953ed175&libraries=services"></script>
<script>
	$(document)
			.ready(
					function() {
						var address;
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
				center : new daum.maps.LatLng(
							33.450701, 126.570667), // 지도의 중심좌표
							level : 2 // 지도의 확대 레벨
				};
						// 지도를 생성합니다    
						var map = new daum.maps.Map(
								mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						$('#progressBtn').click(
								function() {
									if(document.getElementById("houseAddr1").value == ""){
										alert("숙박 시설 주소 입력!");
										return;
									} else if(document.getElementById("houseAddr2").value == ""){
										alert("상세 주소 입력!");
										return;
									}else{
									document.hostform.action = "${root}/host/third.gbg";
									document.hostform.submit();
									}
								});

						$('#backBtn').click(function() {
							$(location).attr('href', '${root}/host/third.gbg');
						});

						$('#checkBtn')
								.click(
										function() {
											address = $('#houseAddr1').val();
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new daum.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};

											// 지도를 생성합니다    
											var map = new daum.maps.Map(
													mapContainer, mapOption);

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new daum.maps.services.Geocoder();

											var marker = new daum.maps.Marker({ 
											    // 지도 중심좌표에 마커를 생성합니다 
											    position: map.getCenter() 
											}); 
											// 지도에 마커를 표시합니다
											marker.setMap(map);
											
											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															address,
															function(result,
																	status) {

																// 정상적으로 검색이 완료됐으면 
																if (status === daum.maps.services.Status.OK) {

																	var coords = new daum.maps.LatLng(
																			result[0].y,
																			result[0].x);

																	// 결과값으로 받은 위치를 마커로 표시합니다
																	var marker = new daum.maps.Marker(
																			{
																				map : map,
																				position : coords
																			});

																	// 인포윈도우로 장소에 대한 설명을 표시합니다
																	var infowindow = new daum.maps.InfoWindow(
																			{
																				content : '<div style="width:150px;text-align:center;padding:6px 0;">여기가 아니면 지도에서 올바른 위치에 클릭 해주세요.</div>'
																			});
																	infowindow
																			.open(
																					map,
																					marker);

																	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																	map
																			.setCenter(coords);
																}
															});
											daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
											    
											    // 클릭한 위도, 경도 정보를 가져옵니다 
											    var latlng = mouseEvent.latLng;
											    
											    marker.setPosition(latlng);
											    
											    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
											    message += '경도는 ' + latlng.getLng() + ' 입니다';
											    
											    alert("여기가 맞나요? 좌표값이 저장됩니다. 확실한 위치를 눌러주세요. 감사합니다 ^^");
											    $('input[name="lat"]').val(latlng.getLat());
											    $('input[name="lng"]').val(latlng.getLng());

							/* 				    document.getElementById("lat").innerHTML = latlng.getLat();
											    document.getElementById("lng").innerHTML = latlng.getLng(); */

											    
											});
										});

						$('#lastBtn').click(function() {
							
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
				<form name="hostform" method="post">
							<input type="hidden" name="userid" value="${user.userId}">
					<h2>기본사항</h2>
					<c:choose>
						<c:when test="${host3.address1 != null}">
						<font size="3px" color="black"> <strong>숙박 시설 주소<br>
								: 도로명 주소를 입력 후 [지도에서 확인] 버튼을 눌러주세요.
						</strong></font> <br> <br> <span class="glyphicon glyphicon-star"
							aria-hidden="true"></span> <font size="3px" color="blue">
							<strong>도로명 주소</strong>
						</font><br> <input id="houseAddr1" name="houseAddr1" type="text"
							class="form-control" placeholder="주소를 입력해주세요." value="${host3.address1}">
						<button id="checkBtn" type="button"
							class="btn btn-warning pull-right">지도에서 확인</button>
						<br> <span class="glyphicon glyphicon-star"
							aria-hidden="true"></span> <font size="3px" color="blue"><strong>세부주소</strong>
						</font><br> <input id="houseAddr2" name="houseAddr2" type="text"
							class="form-control" placeholder="주소를 입력해주세요." value="${host3.address2}"> <br>
						<input type="hidden" name="lat" value="">
						<input type="hidden" name="lng" value="">
						</c:when>
						
						<c:otherwise>
						<font size="3px" color="black"> <strong>숙박 시설 주소<br>
								: 도로명 주소를 입력 후 [지도에서 확인] 버튼을 눌러주세요.
						</strong></font> <br> <br> <span class="glyphicon glyphicon-star"
							aria-hidden="true"></span> <font size="3px" color="blue">
							<strong>도로명 주소</strong>
						</font><br> <input id="houseAddr1" name="houseAddr1" type="text"
							class="form-control" placeholder="주소를 입력해주세요.">
						<button id="checkBtn" type="button"
							class="btn btn-warning pull-right">지도에서 확인</button>
						<br> <span class="glyphicon glyphicon-star"
							aria-hidden="true"></span> <font size="3px" color="blue"><strong>세부주소</strong>
						</font><br> <input id="houseAddr2" name="houseAddr2" type="text"
							class="form-control" placeholder="주소를 입력해주세요."> <br>
						<input type="hidden" name="lat" value="">
						<input type="hidden" name="lng" value="">
						</c:otherwise>
						</c:choose>
					</form>    
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-6">
					<p style="margin-top: -12px">
						<em class="link"> <a href="javascript:void(0);"
							onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
								혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
						</em>
					</p>
					※게스트 하우스 좌표 확인을 위함입니다. 아래 지도를 꼭 확인해주세요.<br>
					<font color="red">그리고 반드시 해당 위치를 클릭하셔야 게스트하우스의 올바른 위치가 저장됩니다.</font>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<br>
				</div>
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