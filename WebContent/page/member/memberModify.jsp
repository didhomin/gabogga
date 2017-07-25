<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
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
<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-user"></i>회원정보수정
	</h3>
</div>
<hr/>
	<div class="row">
                <div class="col-sm-7 col-sm-offset-1">
                  <form accept-charset="UTF-8" role="form" method="post"
									action="${root }/member/passModify.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password (8자리이상)"
												id="passwordModi" name="passwordModi" type="password"
												value="" required>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input
												class="form-control" placeholder="Password-Check"
												id="passModi" name="passModi" type="password" value=""
												required>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-phone"></i></span> <input
												class="form-control"
												placeholder="Enter your Primary contact no." id="tel"
												name="tel" type="tel" value="" required>
										</div>
										<p class="col-sm-offset-1" id="resultpassModi"></p>
										<hr />
										<input id="modifyBtn" class="btn btn-lg btn-danger btn-block"
											type="submit" value="Password modify">
											
									</fieldset>
								</form>
                  </div>
	</div>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	