<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script type="text/javascript">
$(document).ready(function(){
	
	var step = 0;
	
	$('#progressBtn').click(function(){
		if('${total}' !=0){
			alert("아직 ${total}개 객실 추가가 완료되지 않았습니다. 숙소관리에서 수정해주세요.");
			
		}
		document.hostform.action = "${root}/host/sixth.gbg";
		document.hostform.submit();
		
	});
	
	$(document).on('click','#plusBtn2',function() {
	      if(step < 4){
	         step++;
	         $('<div id="mapPlusD" class="col-sm-8">').append('<input type="hidden" name="picture" id="picture'+step+'" value="">').append('<input type="file" id="picture'+step+'" name="picture">').appendTo('#mapPlusDiv');
	      }
	   });

	$(document).on('click', '.minusBtn', function() {
		      if(step > 0){
		         $('#mapPlusD').remove();
		         step--;
		      }
		});
	
	$('#registerBtn1').click(function(){
		window.location.reload();
	});
	
	$('#backBtn').click(function(){
		$(location).attr('href', '${root}/host/sixth.gbg');
	});
	
	$('.delete').click(function(){
		$(location).attr('href', '${root}/host/sixthdelete.gbg?act='+$(this).attr('data-set'));
	});
	
	$('.modify').click(function(){
		$(location).attr('href', '${root}/host/sixthmodify.gbg?act='+$(this).attr('data-set'));
	});
	
	$('#progressBtnmodal').click(function(){
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
		}else if(document.getElementById("roomPay").value == ""){
			alert("기본요금 입력!");
			return;
		}else{
		document.hostform.action = "${root}/host/sixthmodal.gbg";
		document.hostform.submit();
		
		}
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
				role="progressbar" aria-valuenow="75" aria-valuemin="0"
				aria-valuemax="100" style="width: 75%">75%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-12 col-sm-push-1" style="padding-top: 30px;">
					<h2>객실 설정</h2> <br>
					<font size="3px" color="black">
					귀하의 객실 등록 현황</font><br><br>
					<div class="row" id="total">
					<div id="card2">
					<c:forEach var="hostroom1" items="${hostroom}">
						<div id="card" class="col-sm-8"style="padding:20px; border:1px solid #ededed; box-shadow:1px 1px 0 rgba(0,0,0, .2);">
					${hostroom1.roomName} (객실 별칭)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 유형의 객실 수 :${hostroom1.roomNum}

 						<button id="deleteBtn" type="button" class="delete btn btn-danger pull-right" data-set="${hostroom1.roomId}">삭제</button>
 						<button id="modifyBtn" type="button" class="modify btn btn-warning pull-right" data-set="${hostroom1.roomId}">수정</button>
 						
 						</div>
 						
					</c:forEach>
					<br><br><br>
						</div>
						<br><br><br>
						<div class="col-sm-12" style="align:center">
												<c:set var="totals" value="${host21.houseTotal}" scope="session"/>
						<c:forEach var="i" items="${hostroom}" >
						<c:set var="total" value="${totals=totals-i.roomNum}" scope="session" />
						</c:forEach>
						<br><br><br>
								<font color="red"><strong>남은 객실수:${total}개</strong></font>
						<br>
						 <button id="plusBtn" name="plusBtn" type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal">+ 다른 객실 타입 추가</button>
						<br><br>
						 객실 등록을 확정 하시겠습니까?
					<button id="registerBtn1" type="button" class="btn btn-success btn-lg">확정</button>
						</div>
					</div>
					<br>
				</div>
					<br><br>
				</div>
				<div class="col-sm-12">
								<button id="backBtn" type="button" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">뒤로</span></button>
					<br><br>
					<button id="progressBtn" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
			
			<!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">다른 객실 타입 추가</h4>
        </div>
        <div class="modal-body">
          <div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>추가 객실 설정</h2> <br>
					<form name="hostform" method="post" enctype="multipart/form-data">
						<input type="hidden" id="select1" name="select1" value="">
						<input type="hidden" id="select2" name="select2" value="">
						<input type="hidden" id="select3" name="select3" value="">
						<input type="hidden" id="select4" name="select4" value="">
						<input type="hidden" name="userid" value="${user.userId}">
					<font size="3px" color="black">
					귀하 숙소의 첫번째 객실에 대해 설명해주세요. <br>
					완료 후 다른 객실에 대한 상세 내용을 입력하실 수 있습니다.</font><br><br>
					<div class="row">
						<div class="col-sm-7">
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
						<div class="col-sm-5">
						<br>
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"> <strong>별칭</strong></font> 
							<input type="text" name="roomAlias" id="roomAlias"  class="form-control" placeholder="내용을 입력해주세요.">

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
						<c:set var="totals" value="${host21.houseTotal}" scope="session"/>
						<c:forEach var="i" items="${hostroom}" >
						<c:set var="total" value="${totals=totals-i.roomNum}" scope="session" />
						</c:forEach>
								<strong>남은 객실수:${total}개</strong>
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
									<div class="col-sm-5">
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
									<div class="col-sm-3"></div>
								</div>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실에 수용가능한 인원은 몇 명인가요?</strong> </font><br>
						<input type="text" name="roomPerson" id="roomPerson" class="form-control" placeholder="몇명?" style="width:100px">

						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-8">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실의 기본 요금은 얼마 인가요?</strong> </font><br>
						<input type="text" name="roomPay" id="roomPay" class="form-control" placeholder="￦/박" style="width:100px">
	
						</div>
						<div class="col-sm-4"></div>
					</div>
					<br>
					<div class="row">
					<div id="mapPlusDiv">
						<div class="col-sm-10">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							<font size="3px" color="blue"><strong>이 객실 사진을 등록해주세요.(최대 5개)</strong></font>	
				 		 <button type="button" id="plusBtn2" class="btn btn-warning btn-sm">추가</button>
	             	     <button type="button" class="minusBtn btn btn-danger btn-sm">삭제</button>	
							<input type="file" id="picture0" name="picture">
						</div>
						<div class="col-sm-2"></div>
					</div>
					</div>
					<br><br>
					</form>
				</div>
				<div class="col-sm-1 col-sm-push-1"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-12">
					<br><br>
					<button id="progressBtnmodal" type="button" class="btn btn-primary btn-lg btn-block">진행</button>
				</div>
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
		</div>
		<br><br><br>
<%@ include file="/page/template/footer.jsp" %>	