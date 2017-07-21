<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ModalLogin -->
<div class="modal fade" id="modalLogin" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" style="width:25%;">
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
								<form accept-charset="UTF-8" role="form" method="post" action="">
									<fieldset>
										<div class="form-group">
											<input class="form-control"
												placeholder="yourmail@example.com" name="email" type="email" required>
										</div>
										<div class="form-group">
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

								<input class="btn btn-lg btn-register btn-block" type="submit"
									value="Register"> 
								<center>
									<img src="${root }/page/member/img/facebook.png" onclick="login()" width="75px" />
									<img src="${root }/page//member/img/kakao.png" onclick="loginWithKakao()" />
								</center>
							
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- ModalLogin end -->