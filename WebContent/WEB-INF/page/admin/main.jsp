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
<c:if test="${not empty passReset}">
<script type="text/javascript">	
$(document).ready(function() {
	alert("${passReset}로 임시비밀번호가 발송되었습니다.");	
});
</script>
</c:if>
<c:if test="${not empty register}">
<script type="text/javascript">	
$(document).ready(function() {
	alert("인증 메일이 발송되었습니다. 메일 인증 후 이용해주세요.");	
});
</script>
</c:if>


<script type="text/javascript">
function searchUser() {
   if (document.searchForm.address1.value == "") {
      alert("검색어 입력!!!!!");
   } else {
      document.searchForm.action = "${root}/list/list.gbg";
      document.searchForm.submit();
   }
}

</script>
<script src="${root }/page/member/js/main.js"></script>
<link rel="stylesheet"
	href="${root }/page/member/css/main.css">
<!-- 여기서부터 우리가 꾸미기 -->

<div class="jumbotron" style="">
	<h1>
		<font color="red"><b>가보까?</b></font> 에서
	</h1>
	<h2>게스트하우스를 예약해보세요.</h2>
	<div class="input-group-lg">
	 <form class="form-inline" role="form" name="searchForm" method="get">
        <div class="form-group input-group-lg">
        	
          <input type="text" class="form-control" id="address" name="address1" value="" placeholder="위치">
        </div>
        <div class="form-group input-group-lg">
          <input type="text" class="form-control" style="background-color:#fff; " id="from" placeholder="날짜" readonly="readonly">
        </div>
      	<div class="form-group input-group-lg">
        </div>
        <div class="form-group input-group-lg">
          <input type="text" class="form-control" style="background-color:#fff;" id="person" value="성인1명" readonly="readonly">
      		 <a href="#" class="btn btn-info btn-lg" onclick="javascript:searchUser();">
             	<span class="glyphicon glyphicon-search"></span> Search 
             </a>
             <div id="resultperson" class="">
             	<div class="col-sm-6">성인</div>
             	<div class="col-sm-6">
             		<input type="image" src="${root }/page/member/img/minus.png"  id="adultminus" width="30px;" onclick="adultminus();return false;" >
             		<span>1</span> 
             		<input type="image" src="${root }/page/member/img/plus.png" id="adultplus" width="30px;" onclick="adultplus();return false;" >
             	</div>
             	<div class="col-sm-6">어린이</div>
             	<div class="col-sm-6">
             		<input type="image" src="${root }/page/member/img/minus.png"  id="childminus"  width="30px;" onclick="childminus();return false;">
             		<span>0</span>
             		<input type="image" src="${root }/page/member/img/plus.png" id="childplus" width="30px;" onclick="childplus();return false;" >
             	</div>
             	<div class="col-sm-6"><a href="javascript:personcancel();">취소</a></div>
             	<div class="col-sm-offset-8"><a href="javascript:personok();">적용</a></div>
             </div>
        </div>
      </form>
          <div id="resultaddress" class=""></div>
          
	</div>
</div>
                 

<div class="tabbable" id="tabs-630325" align="left" style="width: 100%; clear:both;">
	<ul class="nav nav-tabs">
		<li class="active">
			<a href="#waiting" data-toggle="tab">인기순</a>
   		</li>
   		<li>
      		<a href="#groupReal" data-toggle="tab">가격순</a>
   		</li>
	</ul>
	<div class="tab-content">
	   <div class="tab-pane active" id="waiting">
			<div class="row">
				<c:forEach items="${main }" var="aa" varStatus="ii">
					<div class="col-sm-4">
						<a href="${root }/house/reservation.gbg?guesthouseId=${aa.ghId}"><img style="width:360px; height: 250px;" src="${root }/img/${aa.pictureGh }.jpg"></a>
						이름:${aa.gname } 가격:${aa.roomPay }
					</div>
					<c:if test="${ii.count%3==0 }"></div><div class="row"></c:if>
				</c:forEach>
			</div>
		</div>
		<div class="tab-pane" id="groupReal">
			<div class="row">
				<c:forEach items="${mainprice }" var="bb" varStatus="i">
					<div class="col-sm-4">
						<a href="${root }/house/reservation.gbg?guesthouseId=${aa.ghId}"><img style="width:360px; height: 250px;" src="${root }/img/${bb.pictureGh }.jpg"></a>
						<span>이름:${bb.gname } 가격:${bb.roomPay }</span>
					</div>
					<c:if test="${i.count%3==0 }"></div><div class="row"></c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script src="${root }/page/house/js/index.js"></script>
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	