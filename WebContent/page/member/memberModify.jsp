<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ModalRegister -->
<script type="text/javascript">
$(document).ready(function() {
	$('#modifyPasswordCheck').focusout(function() {	
	var out = '';
	var password = $('#modifyResultpass');
	var pass = $('#modifyPassword').val();
	var passCheck = $('#modifyPasswordCheck').val();
	if(pass.length>8 && pass==passCheck) {
		passcount=0;
		password.empty();
		if(regicount!=1){
			$('#modifyBtn').removeAttr('disabled');
		}
	} else {
		out='<font color="red">비밀번호를 확인하세요.<font>';					
		$('#modifyBtn').attr('disabled','disabled');
		passcount=1;
	}
		password.empty();
		password.append(out);	
	});
});
</script>
<div class="modal fade" id="modalMemberModify" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-success ">
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
									action= "${root }/member/modify.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												class="form-control" id="email" value="${user.email }"
												placeholder="yourmail@example.com" name="email" type="email"
												readonly="readonly">

										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												class="form-control" id="name" value="${user.name }"
												name="name" type="text">

										</div>
										<p class="col-sm-offset-1" id="result"></p>
									
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password (8자리이상)"
												id="modifyPassword" name="password" type="password" value=""
												required>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password-Check"
												id="modifyPasswordCheck" name="passwordCheck" type="password"
												value="" required>
										</div>
										<p class="col-sm-offset-1" id="modifyResultpass"></p>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-heart"></i></span>
											<div class="form-control">
												<c:choose>
													<c:when test="${user.gender eq 1}">
														<input class="" id="gender" name="gender" type="radio"
														value="1" checked>
														<label>Male</label> 
														<input name="gender" type="radio" value="2">
														<label>Female</label>
													</c:when>
													<c:otherwise>
														<input class="" id="gender" name="gender" type="radio"
														value="1" >
														<label>Male</label> 
														<input name="gender" type="radio" value="2" checked>
														<label>Female</label>
													</c:otherwise>
												</c:choose>
													
											</div>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-phone"></i></span> <input
												class="form-control"
												placeholder="Enter your Primary contact no." id="tel"
												name="tel" type="tel" value="${user.tel}" required>
										</div>
									
										<hr />
										<input id="modifyBtn"
											class="btn btn-lg btn-success btn-block" type="submit"
											value="SIGN UP">
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