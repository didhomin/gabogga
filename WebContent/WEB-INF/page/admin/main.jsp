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
<script src="${root }/js/main.js"></script>
<link rel="stylesheet"
	href="${root }/css/main.css">
<!-- 여기서부터 우리가 꾸미기 -->

<div class="jumbotron" style="">
	<div class="row">
	<div class="col-sm-5">
		<img src="${root}/img/mainlogo.png" style="width:400px;">
		<br><br><br>
	</div>
	<div class="col-sm-7">
		<br>
		<font size="9px;" style="padding-bottom: 5px;">에서</font><font size="6px;"><br>게스트하우스를 예약해보세요.</font>
		<br>
	</div>
	
	</div>
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
             		<input type="image" src="${root }/img/minus.png"  id="adultminus" width="30px;" onclick="adultminus();return false;" >
             		<span>1</span> 
             		<input type="image" src="${root }/img/plus.png" id="adultplus" width="30px;" onclick="adultplus();return false;" >
             	</div>
             	<div class="col-sm-6">어린이</div>
             	<div class="col-sm-6">
             		<input type="image" src="${root }/img/minus.png"  id="childminus"  width="30px;" onclick="childminus();return false;">
             		<span>0</span>
             		<input type="image" src="${root }/img/plus.png" id="childplus" width="30px;" onclick="childplus();return false;" >
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
						<a href="${root }/house/reservation.gbg?guesthouseId=${aa.ghId}"><img style="width:360px; height: 250px;" src="${root }/upload/${aa.pictureGh }"></a>
						<font size="5"><b>${aa.gname }</b></font> &nbsp;&nbsp;<c:if test="${aa.good != null}"><img src="${root}/img/heart.png" width="25px"> <b> ${aa.good}</b>개</c:if>
						<br>평균가격 : <font size="5"><b>${aa.roomPay }</b></font>
					</div>
					<c:if test="${ii.count%3==0 }"></div><div class="row"></c:if>
				</c:forEach>
			</div>
		</div>
		<div class="tab-pane" id="groupReal">
			<div class="row">
				<c:forEach items="${mainprice }" var="bb" varStatus="i">
					<div class="col-sm-4">
						<a href="${root }/house/reservation.gbg?guesthouseId=${bb.ghId}"><img style="width:360px; height: 250px;" src="${root }/upload/${bb.pictureGh }"></a>
						<font size="5"><b>${bb.gname }</b></font> &nbsp;&nbsp;<c:if test="${bb.good != null}"><img src="${root}/img/heart.png" width="25px"> <b> ${bb.good}</b>개</c:if>
						<br>평균가격 : <font size="5"><b>${bb.roomPay }</b></font>
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