<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기-->

<%@ include file="/page/community/boardmenu.jsp" %>
<!-- 여기서부터 게시판 메인 꾸미기 -->
		
		<div class="col-sm-9 main">			
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<button type="button" class="btn btn-primary btn-sm">글쓰기</button>
				</div>
			</div><br>
			
<%
for(int i=1; i<=15; i++) {
%>
				<div class="col-sm-3">
		            <div class="thumbnail">
		                <img src="http://placehold.it/300x200" alt="">
		                <div class="caption">
		                    <h5 class="pull-right">조회수</h5>
		                    <h5><a href="#">제목</a></h5>
		                    <h5><a href="#">아이디</a></h5>
		                    <h5><a href="#">날짜</a></h5>
		                </div>
		            </div>
		        </div>
<%
}
%>
		</div>

	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	