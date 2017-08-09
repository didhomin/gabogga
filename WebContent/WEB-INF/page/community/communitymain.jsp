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

	<div class="col-sm-9 main">
		<div class="jumbotron" style="">
			<h3>
				<i class="fa fa-quote-left"></i>
				&nbsp;<b>커뮤니티</b>
				<i class="	fa fa-quote-right"></i>
			</h3>
		</div>
		<div class="col-sm-10 col-sm-offset-2">			
			<img src="${root}/img/communitymain.png" width="80%">	
		</div>
	</div>
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/page/template/footer.jsp" %>	