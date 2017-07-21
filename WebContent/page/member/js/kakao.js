 Kakao.init('c2a4c486c43bbf3785c84e05e29d4c21');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({

	        success: function(authObj) {
	            // 로그인 성공시, API를 호출합니다.
	            Kakao.API.request({
	              url: '/v1/user/me',
	              success: function(res) {
	            	  alert(res.properties.nickname+"님 환영합니다.!!!");
	            	  document.location.href="/gabogga/page/member/register.jsp";
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
	 
