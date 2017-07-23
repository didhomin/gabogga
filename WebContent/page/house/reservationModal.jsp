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
				<form name="joinform" method="post" action="">
					<input type="hidden" name="act" value="register">

					<!-- Sign Form -->
					<div class="form-group">
						<label> 이용자 정보 </label> <input type="text" class="form-control"
							name="signid" id="signid" placeholder="E-mail"
							onkeyup="javascript:idcheck();">
						<div id="idresult"></div>
					</div>
					<label> 휴대폰 </label>
					<div class="form-group">
						<input type="tel" class="form-control" placeholder="연락처"
							name="phone" id="phone" value="" maxlength="20">
					</div>
					<div class="form-group">
						<label>입 퇴실 날짜</label> 
						<input type="password"class="form-control" name="signpass" id="signpass"
							placeholder="Check-In">
					</div>
					<div class="form-group">
						<input type="password"class="form-control" placeholder="Check-Out" name="signpasscheck"
							id="signpasscheck" value="" maxlength="20"
							onkeyup="javascript:passwordCheck();">
						<div id="passresult"></div>
					</div>
					<label>인원</label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="인원"
							name="address1" id="address1" value="" maxlength="20">
					</div>
					<label>가격</label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="가격"
							name="address1" id="address1" value="" maxlength="20">
					</div>
					<button type="submit" class="btn btn-block">
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