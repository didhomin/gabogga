<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->

<!-- 여기서부터 우리가 꾸미기 -->
<%@ include file="/page/template/header.jsp"%>
<%@ include file="/page/house/reservationModal.jsp"%>

<c:if test="${not empty user }">
	<input type="hidden" name="userId" value="${user.userId }" id="userId">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				
				<c:forEach var="re" items="${relist }" varStatus="i">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse"
							data-parent="#panel-${i.count }" href="#panel-element-${i.count }">${re.name } 체크인:${re.checkIn } 체크아웃:${re.checkOut } 예약인원: ${re.person } 예약상태: ${re.oksign } 예약날짜: ${re.reservationDate }</a>
					</div>
					<div id="panel-element-${i.count }" class="panel-collapse collapse">
						<div class="panel-body">방이름 : ${re.roomName}(${re.roomType}) 주소 : ${re.address1 } ${re.address2 } <br>
							전화번호: ${re.phone } lat: ${re.lat } lng: ${re.lng } 체크인시작 : ${re.checkinStart }  체크인끝 : ${re.checkinEnd }  체크아웃시작 : ${re.checkoutStart }   체크아웃끝 : ${re.checkoutEnd } <br>
							인터넷: ${re.internet } 주차: ${re.park } 애완동물: ${re.pet } 유아: ${re.child } 요금: ${re.housePay } 소개: ${re.introduce }
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:if>









<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp"%>