
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

function passReset() {
	$('#modalLogin').modal("hide");
	$('#modalPassReset').modal("show");
}
function mvregister() {
	$('#modalLogin').modal("hide");
	modalRegister();
}
function mvlogin() {
	$('#modalRegister').modal("hide");
	modalLogin();
}
function memberModify() {
	$('#modalMemberModify').modal("show");
}
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '796491983864394',
	      status 	 : true,
	      cookie     : true,
	      xfbml      : true,
	      oauth 	 : true,
	      version    : 'v2.8'
	    });
	    FB.AppEvents.logPageView();   
	  };

	  (function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=796491983864394";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
/*	 function api() {
	  FB.api('/me', { locale: 'ko_KR', fields: 'name, email' },
			  function(response) {
		  			alert(response.name+"님 안녕하세요"+response.email);
			  }
			)
	 };
	function login() {
			FB.login();
			 FB.api('/me', { locale: 'ko_KR', fields: 'name, email' },
					  function(response) {
				  			alert(response.name+"님 안녕하세요"+response.email);
					  }
					)
	}*/
	  FB.getLoginStatus(function(response) {
	       if (response.status == 'connected') {
	         getCurrentUserInfo(response)
	       } else {
	         FB.login(function(response) {
	           if (response.authResponse){
	             getCurrentUserInfo(response)
	           } else {
	             console.log('Auth cancelled.')
	           }
	         }, { scope: 'publish_actions' });
	       }
	  });
	     function getCurrentUserInfo() {
	       FB.api('/me', { locale: 'ko_KR', fields: 'name, email' },function(userInfo) {
//	       alert(userInfo.name + ': ' + userInfo.email);
	       document.location.href="/gabogga/member/facebook.gbg?email="+userInfo.email+"&name="+userInfo.name;
	       });
	     }
	 
	    function login() {
	       getCurrentUserInfo();
	        FB.login();     
	   } 
