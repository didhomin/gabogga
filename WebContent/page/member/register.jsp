<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기 -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function modalLogin() {
		$('#modalLogin').modal({
			show : true
		});
	}

	function modalRegister() {
		$('#modalRegister').modal({
			show : true
		});
	}
	
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '796491983864394',
	      status 	 : true,
	      cookie     : false,
	      xfbml      : true,
	      version    : 'v2.8'
	    });
	    FB.AppEvents.logPageView();   
	    FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
			    console.log('Logged in.');
			    FB.logout();
			   
			  }
			});
	  };

	  (function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=796491983864394";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	  
	  var finished_rendering = function() {
	  console.log("finished rendering plugins");
	  var spinner = document.getElementById("spinner");
	  spinner.removeAttribute("style");
	  spinner.removeChild(spinner.childNodes[0]);
	  }
	  FB.Event.subscribe('xfbml.render', finished_rendering);
	function login() {
		  FB.getLoginStatus();
		  FB.login();	  
	}
	  </script>
	  
	  
	  <script type="text/javascript">
	    Kakao.init('c2a4c486c43bbf3785c84e05e29d4c21');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({

	        success: function(authObj) {
	            // 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
	              url: '/v1/user/me',
	              success: function(res) {
	 //               alert(JSON.stringify(res));
	               // document.write(res.properties.nickname+"님 환영합니다. email:"+res.kaccount_email);
	              },
	              fail: function(error) {
	                alert(JSON.stringify(error));
	              }
	            });
	          },
	          fail: function(err) {
	            alert(JSON.stringify(err));
	          }
	      });
	    };
	  //]]>
	   function kakaologout() {
			Kakao.Auth.logout()	   
	   }
	 
</script>
<div style="margin-top: 50px;">
	<a href="javascript:modalLogin();">로그인</a>
	 <font color="red">로그인되었습니다!!</font>
	     <br><a href="javascript:kakaologout();">카카오로그아웃</a>
    <br><a href="javascript:FB.logout();">페북로그아웃</a>
	    
</div>

<div style="margin-top: 50px;">
	<a href="javascript:modalRegister();">회원가입</a>
</div>


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
									<img src="/tmap/img/facebook-ios-logo.png" onclick="login()" width="75px" />
									<img src="/tmap/img/kakaolink_btn_medium.png" onclick="loginWithKakao()" />
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
								<form accept-charset="UTF-8" role="form"  method="post" action="/tmap/tt">
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
	
	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	