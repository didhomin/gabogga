<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
<div class="col-sm-3 sidenav">
<%@ include file="/WEB-INF/page/community/boardmenu.jsp" %>
</div>
</div>
<style>
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>
<script type="text/javascript">
function firstArticle(){
   document.commonForm.bcode.value=${qs.bcode};
   document.commonForm.pg.value= "1"; 
   document.commonForm.key.value= "";
   document.commonForm.word.value= "";
   
   document.commonForm.action ="${root}/mapboard/list.gbg";
   document.commonForm.submit();
}

function listArticle(mpg){
   document.commonForm.bcode.value=${qs.bcode};
   document.commonForm.pg.value= mpg;
   document.commonForm.key.value= "${qs.key}";
   document.commonForm.word.value= "${qs.word}";
   
   document.commonForm.action = "${root}/mapboard/list.gbg";
   document.commonForm.submit();
}

$(document).ready(function() {
	
	$(".newBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#commonForm').attr('action', '${root}/mapboard/write.gbg').submit();
	});
	
	$(".subject").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#seq').val($(this).attr('data-seq'));
		$('#commonForm').attr('action', '${root}/mapboard/view.gbg').submit();
	});
	
	$("#searchBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/mapboard/list.gbg').submit();
	});
	
});

</script>

<!-- 여기서부터 게시판 메인 꾸미기 -->
		
		<div class="col-sm-9 main">			
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<button type="button" class="btn btn-primary btn-sm newBtn">글쓰기</button>
				</div>
			</div><br>
<c:forEach var="article" items="${articleList}">		
<%-- <c:forEach var="a" begin="1" end="4" step="1"> --%>
	<div class="col-sm-6">
		<div class="thumbnail">
			<div class="newMap" style="width: 100%; height: 270px;"
			 data-xy="[
			 <c:forEach varStatus="i" var="info" items="${article.stopbylist}">
			 [${info.y}, ${info.x}, ${info.step}]
			 	<c:if test="${i.index != article.stopbylist.size() - 1}">,</c:if>
			 </c:forEach>
			 ]"></div>
			<!-- <div class="newMap" style="width: 100%; height: 270px;"
			 data-xy="[[33.450701, 126.570667, 0],[33.480701, 126.580667,1],[33.431701, 126.511667,2]]"></div> -->
			<div class="caption">
				<h5 class="pull-right"><b>조회수&nbsp;&nbsp;</b>  ${article.hit}</h5>
				<h5>
					<b>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> 
					<a href="#" data-seq="${article.seq}" class="subject">
					${article.subject}&nbsp;&nbsp;
			        	<c:if test="${article.memocnt != 0}">
						<b>[${article.memocnt}]</b></a>
						</c:if>
					</a>
				</h5>
				<h5>
				<b>작성자&nbsp;&nbsp;</b> ${article.name}
				</h5>
				<h5>
				<b>날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> ${article.logtime}
				</h5>
			</div>
		</div>
	</div>
</c:forEach>

			<!-- 하단 페이징 -->
			<div class="row">
			<div align="center">${navigator.navigator}</div>
				<!-- <div class="col-sm-3">	
					<ul class="pager">
					</ul>
				</div>
				<div class="col-sm-6">
					<ul class="pagination">
					  <li><a href="#">Previous</a></li>
					  <li><a href="#">1</a></li>
					  <li class="active"><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					  <li><a href="#">Next</a></li>
					</ul>
				</div> -->
			</div>
			
			<!-- 검색영역  -->
				<div class="row" style="margin:auto;">	
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<select class="form-control" id="skey" name="skey">
								<option value="subject">제목
								<option value="name">아이디
						</select> 
					</div>
					<div class="col-sm-4">
						<input class="form-control" type="text" name="sword" id="sword" onkeypress="">
					</div>
					<div class="col-sm-4">
				        <a href="#" class="btn btn-info" id="searchBtn">
				          <span class="glyphicon glyphicon-search"></span> Search 
				        </a>
					</div>
				</div>
			<!-- 검색영역 끝 -->
		</div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a10b55340969923033a4eb61fd837e6e&libraries=services"></script>
<script>
window.onload = function() {
	$(".newMap").each(function(i, v){
		setMarkerAndLine(i, v);
	});
}

function setMarkerAndLine(index, element) {
	var mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new daum.maps.Map(element, mapOption);
	
	
	var markers = new Array();
	var lines = new Array();
	var latlngs = $(element).data("xy");
	
	var bounds = new daum.maps.LatLngBounds();
	$(latlngs).each(function(i, v){
		var latlng = new daum.maps.LatLng(v[0], v[1]);
		var marker = new daum.maps.Marker({
	        map: map,
	        position: latlng
	    });
		markers[v[2]] = marker;
		lines.push(latlng);
		bounds.extend(latlng);
	});
	
	// 지도에 표시할 선을 생성합니다
	var polyline = new daum.maps.Polyline({
	    path: lines, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
	
	map.setBounds(bounds);

    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">출발</div>'
    });
    infowindow.open(map, markers[0]);
    
    infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">도착</div>'
    });
    infowindow.open(map, markers[markers.length-1]);

    

}
</script>	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/page/template/footer.jsp" %>	