<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp"%>
<!-- 여기서부터 우리가 꾸미기 -->
<script type="text/javascript">
 $(document).ready(function(){
    $(document).on("click",'.goodBtn',function(){
         var ghId = $(this).attr('data-ghId');
         var userId = $(this).attr('data-userId');
         var address1 = $('.address1').attr('value');
         var ht = '<img src="${root}/img/heart.png" width="20px">'
         if (userId == "") {
            return;
         } else {
            $.ajax({
               type : 'POST',
               dataType : 'json',
               url : '${root}/list/good.gbg',
               data : {'ghId' : ghId, 'userId' : userId, 'address1' : address1},
               success : function(data) {
					$('#tt'+ghId).empty();
					$("#tt"+ghId).append(ht);
					$("#tt"+ghId).append(data.result); 
				}
			});
		}
	});
 });

 
 
 
</script>


<div class="col-sm-7">
	<c:set var="myCarousel" value="0" />

	<%--    <c:forEach var="j" begin="1" end="5" step="1"> --%>
	<c:forEach var="listDto" items="${houselist}" varStatus="ii">
		<c:if test="${ii.index%2 == 0}">
			<div class="row">
		</c:if>
		<div class="col-sm-6 col-md-6">
			<div class="thumbnail" data-x="${listDto.lat}"
				data-y="${listDto.lng}" data-title="${listDto.gname}"
				data-ghId="${listDto.ghId}" data-userId="${user.userId}"
				data-good="${listDto.good}">
				<c:set var="myCarousel" value="${myCarousel + 1}" />
				<div id="${myCarousel}" class="carousel slide" data-ride="carousel">





					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active" id="0">
							<img src="${root}/upload/${listDto.pictureGh}"
								style="width: 100%; height: 170px; opacity: 1"
								onmouseover="this.style.opacity='0.5'"
								onmouseout="this.style.opacity='1'">
						</div>



						<c:set var="count" value="0" />
						<c:forEach var="pictureDto" items="${roomPictures}"
							varStatus="iii">
							<c:if test="${listDto.ghId eq pictureDto.ghId}">
								<c:set var="count" value="${count + 1}" />
								<div class="item">
									<img src="${root}/upload/${pictureDto.pictureRoom}"
										style="width: 100%; height: 170px; opacity: 1"
										onmouseover="this.style.opacity='0.5'"
										onmouseout="this.style.opacity='1'">
								</div>
							</c:if>
						</c:forEach>
					</div>

					<center>
						<!-- Left and right controls -->
						<p>
							<a class="left carousel-control" href="#${myCarousel}"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a>
						<ol class="carousel-indicators">
							<li style="background-color: #81DAF5;"
								data-target="#${myCarousel}" data-slide-to="0" class="active"></li>
							<c:set var="count" value="0" />
							<c:forEach var="pictureDto" items="${roomPictures}"
								varStatus="iii">
								<c:if test="${listDto.ghId eq pictureDto.ghId}">
									<c:set var="count" value="${count + 1}" />
									<li style="background-color: #81DAF5;"
										data-target="#${myCarousel}" data-slide-to="${count}"></li>
								</c:if>
							</c:forEach>
						</ol>


						<a class="right carousel-control" href="#${myCarousel}"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
						<h3 id="thumbnail-label">
							<a class="anchorjs-link" href="${root }/house/reservation.gbg?guesthouseId=${listDto.ghId}"><span
								class="anchorjs-icon">${listDto.gname}</span></a>
						</h3>
						</p>

						<p>${listDto.introduce}</p>

						<div style="text-align: right">
							<p>&#8361;${listDto.roomPay}&nbsp;&nbsp;</p>
						</div>

						<p>

							<input type="hidden" id="act1" name="act1"
								value="${listDto.ghId}"> <input type="hidden" id="act2"
								name="act2" value="${user.userId}"> <input
								class="address1" type="hidden" id="act2" name="address1"
								value="${listDto.address1}">

							<button id="tt${listDto.ghId}" data-ghId="${listDto.ghId}"
								data-userId="${user.userId}" class="goodBtn btn btn-default">
								<img src="${root}/img/heart.png" width="20px">${listDto.good}</button>


							<a href="${root }/house/reservation.gbg?guesthouseId=${listDto.ghId}" class="btn btn-info" role="button">예약하기</a>
						</p>
					</center>
				</div>
			</div>
		</div>

		<c:if test="${ii.index%2 != 0}">
</div>
</c:if>
</c:forEach>
</div>

<c:if test="${ii.index%2 != 0}">
</div>
</c:if>


<div class="col-sm-5">
	<div id="map" style="width: 400px; height: 650px; position: fixed"></div>
</div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818df75cf4e5cfe689af559e691f113d"></script>

<script>
var markers = [];
var container = document.getElementById('map');
var options = {
   center : new daum.maps.LatLng(33.376412, 126.544647),
   level : 10
};


var map = new daum.maps.Map(container, options);
var markerPosition = new daum.maps.LatLng(33.376412, 126.544647);

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);




// 마커를 생성합니다
var marker = new daum.maps.Marker({
   position : markerPosition
});
 
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

<c:forEach var="listDto" items="${houselist}" varStatus="ii">
markerPosition = new daum.maps.LatLng("${listDto.lat}", "${listDto.lng}");
marker = new daum.maps.Marker({
   position : markerPosition
});
marker.setMap(map);
markers.push(marker);
</c:forEach>

var infowindow;
$('.thumbnail').on('mouseover', function() {
   console.log($(this).index());
  var x = $(this).data('x');
  var y = $(this).data('y');
  var title = $(this).data('title');
  var index = $(this).data('index');
  if (infowindow) {
     infowindow.close();
  }
  // alert('x = ' + x + ' y = ' + y);

  var markerPosition = new daum.maps.LatLng(x, y);
  // 인포윈도우를 생성합니다
  infowindow = new daum.maps.InfoWindow({
      position : markerPosition, 
      content : //'<div style="padding:5px;">' + title + '<br><a href="naver.com/' + x + ',' + y + '">지도보기</a></div>'
      '<div style="padding:5px;">' + title + '<br><a href="http://map.daum.net/link/map/' + x + ',' + y + '" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/'+title +',' + x + ',' + y + '" style="color:blue" target="_blank">길찾기</a></div>'
  });

  // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
  infowindow.open(map, markers[index]);
  map.panTo(markerPosition);
});


function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

</script>



<%@ include file="/page/template/footer.jsp"%>