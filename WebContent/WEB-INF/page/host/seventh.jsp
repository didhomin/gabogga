<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>	
<script type="text/javascript">
$(document).ready(function(){
	
	if('${host7}'!=null){
		if('${host7.essential}'==1){
			$('input:checkbox[id="chkBox0"]').attr("checked", true);	
		}
		if('${host7.wifi}'==1){
			$('input:checkbox[id="chkBox1"]').attr("checked", true);	
		}
		if('${host7.shampo}'==1){
			$('input:checkbox[id="chkBox2"]').attr("checked", true);	
		}
		if('${host7.drawer}'==1){
			$('input:checkbox[id="chkBox3"]').attr("checked", true);	
		}
		if('${host7.tv}'==1){
			$('input:checkbox[id="chkBox4"]').attr("checked", true);	
		}
		if('${host7.heat}'==1){
			$('input:checkbox[id="chkBox5"]').attr("checked", true);	
		}
		if('${host7.aircondi}'==1){
			$('input:checkbox[id="chkBox6"]').attr("checked", true);	
		}
		if('${host7.breakfast}'==1){
			$('input:checkbox[id="chkBox7"]').attr("checked", true);	
		}
		if('${host7.desk}'==1){
			$('input:checkbox[id="chkBox8"]').attr("checked", true);	
		}
		if('${host7.hairDry}'==1){
			$('input:checkbox[id="chkBox9"]').attr("checked", true);	
		}
		
	}
	
	$('#progressBtn').click(function(){
/* 				
		if($("#chkBox0").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox1").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox2").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox3").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox4").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox5").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox6").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox7").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox8").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		}
		
		if($("#chkBox9").prop("checked")==true){
			$(this).val('1');
		}
		else{
			$(this).val('0');
		} */
	/* $('input:checkbox[class=ckbox[]]:not(checked)').attr("checked", true); */ 
		document.hostform.action = "${root}/host/seventh.gbg";
		document.hostform.submit();
	});
	
	$('#backBtn').click(function(){
		$(location).attr('href', '${root}/host/seventh.gbg');
	});
	
});
</script>
<style>
.basic {
	margin: 20px;
}

</style>
</head>
<body>
	<div class="container">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active"
				role="progressbar" aria-valuenow="90" aria-valuemin="0"
				aria-valuemax="100" style="width: 90%">90%</div>
		</div>
		<div class="basic">

			<div class="row" style="padding-bottom: 50px;">
				<div class="col-sm-8 col-sm-push-1" style="padding-top: 30px;">
					<h2>편의 시설</h2> <br>
					<div class="row">  
						<div class="col-sm-8" style="font-size:17px;">
						<form name="hostform" method="post">
							<label> <input type="checkbox" name="chkBox0" id="chkBox0" value="1"> 필수 품목(수건, 침대시트, 비누, 화장지) </label><br>
							<label> <input type="checkbox" name="chkBox1" id="chkBox1" value="1" class="ckbox"> 무선인터넷 </label><br>
							<label> <input type="checkbox" name="chkBox2" id="chkBox2" value="1" class="ckbox"> 샴푸 </label><br>
							<label> <input type="checkbox" name="chkBox3" id="chkBox3" value="1" class="ckbox"> 옷장/서랍장 </label><br>
							<label> <input type="checkbox" name="chkBox4" id="chkBox4" value="1" class="ckbox"> TV </label><br>
							<label> <input type="checkbox" name="chkBox5" id="chkBox5" value="1" class="ckbox"> 난방 </label><br>
							<label> <input type="checkbox" name="chkBox6" id="chkBox6" value="1" class="ckbox"> 에어컨 </label><br>
							<label> <input type="checkbox" name="chkBox7" id="chkBox7" value="1" class="ckbox"> 조식, 커피, 차 </label><br>
							<label> <input type="checkbox" name="chkBox8" id="chkBox8" value="1" class="ckbox"> 책상 (작업공간) </label><br>
							<label> <input type="checkbox" name="chkBox9" id="chkBox9"value="1" class="ckbox"> 헤어 드라이어 </label><br>
						</form>
						</div>
						<div class="col-sm-4">
						
						</div>
					</div>
					<br>
				</div>
					<br><br>
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