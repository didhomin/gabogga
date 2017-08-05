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
	//선택 하고 삭제 하는 구역
	var valueArr = new Array();
	$(document).on('click','#seqId', function () {
		valueArr.push($(this).val());	
	//	console.log("valueArr는" + valueArr);
	});
	$('#noticDelBtn').click( function () {
		document.location.href = "${root}/admin/delete.gbg?seq="+ valueArr;
		
	});
	
	
	/* $(".newBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#commonForm').attr('action', '${root}/reboard/write.gbg').submit();
	});
	 */
	$(".tr").click(function() {
		/*$(this).parent().next("tr").slideDown(500);*/
		$('.trtr').hide();
		 var seq= $(this).attr('data-seq'); 
		$('#'+seq).slideToggle("slow");
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
			<div class="">
				<div class="pull-right">
						<a id="writeBtn" role="button" class="btn btn-default">글쓰기</a>
						<a class="btn btn-default" href="javascript:;" role="button">공지등록</a>
						<a class="btn btn-default" id="" role="button">공지해제</a> 
						<a class="btn btn-default" role="button" id="noticDelBtn">삭제</a>
				</div>
			</div>
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<c:if test="${user.type eq 2 }">
						
					</c:if>
				</div>
			</div><br>
			
			<table class="table table-striped table-hover">
			    <thead>
			      <tr>
			        <th width="5%">순번</th>
			        <th width="65%">제목</th>
			        <th width="15%">작성자</th>
			        <th width="15%">날짜</th>
			      </tr>
			    </thead>
			    <tbody>
<c:forEach var="article" items="${noticeList}">		    
			      <tr class="tr" data-seq="${article.seq}">
			        <td><input id="seqId" type="checkbox" name="" value="${article.seq}">${article.seq}</td>
			        <td>
			        	<a  class="subject">${article.subject}
						</a>
					</td>
			        <td>[관리자] ${article.name}</td>
			        <td>${article.logtime}</td>
			      </tr>
			      <tr class="trtr" id="${article.seq }" style="display: none;">
			      <td>내용</td>
			      <td colspan="3">${article.content}</td>
				  	      
			      </tr>

</c:forEach>
			    </tbody>
			</table>
			
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	