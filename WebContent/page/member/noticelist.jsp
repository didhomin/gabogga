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
   document.commonForm.bcode.value="${qs.bcode}";
   document.commonForm.pg.value= "1"; 
   document.commonForm.key.value= "";
   document.commonForm.word.value= "";
   
   document.commonForm.action ="${root}/reboard/list.gbg";
   document.commonForm.submit();
}

function listArticle(mpg){
   document.commonForm.bcode.value="${qs.bcode}";
   document.commonForm.pg.value= mpg;
   document.commonForm.key.value= "${qs.key}";
   document.commonForm.word.value= "${qs.word}";
   
   document.commonForm.action = "${root}/reboard/list.gbg";
   document.commonForm.submit();
}

$(document).ready(function() {
	
	$("#writeBtn").click(function() {
		document.location.href="${root}/admin/write.gbg";
	});
	
	/* $(".newBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#commonForm').attr('action', '${root}/reboard/write.gbg').submit();
	});
	 */
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
<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-info-sign"></i>공지사항
	</h3>
</div>
	<div>
	뭐라고쓰지
	<hr/>
	</div>
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<c:if test="${user.type eq 2 }">
						<button id="writeBtn" type="button" class="btn btn-primary btn-sm newBtn">글쓰기</button>
					</c:if>
				</div>
			</div><br>
			
			<table class="table table-striped table-hover">
			    <thead>
			      <tr>
			        <th width="70%">제목</th>
			        <th width="15%">작성자</th>
			        <th width="15%">날짜</th>
			      </tr>
			    </thead>
			    <tbody>
<c:forEach var="article" items="${noticeList}">		    
			      <tr>
			        <td>
			        	<a href="#" data-seq="${article.seq}" class="subject">${article.subject}
						</a>
					</td>
			        <td>[관리자] ${article.name}</td>
			        <td>${article.logtime}</td>
			      </tr>
</c:forEach>
			    </tbody>
			</table>
			
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	