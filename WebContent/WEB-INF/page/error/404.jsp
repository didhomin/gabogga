<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
  <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
  <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>


<link rel="stylesheet"
	href="${root }/css/main.css">
<!-- 여기서부터 우리가 꾸미기 -->

<div class="jumbotron" style="background-color: #f5f5f5;">
	<div class="row">
	<div class="col-sm-7">
		<h1><b>죄송합니다.</b>	</h1>
		<h2>요청하신 페이지를 찾을 수 없습니다.</h2><br><br>
		<h4>방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>
		<br>
		페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br>
		<br>
		입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br>
		<br>
		관련 문의사항은 <b><a href="${root }/admin/qna.gbg">문의하기</a></b>로 알려주시면 친절하게 답변 드리겠습니다.<br>
		<br>
		감사합니다. 처음 화면으로 돌아가고 싶으시다면 라이언을 눌러주세요!!</h4>
	</div>
	<div class="col-sm-5">
		<a href="${root }/index.jsp"><img src="${root }/img/error404.gif"></a>
	</div>
	</div>
</div>
<script src="${root }/js/index.js"></script>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	