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

<script type="text/javascript">

function firstArticle(){
   document.commonForm.bcode.value=${qs.bcode};
   document.commonForm.pg.value= "1"; 
   document.commonForm.key.value= "";
   document.commonForm.word.value= "";
   
   document.commonForm.action ="${root}/reboard/list.gbg";
   document.commonForm.submit();
}

function listArticle(mpg){
   document.commonForm.bcode.value=${qs.bcode};
   document.commonForm.pg.value= mpg;
   document.commonForm.key.value= "${qs.key}";
   document.commonForm.word.value= "${qs.word}";
   
   document.commonForm.action = "${root}/reboard/list.gbg";
   document.commonForm.submit();
}

$(document).ready(function() {
	
	$(".newBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#commonForm').attr('action', '${root}/reboard/write.gbg').submit();
	});
	
	$(".subject").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#seq').val($(this).attr('data-seq'));
		$('#commonForm').attr('action', '${root}/reboard/view.gbg').submit();
	});
	
	$("#searchBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/reboard/list.gbg').submit();
	});
	
});
</script>

<!-- 여기서부터 게시판 메인 꾸미기 -->
		<div class="col-sm-9 main">			
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<button type="button" class="btn btn-primary btn-sm newBtn">글쓰기</button>
				</div>
			</div><br>
			
			<table class="table table-striped table-hover">
			    <thead>
			      <tr>
			        <th width="10%"></th>
			        <th width="50%">제목</th>
			        <th width="15%">작성자</th>
			        <th width="15%">날짜</th>
			        <th width="10%">조회수</th>
			      </tr>
			    </thead>
			    <tbody>
<c:forEach var="article" items="${articleList}">		    
			      <tr>
			        <td>${article.seq}</td>
			        <td>
			        	<a href="#" data-seq="${article.seq}" class="subject">${article.subject}
						</a>
					</td>
			        <td>${article.name}</td>
			        <td>${article.logtime}</td>
			        <td>${article.hit}</td>
			      </tr>
</c:forEach>
			    </tbody>
			</table>
			<!-- 하단 페이징 -->
			<div class="row">
			<div align="center">${navigator.navigator}</div>
				<!-- <div class="col-sm-3">	
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
				</div> -->
			</div>
			
			<!-- 검색영역  -->
		<!-- 	<form name="ulSearchForm" method="get" action="" onsubmit="return false;" style="margin: 0px">
				<input type="hidden" name="" value="">
				<input type="hidden" name="act" value="list">
				<input type="hidden" name="id" value="">
				<input type="hidden" name="pg" value="1"> -->
				<div class="row" style="margin:auto;">	
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<select class="form-control" id="skey" name="skey">
								<option value="subject">제목
								<option value="name">아이디
						</select> 
					</div>
					<div class="col-sm-4">
						<input class="form-control" type="text" name="sword" id="sword" onkeypress="">
					</div>
					<div class="col-sm-4">
				        <a href="#" class="btn btn-info" id="searchBtn">
				          <span class="glyphicon glyphicon-search"></span> Search 
				        </a>
					</div>
				</div>
			<!-- </form> -->
		</div>
	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	