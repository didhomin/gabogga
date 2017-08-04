<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ModalLogin -->
<div class="modal fade" id="modalLogin" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-info ">
				<div class="panel-heading">
					<h3>
						Login
						<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
					</h3>
								
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="panel col-sm-12">
						<div class="panel-primary ">
							<div class="panel-body">
								<form class="" accept-charset="UTF-8" role="form" method="post" action="${root }/member/login.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input class="form-control"
												placeholder="yourmail@example.com" name="email" type="email" value="${cookie.kid_sid.value}" required>
										</div>
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password"
												name="password" type="password" value=""  required>
										</div>
										
										<div class="checkbox">
											<label> 
											<c:if test="${not empty cookie.kid_sid }">
												<input name="remember" type="checkbox" value="remember" checked="checked"> Remember Me
											</c:if>
											<c:if test="${empty cookie.kid_sid }">
												<input name="remember" type="checkbox" value="remember"> Remember Me
											</c:if>
											</label>
											<a class="pull-right" href="javascript:passReset();">비밀번호 찾기</a>
										</div>
										<hr/>
										<input class="btn btn-lg btn-info btn-block" type="submit"
											value="Login">
									</fieldset>
								</form>
								<hr />
								<div>
									<div id="" align="center">
										아직 회원가입을 안하셨나요?! <a href="javascript:mvregister();">여기로 오시면 회원가입할수있어요!!</a>
									</div>
									<hr />
									<div align="center">
										다른 계정으로도 로그인하실수있습니다.!
									</div>
									<div class="row" align="center">
										<div class="col-sm-3"></div>
										<div align="center" class="col-sm-6">
											<img src="${root }/page/member/img/facebook.png" onclick="login()" width="75px" />
											<img src="${root }/page/member/img/kakao.png" onclick="loginWithKakao()" />
										</div>
										<div class="col-sm-3"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<form id="snsloginform" method="post" action="" name="snslogin">
<input type="hidden" id="snsname" name="name" value="">
<input type="hidden" id="snsemail" name="email" value="">
</form>
<!-- ModalLogin end -->