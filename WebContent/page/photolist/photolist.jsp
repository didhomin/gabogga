<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp"%>
<!-- 여기서부터 우리가 꾸미기 -->


<div class="col-sm-7">

   <%--    <c:forEach var="j" begin="1" end="5" step="1"> --%>
   <c:forEach var="listDto" items="${houselist}" varStatus="ii">
      <c:if test="${ii.index%2 == 0}">
         <div class="row">
      </c:if>
      <c:forEach var="i" begin="1" end="1" step="1">

         <div class="col-sm-6 col-md-6">
            <div class="thumbnail" data-x="${listDto.lat}" data-y="${listDto.lng}">
               <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1"></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner">
                     <div class="item active" id="1">
                        <img src="${root}/img/g1.jpg"
                           style="width: 100%; height: 170px; opacity: 1"
                           onmouseover="this.style.opacity='0.5'"
                           onmouseout="this.style.opacity='1'">

                     </div>


                     <div class="item">
                        <img src="${root}/img/g2.jpg"
                           style="width: 100%; height: 170px; opacity: 1"
                           onmouseover="this.style.opacity='0.5'"
                           onmouseout="this.style.opacity='1'">
                     </div>

                     <div class="item">
                        <img src="${root}/img/g3.jpg"
                           style="width: 100%; height: 170px; opacity: 1"
                           onmouseover="this.style.opacity='0.5'"
                           onmouseout="this.style.opacity='1'">
                     </div>
                  </div>

                  <center>
                     <!-- Left and right controls -->
                     <a class="left carousel-control" href="#myCarousel"
                        data-slide="prev"> <span
                        class="glyphicon glyphicon-chevron-left"></span> <span
                        class="sr-only">Previous</span>
                     </a> <a class="right carousel-control" href="#myCarousel"
                        data-slide="next"> <span
                        class="glyphicon glyphicon-chevron-right"></span> <span
                        class="sr-only">Next</span>
                     </a>
                     <h3 id="thumbnail-label">
                        <a class="anchorjs-link" href="#thumbnail-label"><span
                           class="anchorjs-icon">${listDto.gname}</span></a>
                     </h3>
                     <div style="text-align: right">
                        <p>&#8361;${listDto.roomPay}</p>
                     </div>
                     <p>
                        <a href="#" class="btn btn-primary" role="button">찜하기</a> <a
                           href="#" class="btn btn-default" role="button">예약하기</a>
                     </p>
                  </center>
               </div>
            </div>
         </div>
      </c:forEach>
      
      <c:if test="${ii.index%2 != 0}">
         </div>
      </c:if>
      
   </c:forEach>
</div>



<div class="col-sm-5">
   <div id="map" style="width: 400px; height: 650px; position: fixed"></div>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=818df75cf4e5cfe689af559e691f113d"></script>
   <script>
      var container = document.getElementById('map');
      var options = {
         center : new daum.maps.LatLng(33.376412, 126.544647),
         level : 10
      };

      var map = new daum.maps.Map(container, options);
      var markerPosition = new daum.maps.LatLng(33.376412, 126.544647);

      $('.thumbnail').on('mouseover', function() {
         var x = $(this).data('x');
         var y = $(this).data('y');
         // alert('x = ' + x + ' y = ' + y);

         var markerPosition = new daum.maps.LatLng(x, y);

         var moveLatLon = new daum.maps.LatLng(x, y);
         map.panTo(moveLatLon);
         
         
         var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

         
/*          iwPosition = new daum.maps.LatLng(x, y); //인포윈도우 표시 위치입니다
         //   alert(iwPosition);
            
        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            position : iwPosition, 
            content : iwContent 
        });
       
  
         // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
         infowindow.open(map, marker);  */
  

        
         
         
         
         
         
      })
      
      
      // 마커를 생성합니다
      var marker = new daum.maps.Marker({
         position : markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      <c:forEach var="listDto" items="${houselist}" varStatus="ii">
      markerPosition = new daum.maps.LatLng(${listDto.lat}, ${listDto.lng});
      marker = new daum.maps.Marker({
         position : markerPosition
      });
      marker.setMap(map);
      </c:forEach> 
    
      var iwContent = '<div style="padding:5px;">푸름 게스트하우스 <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

      // 인포윈도우를 생성합니다
      var infowindow = new daum.maps.InfoWindow({
         position : iwPosition,
         content : iwContent
      });

      // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
      infowindow.open(map, marker);
      map.setCenter(33.450701, 126.570667);

      // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
      // marker.setMap(null);
      

   </script>
   
   </div>




<%@ include file="/page/template/footer.jsp"%>