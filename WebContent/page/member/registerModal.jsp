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
			url : '${root}/emailCheck.gbg',
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

			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel">
							<div>
								<h3>
									Register
									<button class="close" aria-hidden="true" type="button"
										data-dismiss="modal">×</button>
								</h3>
							</div>
							<hr/>
							<div class="panel-body">
								<form accept-charset="UTF-8" role="form"  method="post" action="${root }/register.gbg">
									<fieldset>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
											<input class="form-control" id="email"
												placeholder="yourmail@example.com" name="email" type="email" required autofocus>
												
										</div>
										<p class="col-sm-offset-1" id="result"></p>
										<!-- <div class="input-group form-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input class="form-control" id="name"
												placeholder="YangHomin" name="name" type="text" required>
										</div> -->
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password (8자리이상)" id="password"
												name="password" type="password" value="" required>
										</div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input class="form-control" placeholder="Password-Check" id="passwordCheck"
												name="passwordCheck" type="password" value="" required>
										</div>
										<p class="col-sm-offset-1" id="resultpass"></p>
										 <div class="input-group form-group">
								       <span class="input-group-addon"><i class="glyphicon glyphicon-heart"></i></span>
								          	<div class="form-control">
										            <input class="" id="gender" name="gender" type="radio" value="1" checked>
										            <label>Male</label> 
									               
									       
										            <input name="gender" type="radio" value="2" >
										            <label>Female</label>
								          	</div>
								        </div>
										<div class="input-group form-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
											<input class="form-control" placeholder="Enter your Primary contact no."
												id="tel" name="tel" type="tel" value="" required>
										</div>
										<div class="input-group form-group col-sm-offset-2" >
												
										            <div class="form-inline">생년월일
										              <div class="form-group" >
										                <select name="age" class="form-control">
										                  <option  value="0">Year</option>
										                 <c:forEach var="x" begin="1930" end="2000" step="1">
															<option value="${x}" >${x} </option>
																

														</c:forEach>
										                  </select>
										                 <!--  <option value="1955" >1955 </option><option value="1956" >1956 </option><option value="1957" >1957 </option><option value="1958" >1958 </option><option value="1959" >1959 </option><option value="1960" >1960 </option><option value="1961" >1961 </option><option value="1962" >1962 </option><option value="1963" >1963 </option><option value="1964" >1964 </option><option value="1965" >1965 </option><option value="1966" >1966 </option><option value="1967" >1967 </option><option value="1968" >1968 </option><option value="1969" >1969 </option><option value="1970" >1970 </option><option value="1971" >1971 </option><option value="1972" >1972 </option><option value="1973" >1973 </option><option value="1974" >1974 </option><option value="1975" >1975 </option><option value="1976" >1976 </option><option value="1977" >1977 </option><option value="1978" >1978 </option><option value="1979" >1979 </option><option value="1980" >1980 </option><option value="1981" >1981 </option><option value="1982" >1982 </option><option value="1983" >1983 </option><option value="1984" >1984 </option><option value="1985" >1985 </option><option value="1986" >1986 </option><option value="1987" >1987 </option><option value="1988" >1988 </option><option value="1989" >1989 </option><option value="1990" >1990 </option><option value="1991" >1991 </option><option value="1992" >1992 </option><option value="1993" >1993 </option><option value="1994" >1994 </option><option value="1995" >1995 </option><option value="1996" >1996 </option><option value="1997" >1997 </option><option value="1998" >1998 </option><option value="1999" >1999 </option><option value="2000" >2000 </option><option value="2001" >2001 </option><option value="2002" >2002 </option><option value="2003" >2003 </option><option value="2004" >2004 </option><option value="2005" >2005 </option><option value="2006" >2006 </option>                </select>
										              --> </div>
										              <div class="form-group">
										                <select name="mm" class="form-control">
										                  <option value="">Month</option>
										                  <option value="1">1월</option><option value="2">2월</option><option value="3">3월</option><option value="4">4월</option><option value="5">5월</option><option value="6">6월</option><option value="7">7월</option><option value="8">8월</option><option value="9">9월</option><option value="10">10월</option><option value="11">11월</option><option value="12">12월</option>                </select>
										              </div>
										               <div class="form-group">
										                <select name="dd" class="form-control">
										                  <option value="">Date</option>
										                  <option value="1" >1 </option><option value="2" >2 </option><option value="3" >3 </option><option value="4" >4 </option><option value="5" >5 </option><option value="6" >6 </option><option value="7" >7 </option><option value="8" >8 </option><option value="9" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
										              </div>
										            </div>
										</div>
											<hr/>
										<input id="registerBtn" class="btn btn-lg btn-success btn-block" type="submit"
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