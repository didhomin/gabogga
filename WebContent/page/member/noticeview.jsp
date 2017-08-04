<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp"%>
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
	<div class="col-sm-3 sidenav">
		<%@ include file="/page/community/boardmenu.jsp"%>
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

	$(".listArticle").click(function() {
		$('#bcode').val('${qs.bcode}');
		$('#pg').val('${qs.pg}');
		$('#key').val('${qs.key}');
		$('#word').val('${qs.word}');
		$('#seq').v
		al($(this).attr('data-seq'));
		
		
		$('#commonForm').attr('action', '${root}/reboard/list.gbg').submit();
	});

});
</script>

<!-- 여기서부터 게시판 메인 꾸미기 -->
<div class="col-sm-9 main">


	<table class="table table-bordered">
		<thead>
			<tr class="info">
				<td width="80%"><b>${article.subject}</b></td>
				<td width="20%">${article.logtime}</td>
			</tr>
		</thead>
		<thead>
			<tr class="warning">
				<td width="80%"><b>${article.name}</b></td>
				<td width="20%">조회수 : ${article.hit}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">${article.content}</td>
			</tr>
		</tbody>
	</table>

	<div class="row input-group-form">
		<div class="col-sm-10">
			<textarea class="form-control" rows="3" id="comm"
				placeholder="댓글을 입력해주세요.">
					</textarea>
		</div>
		<div class="col-sm-2">
			<div class="checkbox">
				<label><input type="checkbox" value="">비밀로하기</label>
			</div>
			<button type="button" class="btn btn-warning btn-sm">댓글입력</button>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-11"></div>
		<div class="col-sm-1">
			<button type="button" class="btn btn-success btn-sm listArticle">목록</button>
		</div>
	</div>
	<br>
</div>



<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp"%>
