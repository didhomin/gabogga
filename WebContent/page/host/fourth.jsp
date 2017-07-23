<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	

<style>
.basic {
	margin: 20px;
}
</style>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="30" aria-valuemin="0"
				aria-valuemax="100" style="width: 30%">30%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-5 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>체크인 시작</strong></font> <select
								class="form-control" name="">
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>체크인 마감</strong></font> <select
								class="form-control" name="">
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>체크아웃 시작</strong></font> <select
								class="form-control" name="">
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>체크아웃 마감</strong></font> <select
								class="form-control" name="" >
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>인터넷 이용이
									가능한가요?</strong> </font><br> <select class="form-control" name=""  style="width:100px">
								<option>예.</option>
								<option>아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>주차 이용이
									가능한가요?</strong> </font><br> <select class="form-control" name="" style="width:100px">
								<option>예.</option>
								<option>아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>어린이를 동반할 수
									있나요?</strong> </font><br> <select class="form-control" name="" style="width:100px">
								<option>예.</option>
								<option>아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>반려동물 동반을 허용하시나요?</strong> </font><br> <select class="form-control" name="" style="width:100px">
								<option>예.</option>
								<option>아니오.</option>
							</select>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-6"></div>
				<div class="col-sm-12">
								<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	