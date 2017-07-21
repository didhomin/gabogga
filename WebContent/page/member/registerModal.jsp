<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ModalRegister -->
<div class="modal fade" id="modalRegister" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" style="width:25%;">
		<div class="modal-content">

			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="panel">
							<div>
								<h3>
									Register
									<button class="close" aria-hidden="true" type="button"
										data-dismiss="modal">×</button>
								</h3>
							</div>
							<div class="panel-body">
								<form accept-charset="UTF-8" role="form"  method="post" action="${root }/register.gbg">
									<fieldset>
										<div class="form-group">
											<input class="form-control" id="email"
												placeholder="yourmail@example.com" name="email" type="email" required autofocus>
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="Password"
												name="password" type="password" value="" required>
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="Password-Check"
												name="passwordCheck" type="password" value="" required>
										</div>
										<input class="btn btn-lg btn-success btn-block" type="submit"
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