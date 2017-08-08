<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ModalRegister -->
<script type="text/javascript">

</script>
<div class="modal fade" id="modalhostqna" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-info ">
				<div class="panel-heading">
					<h3>
						답변 메일 보내기
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
								<form class="" method="post" action="${root }/house/hostqna.gbg">
								<input type="hidden" name="useremail" id="useremail" value="">
								<input type="hidden" name="sign" id="sign" value="">
								<input type="hidden" name="reid" id="reid" value="">
	                    <div class="form-group">
	                      <label for="">Subject</label>
	                      <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" value="" readonly="readonly">
	                    </div>
	                    <div class="form-group ">
	                      <label for="">Content</label>
	                     <textarea class="form-control" id="content" name="content" placeholder="Content" rows="10"></textarea> 
	                    </div>
	                    <button type="submit" class="btn btn-info pull-right">Send Mail</button>
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