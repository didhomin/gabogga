<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="modalPassReset" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-warning ">
				<div class="panel-heading">
					<h3>
						Password Reset
						<button class="close" aria-hidden="true" type="button"
							data-dismiss="modal">×</button>
					</h3>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel">
							<div class="panel-body">
								<font size="5">비밀번호를 잊어버리셨나요?</font><br>
								비밀 번호 변경 절차를 위해 이메일 주소를 입력해주세요.<br>
								임시 비밀번호가 해당 이메일로 발송됩니다.<br>
								<hr/>
								<form accept-charset="UTF-8" role="form"  method="post" action="${root }/member/passReset.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
											<input class="form-control" id="email"
												placeholder="yourmail@example.com" name="email" type="email" required autofocus>
										</div>
										<hr/>	
										<input class="btn btn-lg btn-warning btn-block" type="submit"
											value="Pass Reset">
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