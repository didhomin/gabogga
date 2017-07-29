<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
  <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
  <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
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
<c:if test="${not empty passReset}">
<script type="text/javascript">	
$(document).ready(function() {
	alert("${passReset}로 임시비밀번호가 발송되었습니다.");	
});
</script>
</c:if>
<c:if test="${not empty snslogin}">
<script type="text/javascript">	
$(document).ready(function() {
	alert("${snslogin}님 안녕하세요.");	
});
</script>
</c:if>


<script>
function searchUser() {
   if (document.searchForm.address1.value == "") {
      alert("검색어 입력!!!!!");
   } else {
      document.searchForm.action = "${root}/list/list.gbg";
      document.searchForm.submit();
   }
}
</script>


<!-- 여기서부터 우리가 꾸미기 -->


<div class="jumbotron" style="">
	<h1>
		<font color="red"><b>가보까?</b></font> 에서
	</h1>
	<h2>게스트하우스를 예약해보세요.</h2>
	<div class="input-group-lg">
	 <form class="form-inline" role="form" name="searchForm" method="get">
        <div class="form-group input-group-lg">
        	
          <input type="text" class="form-control" name="address1" id="" placeholder="위치">
        </div>
        <div class="form-group input-group-lg">
          <input type="text" class="form-control" style="background-color:#fff; " id="from" placeholder="날짜" readonly="readonly">
        </div>
      	<div class="form-group input-group-lg">
        </div>
        <div class="form-group input-group-lg">
          <input type="text" class="form-control " id="" placeholder="인원">
      		 <a href="#" class="btn btn-info btn-lg" onclick="javascript:searchUser();">
             	<span class="glyphicon glyphicon-search"></span> Search 
             </a>
        </div>
      </form>
	</div>
		
</div>
	<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
<div class="row">
	<div class="fotorama col-sm-4">
		<img src="http://s.fotorama.io/1.jpg">
		<img src="http://s.fotorama.io/2.jpg">
	</div>
	<div class="fotorama col-sm-4">
		<img src="http://s.fotorama.io/1.jpg">
		<img src="http://s.fotorama.io/2.jpg">
	</div>
	<div class="fotorama col-sm-4">
		<img src="http://s.fotorama.io/1.jpg">
		<img src="http://s.fotorama.io/2.jpg">
	</div>
</div>

<script src="${root }/page/house/js/index.js"></script>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	