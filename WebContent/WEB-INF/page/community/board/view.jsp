<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<%@ include file="/WEB-INF/page/community/logincheck.jsp" %>
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
<div class="col-sm-3 sidenav">
<%@ include file="/WEB-INF/page/community/boardmenu.jsp" %>
</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$(".newBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#commonForm').attr('action', '${root}/reboard/write.gbg').submit();
	});
	
	$(".replyBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('1');
		$('#key').val('');
		$('#word').val('');
		$('#seq').val('${article.seq}');
		$('#commonForm').attr('action', '${root}/reboard/reply.gbg').submit();
	});
	
	$(".listArticle").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#seq').val($(this).attr('data-seq'));
		$('#commonForm').attr('action', '${root}/reboard/list.gbg').submit();
	});
	
	$(".modifyBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('');
		$('#word').val('');
		$('#seq').val('${article.seq}');
		$('#commonForm').attr('action', '${root}/reboard/modify.gbg').submit();
	});
	
	$(".deleteBtn").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('');
		$('#key').val('');
		$('#word').val('');
		$('#seq').val('${article.seq}');
		$('#commonForm').attr('action', '${root}/reboard/delete.gbg').submit();
	});
	
	$('#memoWriteBtn').click(function() {
		var content = $.trim($('#mcontent').val());
		var check = document.memoForm.scheck.checked;
        var scheck;
        if(check){
        	scheck = 1;
        } else {
        	scheck = 0;
        }
		
		if(content != '') {
			$.ajax({
				type : 'POST', //get이냐 post냐
				dataType : 'json',//넘어오는 datatype
				url : '${root}/memo/write.gbg',//어디로 넘어갈껀지
				data : {'seq' : '${article.seq}', 'mcontent' : content, 'secret' : scheck},//호출할 data
				success : function(data) {
					$('#mcontent').val('');
					makeMemoList(data);
				}//callback 설정 성공시? 에러시?(에러는 걍 안함)
			}); //ajax 쓰겟다.
		}
	});
	
	$(document).on('click', '.memoModifyViewBtn', function() { //click되는 시점에서의  document
		$('#modifyDiv'+$(this).attr('data-mseq')).css('display', '');
	});
	
	$(document).on('click', '.memoModifyBtn', function() { //click되는 시점에서의  document
		var mseq = $(this).attr('data-mseq');
		var content = $.trim($('#mcontent' + mseq).val());
		if(content != '') {
			$.ajax({
				type : 'POST', //get이냐 post냐
				dataType : 'json',//넘어오는 datatype
				url : '${root}/memo/modify.gbg',//어디로 넘어갈껀지
				data : {'mseq' : mseq, 'mcontent' : content, 'seq' : '${article.seq}'},//호출할 data
				success : function(data) {
					//$('#mcontent').val('');
					makeMemoList(data);
				}//callback 설정 성공시? 에러시?(에러는 걍 안함)
			}); //ajax 쓰겟다.
		}
	});
	
	$(document).on('click', '.memoCancelBtn', function() { //click되는 시점에서의  document
		$('#modifyDiv'+$(this).attr('data-mseq')).css('display', 'none');
	});
	
	$(document).on('click', '.memoDeleteBtn', function() { //click되는 시점에서의  document
		var mseq = $(this).attr('data-mseq');
		$.ajax({
			type : 'GET', //get이냐 post냐
			dataType : 'json',//넘어오는 datatype
			url : '${root}/memo/delete.gbg',//어디로 넘어갈껀지
			data : {'mseq' : mseq, 'seq' : '${article.seq}'},//호출할 data
			success : function(data) {
				//$('#mcontent').val('');
				makeMemoList(data);
			}//callback 설정 성공시? 에러시?(에러는 걍 안함)
		}); //ajax 쓰겟다.
	});
	
});

$.ajax({
	type : 'GET', //get이냐 post냐
	dataType : 'json',//넘어오는 datatype
	url : '${root}/memo/list.gbg',//어디로 넘어갈껀지
	data : {'seq' : '${article.seq}'},//호출할 data
	success : function(data) {
		makeMemoList(data);
	}//callback 설정 성공시? 에러시?(에러는 걍 안함)
}); //ajax 쓰겟다.

