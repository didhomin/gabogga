<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ModalLogin -->
<div class="modal fade" id="modalLogin" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel">
							<div>
								<h3>
									Login
									<button class="close" aria-hidden="true" type="button"
										data-dismiss="modal">×</button>
								</h3>
							</div>
							<div class="panel-body">
								<form class="" accept-charset="UTF-8" role="form" method="post" action="">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input class="form-control"
												placeholder="yourmail@example.com" name="email" type="email" required>
										</div>
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password"
												name="password" type="password" value=""  required>
										</div>
										<div class="checkbox">
											<label> <input name="remember" type="checkbox"
												value="Remember Me"> Remember Me
											</label>
										</div>
										<input class="btn btn-lg btn-success btn-block" type="submit"
											value="Login">
									</fieldset>
								</form>
								<hr />
								<div>
									<div align="center">
										아직 회원가입을 안하셨나요?! <a href="javascript:register();" class="">지금 가입하세요!!</a>
									</div>
									<hr />
									<div align="center">
										다른 계정으로도 로그인하실수있습니다.!
									</div>
									<div class="row" align="center">
										<div class="col-md-3"></div>
										<div align="center" class="col-md-3">
											<img src="${root }/page/member/img/facebook.png" onclick="login()" width="75px" />
										</div>
										<div align="center" class="col-md-3">
											<img src="${root }/page//member/img/kakao.png" onclick="loginWithKakao()" />
										</div>
										<div class="col-md-3"></div>
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
<!-- ModalLogin end -->