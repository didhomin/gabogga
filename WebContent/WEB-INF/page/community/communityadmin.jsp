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
<script type="text/javascript">
$(document).ready(function() {
	$('#cPlusBtn').click(function() {
		$('#categoryform').attr('action', '${root}/boardadmin/makecategory.gbg').submit();
	});
	
	$('#bPlusBtn').click(function() {
		$('#boardform').attr('action', '${root}/boardadmin/makeboard.gbg').submit();		
	});
});
</script>
<!-- 여기서부터 게시판 메인 꾸미기 -->
	<div class="col-sm-9 main">			
		<div class="row jumbotron">
		
			<h2>
			<font color="red"><b>카테고리</b></font> 생성
			</h2><br>
			
			<form id="categoryform" name="categoryform" method="get" action="">
			
			<div class="row" style="margin:auto;">	
					<div class="col-sm-4">
						<input class="form-control" type="text" name="cname" id="cname" placeholder="카테고리 이름">
					</div>
					<div class="col-sm-4">
				        <a href="#" class="btn btn-primary" id="cPlusBtn">
				          <span class="glyphicon glyphicon-tags"> 카테고리 추가</span>
				        </a>
					</div>
			</div><br>
			
			</form>
			
			<h2>
			<font color="red"><b>게시판</b></font> 생성
			</h2><br>
			
			<form id="boardform" name="boardform" method="get" action="">
			
			<div class="row" style="margin:auto;">
				<div class="col-sm-4">
					<select class="form-control" id="ccode" name="ccode">
<c:forEach var="clist" items="${clist}">
						<option value="${clist.ccode}">
						${clist.cname}
</c:forEach>
					</select> 
				</div>
				<div class="col-sm-4">
					<select class="form-control" id="btype" name="btype">
<c:forEach var="btlist" items="${btlist}">
						<option value="${btlist.btype}">
						${btlist.btypeName}
</c:forEach>

					</select> 
				</div>
			</div><br>
			<div class="row" style="margin:auto;">
				<div class="col-sm-4">
					<input class="form-control" type="text" name="bname" id="bname" placeholder="게시판 이름">
				</div>
				<div class="col-sm-4">
					<a href="#" class="btn btn-info" id="bPlusBtn">
				    	<span class="glyphicon glyphicon-th-list"> 게시판 추가</span>
				    </a>
				</div>
			</div>
			</form>
		
		</div>
	</div>
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/page/template/footer.jsp" %>	