function makeMemoList(data) {
	var output = '';
	var len = data.memolist.length;
	for(var i=0; i<len; i++) {
		if((data.memolist[i].secret == 1 && '${user.userId}' != data.memolist[i].userId) || (data.memolist[i].secret == 1 && '${user.userId}' != '${article.userId}')) {
			output += '<tr>';
			output += '	<td>';
			output += '		<table>';
			output += '			<tr>';
			output += '    			<td width="50%"> 비밀 댓글 입니다. </td>';
			output += '    			<td width="20%">'+ data.memolist[i].mtime +'</td>';
			output += '			</tr>';
			output += '		</table>';
			output += '	</td>';
			output += '</tr>';
			output += '<tr>';
			output += '	<td>';
		} else {
			output += '<tr>';
			output += '	<td>';
			output += '		<table>';
			output += '			<tr>';
			output += '				<td width="20%"><b>'+ data.memolist[i].name +'</b>&nbsp;&nbsp;</td>';
			output += '    			<td width="20%">'+ data.memolist[i].mtime +'</td>';
			output += '    			<td width="50%"></td>';
			output += '   			<td class="pull-right">';
			if('${user.userId}' == data.memolist[i].userId) {
			output += '        			<a href="#" class="memoModifyViewBtn" data-mseq="'+ data.memolist[i].mseq +'">수정</a>&nbsp;&nbsp;';
			output += '        			<a href="#" class="memoDeleteBtn" data-mseq="'+ data.memolist[i].mseq +'">삭제</a>';
			}
			output += '    			</td>';
			output += '			</tr>';
			output += '			<tr>';
			output += '				<td colspan="4" class="viewcontent">';
			output += '				<br>';
			output += ''+ data.memolist[i].mcontent +'';
			output += '				</td>';
			output += '			</tr>';
			output += '		</table>';
			output += '	</td>';
			output += '</tr>';
			output += '<tr>';
			output += '	<td>';
		}
		output += '	<div id="modifyDiv'+ data.memolist[i].mseq +'" style="display: none;">';
		output += '		<div class="row input-group-form">';
		output += '			<div class="row col-sm-1">&nbsp&nbsp&nbsp&nbsp&nbsp';
		output += '				<span class="glyphicon glyphicon-arrow-right"></span>';
		output += '			</div>';
		output += '			<div class="col-sm-9">';
		output += '				<textarea class="form-control" rows="3" name="mcontent" id="mcontent'+ data.memolist[i].mseq +'">';
		output += ''+ data.memolist[i].mcontent +'</textarea>';
		output += '			</div>';
		output += '			<div class="col-sm-2">';
		output += '				<div>';
		output += '				  <label></label>';
		output += '				</div>';	
		output += '				<button type="button" class="btn btn-warning btn-sm memoModifyBtn" data-mseq="'+ data.memolist[i].mseq +'">수정</button>';
		output += '				<button type="button" class="btn btn-danger btn-sm memoCancelBtn" data-mseq="'+ data.memolist[i].mseq +'">취소</button>';
		output += '			</div>';
		output += '		</div><br>';
		output += '	</div>';
		output += '	</td>';
		output += '</tr>';
	}
	$('#memobody').empty();
	$('#memobody').append(output);
}
</script>

<!-- 여기서부터 게시판 메인 꾸미기 -->
		<div class="col-sm-9 main">			
			<div class="row">
				<div class="col-sm-10">
					<button type="button" class="btn btn-success btn-sm listArticle">목록</button>
				</div>
				<div class="col-sm-2 input-group-btn">	
					<a href="#" class="btn btn-primary btn-sm">
			          <span class="glyphicon glyphicon-pencil newBtn">글쓰기</span>
			        </a>
			        <button type="button" class="btn btn-info btn-sm replyBtn">답글</button>
				</div>
			</div><br>
			
			<table class="table table-bordered">
			    <thead>
			      <tr class="info">
			        <td width="80%"><b>제목 : ${article.subject}</b></td>
			        <td width="20%"><b>${article.logtime}</b></td>
			      </tr>
			    </thead>
			    <thead>
			      <tr class="warning">
			        <td width="80%"><b>작성자 : ${article.name}</b></td>
			        <td width="20%"><b>조회수 : ${article.hit}</b></td>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td colspan="2">
			        	${article.content}
			        </td>
			      </tr>
			    </tbody>
			</table>
			<form name="memoForm" id="memoForm" action="">
			<div class="row input-group-form">
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="mcontent" id="mcontent"></textarea>
				</div>
				<div class="col-sm-2">
					<div class="checkbox">
					  <label><input type="checkbox" value="" id="scheck" name="scheck">비밀로하기</label>
					</div>	
					<button type="button" class="btn btn-primary btn-sm" id="memoWriteBtn">댓글쓰기</button>
				</div>
			</div><br>
			</form>
			<table class="table table-striped">
<!-- 댓글 리스트 -->
				
<!-- 댓글 리스트 끝 -->
				<tbody id="memobody"></tbody>
			</table>
			
<!-- 글쓰기, 목록 -->
			<div class="row">
				<div class="col-sm-10">
					<button type="button" class="btn btn-success btn-sm listArticle">목록</button>
				</div>
<c:if test="${user.userId == article.userId}">
				<div class="col-sm-2 input-group-btn">	
					<a href="#" class="btn btn-warning btn-sm">
			          <span class="glyphicon glyphicon-pencil modifyBtn">수정</span>
			        </a>
			        <button type="button" class="btn btn-danger btn-sm deleteBtn">삭제</button>
				</div>
</c:if>
<c:if test="${user.userId != article.userId}">
				<div class="col-sm-2 input-group-btn">	
					<a href="#" class="btn btn-primary btn-sm">
			          <span class="glyphicon glyphicon-pencil newBtn">글쓰기</span>
			        </a>
			        <button type="button" class="btn btn-info btn-sm replyBtn">답글</button>
				</div>
</c:if>
			</div>
		</div>
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	