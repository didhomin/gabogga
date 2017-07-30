<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- ModalReservation -->


<div class="modal fade" id="modalReservation" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<span class="glyphicon glyphicon-star">예약정보확인</span>
			</div>
			<div class="modal-body">
				<form name="resrervationform" role="form"  method="post" action="${root}/house/reservation.gbg">					
					 <c:forEach var="room" items="${list }">
					<input type="hidden" name="userId" value="${user.userId }" id="userId">
					<input type="hidden" name="reservationId" value="" id="reservationId">
					<input type="hidden" name="oksign" value="" id="oksign">
					<input type="hidden" name="guesthouseId" value="150" id="guesthouseId">
					<input type="hidden" name="roomId" id="roomId" value="${room.roomId }" >
					</c:forEach>
					<!-- Sign Form -->
					<div class="form-group">
						<label> 이용자 정보 </label> <input type="text" class="form-control"
							name="user" id="user" placeholder="E-mail" >
					</div>
					<label> 휴대폰 </label>
					<div class="form-group">
						<input type="tel" class="form-control" placeholder="연락처"
							name="Tel" id="Tel" value="" maxlength="20">
					</div>
					<label> 객실정보확인 </label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="객실정보확인"
							name="roomInfo" id="roomInfo" value="" maxlength="20" readonly="readonly" class="form-control" style="background-color:#fff">
					</div>
					<label> 객실인원확인 </label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="객실정보확인"
							name="Person" id="Person" value="" maxlength="20" readonly="readonly" class="form-control" style="background-color:#fff">
					</div>
					<div class="form-group">
						<label>입 퇴실 날짜</label> 
						<input type="text"class="form-control" name="checkIn" id="checkIn"
							placeholder="Check-In" readonly="readonly" class="form-control" style="background-color:#fff">
					</div>
					<div class="form-group">
						<input type="text"class="form-control" placeholder="Check-Out" name="checkOut"
							id="checkOut" value="" maxlength="20" readonly="readonly" class="form-control" style="background-color:#fff">
					</div>
					<label>가격</label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="가격"
							name="price" id="price" value="" maxlength="20" readonly="readonly" class="form-control" style="background-color:#fff">
					</div>
					<button type="submit" class="btn btn-block" id="reservationBtn" name="reservationBtn" value="">
						<span class="glyphicon glyphicon-ok"></span> 예약
					</button>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-danger btn-default pull-left"
					data-dismiss="modal">
					<span class="glyphicon glyphicon-remove"></span> 취소
				</button>
			</div>
		</div>
	</div>
</div>


<!-- ModalReservation end-->