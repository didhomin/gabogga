<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<%@ include file="/page/community/logincheck.jsp" %>
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
<div class="col-sm-3 sidenav">
<%@ include file="/page/community/boardmenu.jsp" %>
</div>
</div>
<!-- 여기서부터 게시판 메인 꾸미기 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>		
<script type="text/javascript">
$(function() {
  $('.summernote').summernote({
    height: 200,          // 기본 높이값
    minHeight: null,      // 최소 높이값(null은 제한 없음)
    maxHeight: null,      // 최대 높이값(null은 제한 없음)
    focus: true,          // 페이지가 열릴때 포커스를 지정함
    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
  });
});
  
var mapCnt = 0;  
  
$(document).ready(function() {
	
	$('#plusBtn').click(function() {
		if(mapCnt < 4){
			mapCnt++;
			var inp = $('<div class="col-sm-10">').append('<input type="subject" class="form-control sMap">').append('<input type="hidden" id="stopbyx'+ mapCnt +'" name="stopbyx'+ mapCnt +'" value="">');
			var btn = $('<div class="col-sm-2">').append('<button type="button" class="btn btn-info btn-sm searchBtn">검색</button>').append('<input type="hidden" id="stopbyy'+ mapCnt +'" name="stopbyy'+ mapCnt +'" value="">');
			$('<div id="mapPlusD">').append(inp).append(btn).appendTo('#mapPlusDiv');
			$('.searchBtn').val(mapCnt);
			
		}
	});
	
	$(document).on('click', '.minusBtn', function() {
		if(mapCnt > 0){
			$('#mapPlusD').remove();
			mapCnt--;
		}
	});
	
	$('#writeBtn').click(function() {
		if($('#subject').val() == "") {
			alert("제목입력!");
			return;
		} else if($('#content').val() == "") {
			alert("내용입력!");
			return;
		} else {
			for(var i=0; i<=mapCnt; i++) {
				$('#stopbyx'+i).val(stopbyx[i]);
				$('#stopbyy'+i).val(stopbyy[i]);
			}
			$('#mapCnt').val(mapCnt);
			
			$('#writeForm').attr('method', 'post').attr('action', '${root}/mapboard/write.gbg').submit();
		}
	})
})

</script>
	<div class="col-sm-9 main">
	<form id="writeForm" name="writeForm">
	<input type="hidden" name="bcode" value="${qs.bcode}">
	<input type="hidden" name="pg" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	<input type="hidden" name="mapCnt" id="mapCnt" value="">
<%-- <c:forEach var="i" begin="0" end="4" step="1">
	<input type="hidden" id="stopbyx${i}" name="stopbyx${i}" value="">
	<input type="hidden" id="stopbyy${i}" name="stopbyy${i}" value="">
</c:forEach> --%>
		<div class="row">
			<div class="col-sm-6">
				
				<label for="subject">제목 :</label>
				<input type="subject" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요."><br>
				
				<div class="row">
					<div class="col-sm-7">
						<label for="subject">경로 :</label>
					</div>
					<div class="col-sm-5">
						&nbsp&nbsp&nbsp&nbsp
						<button type="button" id="plusBtn" class="btn btn-warning btn-sm">+</button>
						<button type="button" class="minusBtn btn btn-danger btn-sm">-</button>
						<button type="button" class="btn btn-primary btn-sm mapfinishBtn">지도 확인</button>
					</div>
				</div>
				
				<div id="mapPlusDiv" class="row">
					<div id="mapPlusD">
						<div class="col-sm-10">
							<input type="subject" class="form-control sMap" value="">
						</div>
						<div class="col-sm-2" >
							<button type="button" class="btn btn-info btn-sm searchBtn" value="0">검색</button>
						</div>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-sm-10">
						<input type="subject" class="form-control start" id="start" name="start">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-sm startBtn">+</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<input type="subject" class="form-control stopby1" id="stopby1" name="stopby1">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-sm stopby1Btn">+</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<input type="subject" class="form-control stopby2" id="stopby2" name="stopby2">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-sm stopby2Btn">+</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<input type="subject" class="form-control stopby3" id="stopby3" name="stopby3">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-sm stopby3Btn">+</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">
						<input type="subject" class="form-control finish" id="finish" name="finish">
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-warning btn-sm finishBtn">+</button>
					</div>
				</div> -->
			</div>
			<div class="col-sm-6">
				<%@ include file="/page/community/map/daummap.jsp" %>
			</div>
			<div class="form-group">
			  <label for="content"></label>
			  <textarea class="form-control summernote" id="content" name="content"></textarea>
			</div>
			<div class="col-sm-11"></div>
			<div class="col-sm-1"> 
				<button type="button" class="btn btn-primary" id="writeBtn">확인</button>
			</div>
		</div>
	</form>	
	</div>
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	