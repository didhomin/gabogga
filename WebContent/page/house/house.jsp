<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->

<!-- 여기서부터 우리가 꾸미기 -->
  	<%@ include file="/page/template/header.jsp" %>
 	<%@ include file="/page/house/reservationModal.jsp" %>
  
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  	<link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
     <!-- fotorama.css & fotorama.js. -->
	<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
  	<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<c:if test="${not empty user }">
<script type="text/javascript">
function reservationmodal() {
	$("#user").val("${user.email}");
	$("#Tel").val("${user.tel}");
	$("#Person").val($("#person").val());
	$("#roomInfo").val($("#roominfo").val());
	$("#checkIn").val($("#from").val());
	$("#checkOut").val($("#to").val());
	$("#modalReservation").modal();
}
/* $(document).ready(function() {
	$("#reservationBtn").on('submit', funtion(e) {
		 alert("예약되었습니다.");
		$(location).attr('href', "${root}/index.jsp"); 
		if ($('#tel').val()== "") {
			alert("휴대전화번호를 입력해주세요");
			return
		} else {
			$("#resrervationform").attr('action', '${root}/house/reservation.gbg').submit();
		}
	});
});  */
/* $('#addTag').click(function(e) {
    e.preventDefault();
    $('#mymodal').modal();
}); */


</script>
</c:if>
<%-- <input type="hidden" name="roomId" id="roomId" value="${room.roomId }" > --%>
<!-- <input type="hidden" name="guesthouseId" value="150" id="guesthouseId"> -->
	<!-- Blog Post Content Column -->
    <div class="col-sm-9">
       <!-- Blog Post -->
       		<!-- Title -->
       		<h1>${info.name }</h1>
			<hr>
	  <!-- 2. Add images to <div class="fotorama"></div>. -->
		<div class='fotorama' data-click='false' data-swipe='false'  data-autoplay="true">
		  <img src="${root }/upload/${info.picture}">
		   <c:forEach var="room" items="${room }">
		            <img src="${root }/upload/${room.picture}">
		         	 </c:forEach>
		</div>
        <hr>
        <!-- Post Content -->
        <p class="lead">Reservation Host Information</p>
        <hr>
        <div class="col-sm-2">
          <h4><label>Guest House</label></h4>
        </div>
        <div class="col-sm-5">
          <li>홈페이지 : <a href="https://${info.hwebsite }/">${info.hwebsite }</a></li>
          <li>주소 : ${info.address1 }<br> 
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${info.address2 }</li>
         <li>연락처 : ${info.phone }</li>
           <hr>
        </div>
        <div class="col-sm-5">
          <li>체크인 시작시간 : ${info.checkinStart }</li>
          <li>체크인 마감시간 : ${info.checkinEnd }</li>
          <li>체크아웃 시작시간 : ${info.checkoutStart }</li>
          <li>체크아웃 마감시간 : ${info.checkoutEnd }</li>
          <hr>
        </div>
		
         <div class="col-sm-2">
          <h4><label>시설</label></h4>
        </div>
        <div class="col-sm-5">
          <li>인터넷 : ${info.internet }</li>
          <li>주차유무 : ${info.park }</li>
          <hr>
        </div>
        <div class="col-sm-5">
          <li>어린이 동반 : ${info.child }</li>
          <li>반려동물 동반: ${info.pet }</li>
          <hr>
        </div>
        <div class="col-sm-2">
          <h4><label>가격</label></h4>
        </div>
        <div class="col-sm-10">
          <li>가격 : ${info.roomPay }</li>
          <hr>
        </div>
        <div class = "col-sm-12" style="text-align:center;">
        	<h2> -  소  개  글 - </h2><br>
        	${info.introduce }
        </div>
        <hr>
		<!-- 라이브리 시티 설치 코드 -->
	    <div id="lv-container" data-id="city" data-uid="MTAyMC8yOTY4Ny82MjU1">
	    <script src="${root }/page/house/js/reply.js"></script>
	    </div>
        <hr>
		<h3>Guset 하우스 위치</h3>
		<div id=map></div>
      </div>
      
      <!-- Blog Sidebar Widgets Column -->
      <div class="col-md-3" >
		<div class= "well" data-spy="affix" data-offset-top="150">
        <!-- Blog Search Well -->
         <div class="well" >
          <h4>[객실선택]</h4>
          <!-- 	<div class="input-group"> -->
                <select name="roominfo" id="roominfo" class="form-control" >
			    <c:forEach var="room" items="${room }">
		            <option value="${room.roomName }">${room.roomName }</option>
		         	 </c:forEach>
	    		     </select>
          </div>
          <div class="well" >
          <h4>[객실인원]</h4>
          <!-- 	<div class="input-group"> -->
            <select name="person" id="person" class="form-control">
            <c:forEach var="room" items="${room }">
	            <option value="${room.roomNum }">${room.roomNum }</option>
	             </c:forEach>
	         </select>
          </div>

        <!-- Blog Categories Well -->
        <div class="well">
          <h4>[체크인/아웃 날짜]</h4>
          <div class="row">
            <div class="col-md-12">
                <div class="control-group">
          			<label class="control-label" for="from">checkIn</label>
          			<div class="controls">
            			<input type="text" id="from" readonly="readonly" class="form-control" style="background-color:#fff"/>
          			</div>
        		</div>
              	<div class="control-group">
          			<label class="control-label" for="to">CheckOut</label>
          			<div class="controls">
            			<input type="text" id='to' readonly="readonly" class="form-control" style="background-color:#fff"/>
          			</div>
        		</div>
            </div>
          </div>
        </div>
        <script src="${root }/page/house/js/index.js"></script>

        <!-- Side Widget Well -->
        <div class="well">
          <h4>Reservation State</h4>
          <p>Before booking <br> Please check again</p>
          <c:choose>
          	<c:when test="${empty user}">
          		<c:set var="modal" value="modalLogin()"></c:set>
          	</c:when>
            <c:otherwise>
              <c:set var="modal" value="reservationmodal()"></c:set>
          	</c:otherwise>
          </c:choose>
          <button type="button" class="btn btn-primary" onclick="javascript=${modal}">Reservation</button>
        </div>
      </div>
</div>


<!-- -------------------- Map --------------------- -->
        <style>
          #map {
            height: 400px;
            width: 100%;
          }
        </style>
        <!-- <h3>Guset 하우스 위치</h3> -->
        <div id="map">
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a10b55340969923033a4eb61fd837e6e"></script>
		<script>
		var locx = ${info.lat};
		var locy = ${info.lng};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(locx, locy), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다
		var markerPosition  = new daum.maps.LatLng(locx, locy);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
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
		</div>
	</div>


<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>
