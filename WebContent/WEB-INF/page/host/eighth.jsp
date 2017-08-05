<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.summernote').summernote({
		width:300,
	    height: 250,          // 기본 높이값
	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	  });
	
    $('#content').summernote();


	$('#backBtn').click(function(){
		$(location).attr('href', '${root}/host/eighth.gbg');
	});
	
	$('#registerBtn2').click(function(){
		document.hostform.action = "${root}/host/eighth.gbg";
		document.hostform.submit();
	});
	
	$('#indexBtn').click(function(){
		document.hostform.action = "${root}/host/final.gbg";
		document.hostform.submit();
	});
	
});
</script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<style>
.basic { 
	margin: 20px;
}

</style>
</head>
<body>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="100" aria-valuemin="0"
				aria-valuemax="100" style="width: 100%">100%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-10 col-sm-push-1" style="padding-top: 30px;">
					<form name="hostform" method="post">
					<br>
					<h2><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 마지막으로 게스트 하우스를 마음껏 소개해주세요.</h2> <br>
					<c:choose>
							<c:when test="${host8 != null }">
					<textarea id="content" name="content" class="summernote" rows="10" width="300px">
		${host8.introduce}</textarea>	
							</c:when>
							<c:otherwise>
					<textarea id="content" name="content" class="summernote" rows="10" width="300px"></textarea>	
							</c:otherwise>
							</c:choose>
					</form>
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
				완료 버튼을 누르면 숙박 상세 정보를 한눈에 볼 수 있습니다.<br><br>
				<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<div class="col-sm-6">
					<button id="indexBtn" type="button" class="btn btn-primary btn-lg btn-block">임시저장</button>
					</div>
					<div class="col-sm-6">
					<button id="registerBtn2" type="button" class="btn btn-primary btn-lg btn-block">완료</button>
					</div>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	