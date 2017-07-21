<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기 -->
	<!-- Blog Post Content Column -->
    <div class="col-sm-8">
       <!-- Blog Post -->
       		<!-- Title -->
       		<h1>This Guest House Title</h1>
        	<!-- Author -->
        	<p class="lead">by <a href="#">Start Bootstrap</a></p>
			<hr>
        <!-- Date/Time -->
        <p><span class="glyphicon glyphicon-time"></span> 
        Posted on August 24, 2013 at 9:00 PM</p>
        <hr>
        <!-- Preview Image -->
        <img class="img-responsive" src="http://placehold.it/900x300" alt="">
        <hr>
        <!-- Post Content -->
        <p class="lead">Reservation Host Information</p>
        <hr>
        <div class="col-sm-4">
          <label>Guest House</label>
        </div>
        <div class="col-sm-4">
          <li>숙박 가능인원 : 4</li>
          <li>욕실 : 2.5</li>
        </div>
        <div class="col-sm-4">
          <li>체크인 : 14:00 ~ 02:00(다음날)</li>
          <li>체크아웃 : 12:00</li>
        </div>
        <div class="col-sm-4">
          <label>시설</label>
        </div>
        <hr>
        <div class="col-sm-4">
          <li>난방</li>
          <li>에어컨</li>
        </div>
        <div class="col-sm-4">
          <li>수영장</li>
          <li>옷걸이</li>
        </div>
        <p>예약을 다시한번 확인 해 주시기 바랍니다.</p>

        <hr>

        <!-- Blog Comments -->

        <!-- Comments Form -->
        <div class="well">
          <h4>Leave a Comment:</h4>
          <form role="form">
            <div class="form-group">
              <textarea class="form-control" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>

        <hr>

        <!-- Posted Comments -->

        <!-- Comment -->
        <div class="media">
          <a class="pull-left" href="#">
             <img class="media-object" src="http://placehold.it/64x64" alt=""></a>
          <div class="media-body">
            <h4 class="media-heading">Start Bootstrap
               <small>August 25, 2014 at 9:30 PM</small>
                 </h4> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. 
                 Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia conguefelis in faucibus.
          </div>
        </div>

        <!-- Comment -->
        <div class="media">
          <a class="pull-left" href="#">
            <img class="media-object" src="http://placehold.it/64x64" alt=""></a>
          <div class="media-body">
            <h4 class="media-heading">Start Bootstrap
               <small>August 25, 2014 at 9:30 PM</small>
                </h4> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque 
                ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
            	felis in faucibus.
            <!-- Nested Comment -->
            <div class="media">
              <a class="pull-left" href="#">
 				<img class="media-object" src="http://placehold.it/64x64" alt=""></a>
              <div class="media-body">
                <h4 class="media-heading">Nested Start Bootstrap
                   <small>August 25, 2014 at 9:30 PM</small>
                     </h4> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum 
                     nunc ac nisi vulputate fringilla. Donec laciniacongue felis in faucibus.
              </div>
            </div>
            <!-- End Nested Comment -->
          </div>
        </div>

      </div>

      <!-- Blog Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Blog Search Well -->
         <div class="well">
          <h4>Room Search</h4>
          `<div class="input-group">

            <select neme="roomnumber">
            <option value="---">------</option>
            <option value="101호">101호</option>
            <option value="102호">102호</option>
            <option value="103호">103호</option>
            <option value="104호">104호</option>
          </select>
            <!-- <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
            </button>
            </span> -->
          </div>
        </div>

        <!-- Blog Categories Well -->
        <div class="well">
          <h4>Check In/out</h4>
          <div class="row">
            <div class="col-md-12">
              <ul class="list-unstyled">
                <li>
                  <label>Check In</label>
                  <input type="date" class="form-control">
                  <label>Check Out</label>
                  <input type="date" class="form-control">
                </li>
              </ul>
            </div>
            <!-- <div class="col-md-5">
              <ul class="list-unstyled">
                <li>

                </li>
              </ul>
            </div> -->
          </div>
          <!-- /.row -->
        </div>

        <!-- Side Widget Well -->
        <div class="well">
          <h4>Reservation State</h4>
          <p>Before booking <br> Please check again</p>
          <button type="button" class="btn btn-primary">Reservation</button>
        </div>

        <style>
          #map {
            height: 400px;
            width: 100%;
          }
        </style>
        <h3>Daum 지도 시작하기</h3>
        <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 넣으시면 됩니다."></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
        </script>
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	