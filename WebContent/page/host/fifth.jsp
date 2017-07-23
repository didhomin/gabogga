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
				role="progressbar" aria-valuenow="45" aria-valuemin="0"
				aria-valuemax="100" style="width: 45%">45%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<font size="3px" color="black">
					귀하 숙소의 첫번째 객실에 대해 설명해주세요. <br>
					완료 후 다른 객실에 대한 상세 내용을 입력하실 수 있습니다.</font><br><br>
					<div class="row">
						<div class="col-sm-6">
						<font size="3px" color="red">선택하십시오.</font><br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>어떤 유형의 객실을 추가하시겠어요?</strong></font> <select
								class="form-control" name="" >
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
						<div class="col-sm-6">
						<br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>별칭</strong></font> 
							<input type="text" class="form-control" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>해당 이름의 객실이 몇 개인가요?</strong></font> <select
								class="form-control" name="" style="width:100px">
								<option>11:00</option>
								<option>12:00</option>
							</select>
						</div>
						<div class="col-sm-6">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-sm-8">
								<strong>총 객실수:__개</strong>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
						<font size="3px" color="red">침대옵션</font><br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실에는 어떤 종류의 침대가 있습니까?</strong> </font><br> 
								<div class="row">
									<div class="col-sm-3">
										<select class="form-control" name="" style="width:100px">
											<option>예.</option>
											<option>아니오.</option>
										</select>
									</div>
									<div class="col-sm-1">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</div>
									<div class="col-sm-3">
										<select class="form-control" name="" style="width:100px">
											<option>예.</option>
											<option>아니오.</option>
										</select>
									</div>
									<div class="col-sm-5"></div>
								</div>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실에 수용가능한 인원은 몇 명인가요?</strong> </font><br> 
						<input type="text" class="form-control" placeholder="내용을 입력해주세요." style="width:100px">
						</div>
						<div class="col-sm-4"></div>
					</div>
					
					<br><br>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
								<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	