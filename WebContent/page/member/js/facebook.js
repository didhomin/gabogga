
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
