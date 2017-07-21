<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기-->

<%@ include file="/page/community/boardmenu.jsp" %>
<!-- 여기서부터 게시판 메인 꾸미기 -->
		
		<div class="col-sm-9 main">			
			<div class="row">
			
				<div class="col-sm-5" style="background-color:pink;">
					<div class="row form-group">
						<div class="col-sm-4">제목</div>
						<div class="col-sm-8">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-4">경로</div>
						<div class="col-sm-8">
							<input type="subject" class="form-control" id="subject" name="subject">
							<input type="subject" class="form-control" id="subject" name="subject">
							<input type="subject" class="form-control" id="subject" name="subject">
							<input type="subject" class="form-control" id="subject" name="subject">
							<input type="subject" class="form-control" id="subject" name="subject">
						</div>
					</div>
				</div>
				<div class="col-sm-7" style="background-color:yellow;">
					<%@ include file="/page/community/map/daummap.jsp" %>
				</div>
			</div>
		</div>
	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	