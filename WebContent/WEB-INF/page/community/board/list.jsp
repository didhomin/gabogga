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
			<div class="jumbotron" style="">
				<h3>
					<i class="fa fa-quote-left"></i>
					&nbsp;<b>답변게시판</b>
					<i class="	fa fa-quote-right"></i>
				</h3>
			</div>
			
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
			        	<a href="#" data-seq="${article.seq}" class="subject">
			        	<img src="${root}/img/blank.gif" height="1" width="${article.lev * 15}">
			        	${article.subject}&nbsp;&nbsp;
			        	<c:if test="${article.memocnt != 0}">
						<b>[${article.memocnt}]</b></a>
						</c:if>
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
			<!-- 하단 페이징 끝 -->
			</div>
			
			<!-- 검색영역  -->
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
				</div><br><br>
			<!-- 검색영역 끝 -->
		</div>
	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
</div>	
<%@ include file="/page/template/footer.jsp" %>	