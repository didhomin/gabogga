<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기-->

<%@ include file="/page/community/boardmenu.jsp" %>
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
</script>
		<div class="col-sm-9 main">			
			<div class="row">
				<div class="col-sm-6">
					<label for="subject">제목 :</label>
					<input type="subject" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요."><br>

					<label for="subject">경로 :</label>
					<div class="row">
						<div class="col-sm-10">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-warning btn-sm">+</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-warning btn-sm">+</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-warning btn-sm">+</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-warning btn-sm">+</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-10">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-info btn-sm">확인</button>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<%@ include file="/page/community/map/daummap.jsp" %>
				</div>
				<div class="form-group">
				  <label for="content"></label>
				  <textarea class="form-control summernote" id="content"></textarea>
				</div>
				<div class="col-sm-11"></div>
				<div class="col-sm-1"> 
					<button type="button" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	