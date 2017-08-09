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
  
var step = 0;  
  
$(document).ready(function() {
	
	$('#plusBtn').click(function() {
		if(step < 4){
			step++;
			var inp = $('<div class="col-sm-10">').append('<input type="subject" class="form-control sMap">').append('<input type="hidden" name="step" id="step'+step+'" value="">').append('<input type="hidden" id="x'+step+'" name="x" value="">');
			var btn = $('<div class="col-sm-2">').append('<button type="button" class="btn btn-info btn-sm searchBtn">검색</button>').append('<input type="hidden" id="y'+step+'" name="y" value="">');
			$('<div id="mapPlusD">').append(inp).append(btn).appendTo('#mapPlusDiv');
			$('.searchBtn').val(step);
			
		}
	});
	
	$(document).on('click', '.minusBtn', function() {
		if(step > 0){
			$('#mapPlusD').remove();
			step--;
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
			for(var i=0; i<=step; i++) {
				$('#x'+i).val(stopbyx[i]);
				$('#y'+i).val(stopbyy[i]);
				$('#step'+i).val(i);
			}
			
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
	<input type="hidden" id="step0" name="step" value="">
	<input type="hidden" id="x0" name="x" value="">
	<input type="hidden" id="y0" name="y" value="">

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
			</div>
			<div class="col-sm-6">
				<%@ include file="/WEB-INF/page/community/map/daummap_write.jsp" %>
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
	</div><br><br>
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/page/template/footer.jsp" %>	