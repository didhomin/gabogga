<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script type="text/javascript">
$(document).ready(function(){
	
	if(${ host5.roomType != null }){
		$("#roomType").val("${host5.roomType}").attr("selected", "selected");
		$("#roomNum").val("${host5.roomNum}").attr("selected", "selected");
		$("#bedType").val("${host5.bedType}").attr("selected", "selected");
		$("#bedNum").val("${host5.bedNum}").attr("selected", "selected");

	}
	
	$('#progressBtn').click(function(){
		$('#select1').val($("#roomType option:selected").val());
		$('#select2').val($("#roomNum option:selected").val());
		$('#select3').val($("#bedType option:selected").val());
		$('#select4').val($("#bedNum option:selected").val());
		if(document.getElementById("roomAlias").value == ""){
			alert("별칭 입력!");
			return;
		} else if(document.getElementById("roomPerson").value == ""){
			alert("수용가능한 인원 입력!");
			return;
		}else{
		document.hostform.action = "${root}/host/fifth.gbg";
		document.hostform.submit();
		}
	});
	 
	$('#backBtn').click(function(){ 
		$(location).attr('href', '${root}/host/fifth.gbg');
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
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<form name="hostform" method="post">
						<input type="hidden" id="select1" name="select1" value="">
						<input type="hidden" id="select2" name="select2" value="">
						<input type="hidden" id="select3" name="select3" value="">
						<input type="hidden" id="select4" name="select4" value="">
						<input type="hidden" name="userid" value="${user.userId}">
						
					<font size="3px" color="black">
					귀하 숙소의 첫번째 객실에 대해 설명해주세요. <br>
					완료 후 다른 객실에 대한 상세 내용을 입력하실 수 있습니다.</font><br><br>
					<div class="row">
						<div class="col-sm-6">
						<font size="3px" color="red">선택하십시오.</font><br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>어떤 유형의 객실을 추가하시겠어요?</strong></font> 
							<select class="form-control" name="roomType" id="roomType" >
								<option>싱글룸</option>
								<option>더블룸</option>
								<option>트윈룸</option>
								<option>트윈/더블룸</option>
								<option>트리플룸</option>
								<option>콰드러플룸</option>
								<option>패밀리룸</option>
								<option>도미토리룸</option>
								<option>도미토리룸 내 침대</option>
							</select>
						</div>
						<div class="col-sm-6">
						<br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>별칭</strong></font> 
							<c:choose>
							<c:when test="${host5.roomName != null }">
							<input type="text" name="roomAlias" id="roomAlias"  class="form-control" placeholder="내용을 입력해주세요."  value="${host5.roomName}">
							</c:when>
							<c:otherwise>
							<input type="text" name="roomAlias" id="roomAlias"  class="form-control" placeholder="내용을 입력해주세요.">
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>해당 이름의 객실이 몇 개인가요?</strong></font> 
							<select class="form-control" name="roomNum" id="roomNum" style="width:100px">
								<c:forEach var="i" begin="1" end="${host21.houseTotal}" step="1">
									<option>${i}</option>
								</c:forEach>
								
							</select>
						</div>
						<div class="col-sm-6">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-sm-8">
								<strong>총 객실수:${host21.houseTotal}개</strong>
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
									<div class="col-sm-4">
										<select class="form-control" name="bedType" id="bedType" style="width:150px">
											<option>싱글침대</option>
											<option>더블침대</option>
											<option>대형침대(킹사이즈)</option>
											<option>초대형 더블침대</option>
											<option>이층침대</option>
											<option>침대 겸용 소파</option>
											<option>요이불세트</option>
										</select>
									</div>
									<div class="col-sm-1">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</div>
									<div class="col-sm-3">
										<select class="form-control" name="bedNum" id="bedNum" style="width:100px">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
											<option>11</option>
											<option>12</option>
											<option>13</option>
											<option>14</option>
											<option>15</option>
											<option>16</option>
											<option>17</option>
											<option>18</option>
											<option>19</option>
											<option>20</option>
										</select>
									</div>
									<div class="col-sm-4"></div>
								</div>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실에 수용가능한 인원은 몇 명인가요?</strong> </font><br>
							<c:choose>
							<c:when test="${host5.bedCapacity != null }">
							<input type="text" name="roomPerson" id="roomPerson"  class="form-control" placeholder="몇명?"  value="${host5.bedCapacity}">
							</c:when>
							<c:otherwise>
						<input type="text" name="roomPerson" id="roomPerson" class="form-control" placeholder="몇명?" style="width:100px">
							</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-4"></div>
					</div>
					
					<br><br>
					</form>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
								<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	