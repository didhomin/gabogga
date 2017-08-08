 Kakao.init('c2a4c486c43bbf3785c84e05e29d4c21');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({

	        success: function(authObj) {
	            // 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
	              url: '/v1/user/me',
	              success: function(res) {
//	            	   document.write(res.properties.nickname+"님 환영합니다. email:"+res.kaccount_email);
//	            	  document.location.href="/gabogga/member/kakao.gbg?email="+res.kaccount_email+"&name="+res.properties.nickname;
	            	   $('#snsloginform').attr('action','/gabogga/member/kakao.gbg');
	    	    	   $('#snsname').val(res.properties.nickname);
	    	    	   $('#snsemail').val(res.kaccount_email);
	    				$('form[name=snslogin]').submit();
	              }
	              
	            });
	          }
	          
	      });
	    };
	  //]]>
	   function kakaologout() {
			Kakao.Auth.logout();   
	   }
	  
	 
