<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<c:if test="${not empty emailAuth }">
<script type="text/javascript">
$(document).ready(function() {
	alert("${emailAuth}님 인증이 완료되었습니다. 로그인후 이용하세요");	
	$('#modalLogin').modal('show');	
});
</script>
</c:if>
<c:if test="${empty user }">
<c:if test="${not empty loginresult }">
<script type="text/javascript">
$(document).ready(function() {
	alert("${loginresult}");	
	$('#modalLogin').modal('show');
});
</script>
</c:if>
</c:if>
<c:if test="${not empty mvlogin}">
<script type="text/javascript">	
$(document).ready(function() {
	$('#modalLogin').modal('show');
});
</script>
</c:if>
<c:if test="${not empty passModify}">
<script type="text/javascript">	
$(document).ready(function() {
	$('#modalPassModify').modal({backdrop: "static"});
});
</script>
</c:if>
<!-- 여기서부터 우리가 꾸미기 -->
<h1><font color="red">가보까!</font> 에서 </h1>
<div>
<h2> 게스트하우스를 예약해보세요.</h2>
</div> 	

	
	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	