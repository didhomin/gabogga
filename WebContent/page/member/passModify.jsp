<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#passModi').focusout(function() {	
	var out = '';
	var result = $('#resultpassModi');
	var pass = $('#passwordModi').val();
	var passCheck = $('#passModi').val();
	if(pass.length>8 && pass==passCheck) {
		result.empty();
		$('#modifyBtn').removeAttr('disabled');
	} else {
		out='<font color="red">비밀번호를 확인하세요.<font>';					
		$('#modifyBtn').attr('disabled','disabled');
	}
		result.empty();
		result.append(out);	
	});
});
</script>
<div class="modal fade" id="modalPassModify" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel">
							<div>
								<h3>
									Password Modify
									
								</h3>
							</div>
							<hr/>
							<div class="panel-body">
								
								임시비밀번호로 로그인하셨습니다.<br>
								비밀번호 변경 하십시오.<br>
								<hr/>
								<form accept-charset="UTF-8" role="form"  method="post" action="${root }/passModify.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password (8자리이상)" id="passwordModi"
												name="passwordModi" type="password" value="" required>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password-Check" id="passModi"
												name="passModi" type="password" value="" required>
										</div>
										<p class="col-md-offset-1" id="resultpassModi"></p>
										<hr/>	
										<input id="modifyBtn" class="btn btn-lg btn-success btn-block" type="submit"
											value="Password modify">
									</fieldset>
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