<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/page/template/header.jsp" %>	
<%@ include file="/WEB-INF/page/community/logincheck.jsp" %>
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
 
$(document).ready(function() {
	$('#writeBtn').click(function() {
		if($('#subject').val() == "") {
			alert("제목입력!");
			return;
		} else if($('#content').val() == "") {
			alert("내용입력!");
			return;
		} else {
			$('#writeForm').attr('method', 'post').attr('action', '${root}/reboard/write.gbg').submit();
		}
	});
});

</script>
	<div class="col-sm-9 main">
	<form id="writeForm" name="writeForm">
	<input type="hidden" name="bcode" value="${qs.bcode}">
	<input type="hidden" name="pg" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	
		<div class="col-sm-11 row">
			<label for="subject">제목 :</label>
		</div>
		<input type="subject" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요."><br>
		
		<label for="content">내용</label>
		<textarea class="form-control summernote" id="content" name="content"></textarea>

		<div class="col-sm-11"></div>
		<div class="col-sm-1"> 
			<button type="button" class="btn btn-primary" id="writeBtn">확인</button>
		</div>
	</form>		
	</div><br><br>
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/WEB-INF/page/template/footer.jsp" %>	