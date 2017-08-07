<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${user == null}">
<script>
window.onload= function() {
	alert("회원전용입니다.");
	document.location.href="${root}/index.jsp";
	
}
</script>
</c:if>