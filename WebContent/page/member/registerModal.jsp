<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ModalRegister -->
<script type="text/javascript">
var regicount=0;
var passcount=0;
$(document).ready(function() {
	$('#passwordCheck').focusout(function() {	
	var out = '';
	var password = $('#resultpass');
	var pass = $('#password').val();
	var passCheck = $('#passwordCheck').val();
	if(pass.length>8 && pass==passCheck) {
		passcount=0;
		password.empty();
		if(regicount!=1){
			$('#registerBtn').removeAttr('disabled');
		}
	} else {
		out='<font color="red">비밀번호를 확인하세요.<font>';					
		$('#registerBtn').attr('disabled','disabled');
		passcount=1;
	}
		password.empty();
		password.append(out);	
	});
	$('#email').focusout(function() {	
	var email = $(this).val();
	var output = '';
   	var resultView = $('#result');
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/member/emailCheck.gbg',
			data : {'email' : email},
			success : function(data) {
				if(data.count==0) {			
					regicount=0;
					resultView.empty();
					if(passcount!=1) {
						$('#registerBtn').removeAttr('disabled');
					}
				}else {
					output='<font color="red">중복된 이메일입니다.<font>';					
					$('#registerBtn').attr('disabled','disabled');
					regicount=1;
				}
				resultView.empty();
				resultView.append(output);		   
			}
		});
	});
});


</script>
<div class="modal fade" id="modalRegister" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-primary ">
				<div class="panel-heading">
					<h3>
						Register
						<button class="close" aria-hidden="true" type="button"
							data-dismiss="modal">×</button>
					</h3>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel">

							<hr />
							<div class="panel-body">
								<form accept-charset="UTF-8" role="form" method="post"
									action="${root }/member/register.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												class="form-control" id="email"
												placeholder="yourmail@example.com" name="email" type="email"
												required autofocus>

										</div>
										<p class="col-sm-offset-1" id="result"></p>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												class="form-control" id="name"
												placeholder="homin" name="name" type="text"
												required autofocus>

										</div>
										
										<!-- <div class="input-group form-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input class="form-control" id="name"
												placeholder="YangHomin" name="name" type="text" required>
										</div> -->
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password (8자리이상)"
												id="password" name="password" type="password" value=""
												required autofocus>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password-Check"
												id="passwordCheck" name="passwordCheck" type="password"
												value="" required autofocus>
										</div>
										<p class="col-sm-offset-1" id="resultpass"></p>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-heart"></i></span>
											<div class="form-control">
												<input class="" id="gender" name="gender" type="radio"
													value="1" checked> <label>Male</label>     <input
													name="gender" type="radio" value="2"> <label>Female</label>
											</div>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-phone"></i></span> <input
												class="form-control"
												placeholder="Enter your Primary contact no." id="tel"
												name="tel" type="tel" value="" required>
										</div>
									
										<hr />
										<input id="registerBtn"
											class="btn btn-lg btn-primary btn-block" type="submit"
											value="SIGN UP">
									</fieldset>
									<hr />
									<div id="" align="center">
										이미 회원이신가요?! <a href="javascript:mvlogin();">지금 바로 로그인 하세요!</a>
									</div>
								</form>


							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- ModalRegister end-->