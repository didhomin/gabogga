<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	
	if('${host4}' != null){
		$("#checkinS").val("${host4.checkinStart}").attr("selected", "selected");
		$("#checkinE").val("${host4.checkinEnd}").attr("selected", "selected");
		$("#checkoutS").val("${host4.checkoutStart}").attr("selected", "selected");
		$("#checkoutE").val("${host4.checkoutEnd}").attr("selected", "selected");
		$("#internet").val("${host4.internet}").attr("selected", "selected");
		$("#park").val("${host4.park}").attr("selected", "selected");
		$("#child").val("${host4.child}").attr("selected", "selected");
		$("#pet").val("${host4.pet}").attr("selected", "selected");
	} 
	$('#progressBtn').click(function(){
		$('#selectTime1').val($("#checkinS option:selected").val());
		$('#selectTime2').val($("#checkinE option:selected").val());
		$('#selectTime3').val($("#checkoutS option:selected").val());
		$('#selectTime4').val($("#checkoutE option:selected").val());
		$('#selectInternet').val($("#internet option:selected").val());
		$('#selectPark').val($("#park option:selected").val());
		$('#selectChild').val($("#child option:selected").val());
		$('#selectPet').val($("#pet option:selected").val());
		
 		document.hostform.action = "${root}/host/fourth.gbg";
		document.hostform.submit();
	});
	
	$('#backBtn').click(function(){
		$(location).attr('href', '${root}/host/fourth.gbg');
	});
	
});
</script>
<style>
.basic {
	margin: 20px;
}
</style>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="45" aria-valuemin="0"
				aria-valuemax="100" style="width: 45%">45%</div>
		</div>
		<div class="basic">
			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-5 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<form name="hostform" method="post">
					<br>
					<div class="row">
						<div class="col-sm-6">
						<input type="hidden" id="selectTime1" name="selectTime1" value="">
						<input type="hidden" id="selectTime2" name="selectTime2" value="">
						<input type="hidden" id="selectTime3" name="selectTime3" value="">
						<input type="hidden" id="selectTime4" name="selectTime4" value="">
						<input type="hidden" id="selectInternet" name="selectInternet" value="">
						<input type="hidden" id="selectChild" name="selectChild" value="">
						<input type="hidden" id="selectPet" name="selectPet" value="">
						<input type="hidden" id="selectPark" name="selectPark" value="">
						<input type="hidden" name="userid" value="${user.userId}">
						
						
							<i class="fa fa-calendar"></i>
							<font size="3px" color="blue"> <strong>체크인 시작</strong></font> 
							<select class="form-control" name="checkinS" id="checkinS">
								<option>07:00</option>
								<option>07:30</option>
								<option>08:00</option>
								<option>08:30</option>
								<option>09:00</option>
								<option>09:30</option>
								<option>10:00</option>
								<option>10:30</option>
								<option>11:00</option>
								<option>11:30</option>
								<option>12:00</option>
								<option>12:30</option>
								<option>13:00</option>
								<option>13:30</option>
								<option>14:00</option>
								<option>14:30</option>
								<option>15:00</option>
								<option>15:30</option>
								<option>16:00</option>
								<option>16:30</option>
								<option>17:00</option>
								<option>17:30</option>
								<option>18:00</option>
								<option>18:30</option>
								<option>19:00</option>
								<option>19:30</option>
								<option>20:00</option>
							</select>
						</div>
						<div class="col-sm-6">
							<i class="fa fa-calendar"></i>
							<font size="3px" color="blue"> <strong>체크인 마감</strong></font> 
							<select class="form-control" name="checkinE" id="checkinE">
								<option>12:00</option>
								<option>12:30</option>
								<option>13:00</option>
								<option>13:30</option>
								<option>14:00</option>
								<option>14:30</option>
								<option>15:00</option>
								<option>15:30</option>
								<option>16:00</option>
								<option>16:30</option>
								<option>17:00</option>
								<option>17:30</option>
								<option>18:00</option>
								<option>18:30</option>
								<option>19:00</option>
								<option>19:30</option>
								<option>20:00</option>
								<option>20:30</option>
								<option>21:00</option>
								<option>21:30</option>
								<option>22:00</option>
								<option>22:30</option>
								<option>23:00</option>
								<option>23:30</option>
								<option>00:00</option>
								
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<i class="fa fa-calendar"></i>
							<font size="3px" color="blue"> <strong>체크아웃 시작</strong></font> 
							<select class="form-control" name="checkoutS" id="checkoutS">
								<option>00:00</option>
								<option>00:30</option>
								<option>01:00</option>
								<option>01:30</option>
								<option>02:00</option>
								<option>02:30</option>
								<option>03:00</option>
								<option>03:30</option>
								<option>04:00</option>
								<option>04:30</option>
								<option>05:00</option>
								<option>05:30</option>
								<option>06:00</option>
								<option>06:30</option>
								<option>07:00</option>
								<option>07:30</option>
								<option>08:00</option>
								<option>08:30</option>
								<option>09:00</option>
								<option>09:30</option>
								<option>10:00</option>
								<option>10:30</option>
								<option>11:00</option>
								<option>11:30</option>
								<option>12:00</option>
								<option>12:30</option>
								<option>13:00</option>
								<option>13:30</option>
								<option>14:00</option>
							</select>
						</div>
						<div class="col-sm-6">
							<i class="fa fa-calendar"></i>
							<font size="3px" color="blue"> <strong>체크아웃 마감</strong></font> <select
								class="form-control" name="checkoutE" id="checkoutE" >
								<option>07:00</option>
								<option>07:30</option>
								<option>08:00</option>
								<option>08:30</option>
								<option>09:00</option>
								<option>09:30</option>
								<option>10:00</option>
								<option>10:30</option>
								<option>11:00</option>
								<option>11:30</option>
								<option>12:00</option>
								<option>12:30</option>
								<option>13:00</option>
								<option>13:30</option>
								<option>14:00</option>
								<option>14:30</option>
								<option>15:00</option>
								<option>15:30</option>
								<option>16:00</option>
								<option>16:30</option>
								<option>17:00</option>
								<option>17:30</option>
								<option>18:00</option>
								<option>18:30</option>
								<option>19:00</option>
								<option>19:30</option>
								<option>20:00</option>
							</select>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-sm-8">
							<i class="fa fa-wifi"></i>
							<font size="3px" color="blue"><strong>인터넷 이용이
									가능한가요?</strong> </font><br>
							<select class="form-control" name="internet" id="internet"  style="width:100px">
								<option value="0">예.</option>
								<option value="1">아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<i class="fa fa-car"></i>
							<font size="3px" color="blue"><strong>주차 이용이
									가능한가요?</strong> </font><br> 
							<select class="form-control" name="park" id="park" style="width:100px">
								<option value="0">예.</option>
								<option value="1">아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<i class="fa fa-reddit-alien"></i>
							<font size="3px" color="blue"><strong>어린이를 동반할 수
									있나요?</strong> </font><br> 
							<select class="form-control" name="child" id="child" style="width:100px">
								<option value="0">예.</option>
								<option value="1">아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<i class="fa fa-github-alt"></i>
							<font size="3px" color="blue"><strong>반려동물 동반을 허용하시나요?</strong> </font><br> 
							<select class="form-control" name="pet" id="pet" style="width:100px">
								<option value="0">예.</option>
								<option value="1">아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br><br>
					</form>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-6"></div>
				<div class="col-sm-12">
				<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
				<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
		</div>
<%@ include file="/page/template/footer.jsp" %>	