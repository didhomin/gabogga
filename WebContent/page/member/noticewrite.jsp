<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
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
    height: 300,          // 기본 높이값
    minHeight: null,      // 최소 높이값(null은 제한 없음)
    maxHeight: null,      // 최대 높이값(null은 제한 없음)
    focus: true,          // 페이지가 열릴때 포커스를 지정함
    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
  });
});
 
$(document).ready(function() {
	
	$('#cancelBtn').click(function() {
		document.location.href="${root }/admin/notice.gbg";
	});
	$('#writeBtn').click(function() {
		if($('#subject').val() == "") {
			alert("제목입력!");
			return;
		} else if($('#content').val() == "") {
			alert("내용입력!");
			return;
		} else {
			$('#noticeForm').submit();
		}
	})
})

</script>
<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-info-sign"></i>공지사항
	</h3>
</div>
	<div class="col-sm-12">
	<form id="noticeForm" name="noticeForm" method="post" action="${root}/admin/write.gbg">
	<input type="hidden" name="bcode" value="10">
	<input type="hidden" name="pg" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	
		<div class="row">
			<label for="subject">제목 :</label>
		</div>
		<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요."><br>
		
		<label for="content">내용</label>
		<textarea class="form-control summernote" id="content" name="content"></textarea>

		<div class="col-sm-1 col-sm-offset-10">
			<button type="button" class="btn btn-primary pull-right" id="writeBtn">등록</button>
		</div>
		<div class="col-sm-1"> 
			<button type="button" class="btn btn-primary pull-right" id="cancelBtn">취소</button>
		</div>
	</form>		
	</div>

	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	