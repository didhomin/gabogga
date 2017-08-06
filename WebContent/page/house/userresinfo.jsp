<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp"%>


<div class="row">
   <h2>예약자 정보</h2>
   <div class="col-sm-6">
      <div class="col-sm-6">
         	이름<input class="form-control" type="text" value="${user.name }" 
         	readonly style="background-color:#fff">
      </div>
      <div class="col-sm-6">
         	휴대폰 번호<input class="form-control" type="text" value="${user.tel }"
            readonly style="background-color:#fff">
      </div>
      <br> <br> <br> <br>
      <h2>예약 정보</h2>
      <div class="col-sm-6">
         	게스트 하우스 이름<input class="form-control" type="text" value="${userresinfo.name }" readonly style="background-color:#fff">
      </div>
      <br> <br> <br> <br>
      <div class="col-sm-6">
         전화번호<input class="form-control" type="text" placeholder="전화번호"
            readonly style="background-color:#fff">
      </div>
      <br> <br> <br> <br>
      <div class="col-sm-6">
         체크인날짜<input class="form-control" type="text" placeholder="체크인날짜"
            readonly style="background-color:#fff">
      </div>
      <div class="col-sm-6">
         체크아웃날짜<input class="form-control" type="text" placeholder="체크아웃날짜"
            readonly style="background-color:#fff">
      </div>
      <br> <br> <br> <br>
      <div class="col-sm-6">
         예약인원<input class="form-control" type="text" placeholder="예약인원"
            readonly style="background-color:#fff">
      </div>
      <br> <br> <br> <br>
      <div class="col-sm-6">선택옵션
      <input class="form-control" type="text" placeholder="선택옵션" readonly style="background-color:#fff">
      
   </div>
</div>

   <div class="col-sm-6">
      <div id="map" style="width: 400px; height: 200px; position: relative"></div>
      <br>
   
   <script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818df75cf4e5cfe689af559e691f113d"></script>
      <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level : 3
         // 지도의 확대 레벨
         };

         var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

         // 마커가 표시될 위치입니다 
         var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);

         // 마커를 생성합니다
         var marker = new daum.maps.Marker({
            position : markerPosition
         });

         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);

         // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
         // marker.setMap(null);
      </script>

      <h2>게스트하우스 사진</h2>
      <img src="${root}/img/g3.jpg" style="width: 400px; height=100%; position: relative">
   </div>

</div>





<%@ include file="/page/template/footer.jsp"%>