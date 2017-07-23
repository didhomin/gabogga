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
			
			<table class="table table-striped table-hover">
			    <thead>
			      <tr>
			        <th width="10%"></th>
			        <th width="50%">제목</th>
			        <th width="15%">아이디</th>
			        <th width="15%">날짜</th>
			        <th width="10%">조회수</th>
			      </tr>
			    </thead>
			    <tbody>
<%
for(int i=1; i<=5; i++) {
%>			    
			      <tr>
			        <td>1004</td>
			        <td>제주도 나홀로 여행기</td>
			        <td>jieun</td>
			        <td>2017.07.23</td>
			        <td>1000</td>
			      </tr>
<%
}
%>
			    </tbody>
			</table>
			<!-- 하단 페이징 -->
			<div class="row">
				<div class="col-sm-3">	
					<ul class="pager">
					</ul>
				</div>
				<div class="col-sm-6">
					<ul class="pagination">
					  <li><a href="#">Previous</a></li>
					  <li><a href="#">1</a></li>
					  <li class="active"><a href="#">2</a></li>
					  <li><a href="#">3</a></li>
					  <li><a href="#">4</a></li>
					  <li><a href="#">5</a></li>
					  <li><a href="#">Next</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 검색영역  -->
			<form name="ulSearchForm" method="get" action="" onsubmit="return false;" style="margin: 0px">
				<input type="hidden" name="" value="">
				<input type="hidden" name="act" value="list">
				<input type="hidden" name="id" value="">
				<input type="hidden" name="pg" value="1">
				<div class="row" style="margin:auto;">	
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<select class="form-control" name="key">
								<option value="sub">제목
								<option value="id">아이디
						</select> 
					</div>
					<div class="col-sm-4">
						<input class="form-control" type="text" name="word" id="word" onkeypress="">
					</div>
					<div class="col-sm-4">
				        <a href="#" class="btn btn-info">
				          <span class="glyphicon glyphicon-search"></span> Search 
				        </a>
					</div>
				</div>
			</form>
		</div>

	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	