<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	
	$('#progressBtn').click(function(){ 
		if(document.getElementById("houseName").value == ""){
			alert("숙박 시설 이름 입력!");
			return;
		} else if(document.getElementById("houseTotal").value == ""){
			alert("전체 객실 수 입력!");
			return;
		}else if(document.getElementById("housePhone").value == ""){
			alert("연락처 입력!"); 
			return;
		}else if(document.getElementById("housePay").value == ""){
			alert("게스트하우스 평균 요금 입력!"); 
			return;
		}else if(document.getElementById("picture").value == ""){
			alert("게스트하우스 대표 사진 등록!"); 
			return;
		}else{
		document.hostform.action = "${root}/host/second.gbg";
		document.hostform.submit();
		}
	});
		
	$('#backBtn').click(function(){
		$(location).attr('href', '${root}/host/second.gbg');
	});
	
});
</script>
<style>
body{
   font-family: 'Open Sans', sans-serif;
   color: #353535;
}

.basic {
	margin: 20px;
}
</style>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="15" aria-valuemin="0"
				aria-valuemax="100" style="width: 15%">15%</div>
		</div>
		<div class="basic">
			
			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-3 col-sm-push-1" style="padding-top:30px;">
				<form name="hostform" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userid" value="${user.userId}">
				<h2>기본사항</h2>
			<br>
			<c:choose>
			<c:when test="${host2.name != null }">
					<i class="fa fa-star"></i> <font
						size="3px" color="blue" ><strong>숙박 시설 이름</strong> </font><br> <input
						id="houseName" name="houseName" type="text" class="form-control" placeholder="내용을 입력해주세요." value="${host2.name}">
					<br> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>전체 객실 수</strong> </font><br>
					<div class="row">
						<div class="col-sm-6">
							<input id="houseTotal" name="houseTotal" type="text" class="form-control" placeholder="내용을 입력해주세요."
								size="1px" value="${host2.roomCount}">
						</div>
						<div class="col-sm-6"></div>
					</div>
					<br> <i class="fa fa-internet-explorer"></i>
					<font size="3px" color="blue"><strong>웹 사이트 (선택사항)</strong> </font><br> <input
						id="houseSite" name="houseSite" type="text" class="form-control" placeholder="내용을 입력해주세요."
						value="${host2.hwebsite}">
					<br><i class="fa fa-address-book-o"></i>
					<font size="3px" color="blue"><strong>연락처 </strong></font><br> <input
						id="housePhone" name="housePhone" type="text" class="form-control" placeholder="내용을 입력해주세요."
						value="${host2.phone}"
						>
					<br> <i class="fa fa-cc-paypal"></i>
					<font size="3px" color="blue"><strong>게스트하우스 평균 요금</strong> </font><br> <input
						id="housePay" name="housePay" type="text" class="form-control" placeholder="￦/박"
						value="${host2.housePay}">
				<br><span class="glyphicon glyphicon-cloud" aria-hi dden="true"></span>
					<font size="3px" color="blue"><strong>게스트하우스 대표 사진</strong> </font><br> 
					<input type="file" id="picture" name="picture" value="">
					</c:when>
					<c:otherwise> 
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span> <font
						size="3px" color="blue" ><strong>숙박 시설 이름</strong> </font><br> <input
						id="houseName" name="houseName" type="text" class="form-control" placeholder="내용을 입력해주세요." value="">
					<br> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>전체 객실 수</strong> </font><br>
					<div class="row">
						<div class="col-sm-6">
							<input id="houseTotal" name="houseTotal" type="text" class="form-control" placeholder="내용을 입력해주세요."
								size="1px" value="">
						</div>
						<div class="col-sm-6"></div>
					</div>
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>웹 사이트 (선택사항)</strong> </font><br> <input
						id="houseSite" name="houseSite" type="text" class="form-control" placeholder="내용을 입력해주세요."
						value="">
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>연락처 </strong></font><br> <input
						id="housePhone" name="housePhone" type="text" class="form-control" placeholder="내용을 입력해주세요."
						value=""
						>
					<br> <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>게스트하우스 평균 요금</strong> </font><br> <input
						id="housePay" name="housePay" type="text" class="form-control" placeholder="￦/박"
						value="">
					<br><span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>
					<font size="3px" color="blue"><strong>게스트하우스 대표 사진</strong> </font><br> 
					<input type="file" id="picture" name="picture">
					</c:otherwise> 
					</c:choose>
					</form>
				</div>
				
				<div class="col-sm-2 col-sm-push-1"></div>
				<div class="col-sm-7">
				<br><br><br><br><br>
					<div class="rightside">
						<img src="${root}/img/second.jpg" style="width: 90%; height: 70%; opacity:0.8;">
					</div>
				</div>
			</div>
			<div class="col-sm-12">
							<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
				<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
			</div>
		</div>
	</div>
	<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	