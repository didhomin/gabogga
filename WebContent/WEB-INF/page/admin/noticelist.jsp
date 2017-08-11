<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
<div class="col-sm-3 sidenav">
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
		$("#noticDelBtn").click(function() {
		valueArr = new Array();
		$("input[name=chk]:checked").each(function() {
			valueArr.push($(this).val());
		});
		if (valueArr == "") {
			alert("선택하세요");
		} else {
			 document.location.href =  "${root}/admin/delete.gbg?seq="+ valueArr;
		}
	});
	$("#writeBtn").click(function() {
		document.location.href="${root}/admin/write.gbg";
	});
	var valueArr = new Array();
	$(document).on('click','#seqId', function () {
		valueArr.push($(this).val());	
	});
	$('#noticDelBtn').click( function () {
		document.location.href = "${root}/admin/delete.gbg?seq="+ valueArr;
	});
	
	$(".tr").click(function() {
		 var seq= $(this).attr('data-seq'); 
		$('#'+seq).slideToggle("slow");
	});
	
	$("#searchBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/admin/notice.gbg').submit();
	});
	
});
function check() {
	cbox = input_form.chk;
	if (cbox.length) { 
		for (var i = 0; i < cbox.length; i++) {
			cbox[i].checked = input_form.all.checked;
		}
	} else {
		cbox.checked = input_form.all.checked;
	}
}
</script>

<div class="jumbotron" style="">
	<h3>
		<span class="glyphicon glyphicon-search"></span>&nbsp;도움말
	</h3>
</div>
	<div>
	<hr/>
	</div>
			<c:if test="${user.type==2 }">
			<div class="">
				<div class="pull-right">
						<a id="writeBtn" role="button" class="btn btn-default">글쓰기</a>
						<a class="btn btn-default" role="button" id="noticDelBtn">삭제</a>
						
				</div>
			</div>
			</c:if>
			<div class="row">
			
				<div class="col-sm-11"></div>
				<div class="col-sm-1" style="float:right;">	
					<c:if test="${user.type eq 2 }">
						
					</c:if>
				</div>
			</div><br>
			<form name="input_form">
			<table class="table table-striped table-hover">
			    <thead>
			      <tr>
			        <th width="5%"><input id="" type="checkbox" name="all" onclick="javascript:check();" value=""></th>
			        <th width="65%">제목</th>
			        <th width="15%">작성자</th>
			        <th width="15%">날짜</th>
			      </tr>
			    </thead>
			    <tbody>
<c:forEach var="article" items="${noticeList}">		    
			      <tr class="" data-seq="${article.seq}">
			        <td><input id="seqId" type="checkbox" name="chk" value="${article.seq}"></td>
			        <td>	
			        	<a  data-seq="${article.seq}" class="tr subject">${article.subject}
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
			</form>
<form action="" id="commonForm" name="commonForm" method="get">
	<input type="hidden" id="bcode" name="bcode">
	<input type="hidden" id="pg" name="pg">
	<input type="hidden" id="key" name="key">
	<input type="hidden" id="word" name="word">
	<input type="hidden" id="seq" name="seq">
</form>
<table width="100%"   cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td colspan="3" height="10"></td>
	</tr>
	<tr>
		<td width="25%"></td>
		<td nowrap>
		<select class="form-control" name="skey" id="skey" class="inp"  width="23" >
				<option value="subject">제목
				<option value="content">내용
		</select> 
		</td>
		<td nowrap> 
		<input class="form-control" type="text" name="sword" id="sword"
				size="20" class="inp" >  
   		</td>
   		<td nowrap>
     <a href="#" class="btn btn-info" id="searchBtn">
				          <span class="glyphicon glyphicon-search"></span> Search 
				        </a>
    
    <c:if test="${userInfo ==null }">
   
   </c:if>
   <br>
  </td>
  <td width="25%" align="right"><a href="#"></a><br>
  </td>
 </tr>
</table>			 
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	