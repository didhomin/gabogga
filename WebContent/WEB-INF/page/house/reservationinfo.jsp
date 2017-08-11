<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->

<%@ include file="/page/template/header.jsp"%>
<%@ include file="/page/house/reservationModal.jsp"%>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- 16 KB -->
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	var settings = {
			  "url": "https://kapi.kakao.com/v1/payment/ready",
			  "method": "POST",
			  "dataType": "json",
			  "mimeType":"application/javascript",
			  "headers": {
			    "authorization": "KakaoAK 74e1b61a455e1b4e8e2f35a8b5f9f0ca",
			    "content-type": "application/x-www-form-urlencoded",
			    "cache-control": "no-cache"
			  },
			  "data": {
			    "cid": "TC0ONETIME",
			    "partner_order_id": "partner_order_id",
			    "partner_user_id": "partner_user_id",
			    "item_name": "양호민",
			    "quantity": "1",
			    "total_amount": "100000",
			    "vat_amount": "200",
			    "tax_free_amount": "0",
			    "approval_url": "http://localhost/gabogga/success",
			    "fail_url": "https://127.0.0.1/gabogga/fail",
			    "cancel_url": "https://127.0.0.1/gabogga/cancel"
			  }
			}
	$(".money").click(function() {
		$.ajax(settings).done(function (response) {
		  console.log(response);
		});
	});
   $(document).on('click', '#search', function(){
	   if($('#from').val()=='') {
		   var from='0000-00-00';
	   } else {
			var from = $('#from').val();
	   }
	   if($('#to').val()=='') {
			var to='9999-99-99';
	   } else {
			var to = $('#to').val();
	   }
		document.location.href="${root}/house/userresinfo.gbg?from="+from+"&to="+to;
   });   
});
function page(i) {
	document.location.href="${root}/house/userresinfo.gbg?pg="+i;
};
</script>
<c:if test="${not empty user }">
<div class="jumbotron" style="">
	<h3>
		<i class="fa fa-check-square-o" style="font-size:24px"></i>&nbsp;예약관리
	</h3>
</div>
<div class="row col-sm-12">
	<div class="input-group-sm" align="right">
		<form class="form-inline" role="form" name="searchForm" method="get">
        <div class="form-group input-group-sm">
        	 <span class="">From</span>
          <input id="from" type="date" class="form-control" style="background-color:#fff"/>
        </div>
        <div class="form-group input-group-sm">
          	<span class="">To</span>
	      	<input id="to" type="date"  class="form-control" style="background-color:#fff"/>
        </div>
      	<div class="form-group input-group-sm">
        </div>
        <div class="form-group input-group-sm">
      		 <a href="#" id="search" class="btn btn-info">
             	<span class="glyphicon glyphicon-search"></span> Search 
             </a>
             
        </div>
		</form>
	</div>
</div>     
	<input type="hidden" name="userId" value="${user.userId }" id="userId">
	<div class="container-fluid">
		<div class="row" style="">
			<div class="col-md-12">
				<div class="row" align="center" style="font-size: 20px; padding-top: 20px; padding-bottom: 20px;">
					<div class="col-sm-2 col-sm-offset-1" style="padding-left: 40px;">게스트하우스</div>
						<div class="col-sm-9">
							<div class="col-sm-2">체크인</div>
							<div class="col-sm-2">체크아웃</div>
							<div class="col-sm-2">예약인원</div>
							<div class="col-sm-2">예약상태</div>
							<div class="col-sm-2" style="padding-right: 40px;">예약날짜</div>
						</div>
				</div>  
				<c:forEach var="re" items="${relist }" varStatus="i">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="panel-title" data-toggle="collapse"
								data-parent="#panel-${i.count }"
								href="#panel-element-${i.count }">
							<div class="row" align="center">
								<div class="col-sm-2 col-sm-offset-1">${re.name }</div>
								<div class="col-sm-9">
									<div class="col-sm-2">${re.checkIn }</div>
									<div class="col-sm-2">${re.checkOut }</div>
									<div class="col-sm-2">${re.person }</div>
									<div class="col-sm-2">
										<c:choose>
											<c:when test="${re.oksign eq 0}">대기	</c:when>
											<c:when test="${re.oksign eq 1}">승인</c:when>
											<c:when test="${re.oksign eq 2}">거절</c:when>
										</c:choose></div>
									<div class="col-sm-2">${re.reservationDate }</div>
								</div>
							</div>
								</a>
						</div>
						<div id="panel-element-${i.count }"
							class="panel-collapse collapse">
							<div class="panel-body">
								<%-- 방이름 : ${re.roomName}(${re.roomType}) 주소 : ${re.address1 } ${re.address2 } <br>
							전화번호: ${re.phone } lat: ${re.lat } lng: ${re.lng } 체크인시작 : ${re.checkinStart }  체크인끝 : ${re.checkinEnd }  체크아웃시작 : ${re.checkoutStart }   체크아웃끝 : ${re.checkoutEnd } <br>
							인터넷: ${re.internet } 주차: ${re.park } 애완동물: ${re.pet } 유아: ${re.child } 요금: ${re.housePay } 소개: ${re.introduce } --%>



								<div class="col-sm-5">
									<li>홈페이지 : <a href="https://${re.hwebsite }/">${re.hwebsite }</a></li>
									<li>주소 : ${re.address1 }<br> &nbsp; &nbsp; &nbsp;
										&nbsp; &nbsp; &nbsp; &nbsp; ${re.address2 }
									</li>
									<li>연락처 : ${re.phone }</li>
									<hr>
								</div>
								<div class="col-sm-5">
									<li>체크인 시작시간 : ${re.checkinStart }</li>
									<li>체크인 마감시간 : ${re.checkinEnd }</li>
									<li>체크아웃 시작시간 : ${re.checkoutStart }</li>
									<li>체크아웃 마감시간 : ${re.checkoutEnd }</li>
									<hr>
								</div>

								<div class="col-sm-5">
									<li class="internet">인터넷 : <c:choose>
											<c:when test="${re.internet eq 1}">
										          	있음
										          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<li>주차유무 : <c:choose>
											<c:when test="${re.park eq 1}">
										          	가능
										          </c:when>
											<c:otherwise>
										          	불가능
										          </c:otherwise>
										</c:choose>
										<hr>
								</div>
								<div class="col-sm-5">
									<li>어린이 동반 : <c:choose>
											<c:when test="${re.child eq 1}">
									           	가능
									          </c:when>
											<c:otherwise>
									          	불가능
									          </c:otherwise>
										</c:choose>
									</li>
									<li>반려동물 동반: <c:choose>
											<c:when test="${re.pet eq 1}">
									           	가능
									          </c:when>
											<c:otherwise>
									          	불가능
									          </c:otherwise>
										</c:choose>
									</li>
									<hr/>
									<div class="form-group input-group-sm">
      									 <a href="https://mockup-pg-web.kakao.com/v1/12095248062218ef5859287e3579c5253c7e161a707277ba3dff2a51d8f8b992/info" class="btn btn-info " data-reid=" ${re.reservationId }">
             								결제
          								   </a>
        							</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div align="center">${navigator.navigator}</div>
		</div>
	</div>
</c:if>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp"%>