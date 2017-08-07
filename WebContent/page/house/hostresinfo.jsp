<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<%@ include file="/page/community/logincheck.jsp" %>
<%@ include file="/WEB-INF/page/member/hostqna.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script type="text/javascript">
$(document).ready(function(){
   $(document).on('click', '#search', function(){
	   if($('#from').val()=='') {
		   var from='0000-00-00';
	   } else {
			var from = $('#from').val();
	   }
	   if($('#to').val()=='') {
			var to='9999-99-99';
	   } else {
			var to = $('#to').val();
	   }
		document.location.href="${root}/house/hostresinfo.gbg?from="+from+"&to="+to;
   });   
	$(document).on('click', '#ok', function(){
		var reid = $(this).attr('data-sign');
		var email = $(this).attr('data-email');
		var name = $(this).attr('data-name');
		var room = $(this).attr('data-roomname');
		var house = $(this).attr('data-house');
		var checkin = $(this).attr('data-checkin');
		var checkout = $(this).attr('data-checkout');
		var out = '';
		out +='예약하신' +house+'의 ' + room+'방이 예약이 확정되었습니다\n\n\n';
		out +='즐거운 여행 되세요\n\n\n';
		out +='-----예약정보-----\n';
		out +='체크인 :'+checkin+'\n';
		out +='체크아웃 :'+checkout;
		
		$('#useremail').val(email);
		$('#subject').val(email+'('+name+')님 예약확정 메일입니다');
		$('#reid').val(reid);
		$('#sign').val('ok');
		$('#content').val(out);
		$('#modalhostqna').modal("show");
	}); 
	$(document).on('click', '#cancel', function(){
		var reid = $(this).attr('data-sign');
		var email = $(this).attr('data-email');
		var name = $(this).attr('data-name');
		var room = $(this).attr('data-roomname');
		var house = $(this).attr('data-house');
		var checkin = $(this).attr('data-checkin');
		var checkout = $(this).attr('data-checkout');
		var out = '';
		out +='예약하신' +house+'의 ' + room+'방은 예약이 불가능합니다\n\n\n';
		out +='다른날로 다시 예약해주세요\n\n\n';
		out +='-----예약정보-----\n';
		out +='체크인 :'+checkin+'\n';
		out +='체크아웃 :'+checkout;
		
		$('#useremail').val(email);
		$('#subject').val(email+'('+name+')님 예약문의 답변메일입니다');
		$('#reid').val(reid);
		$('#sign').val('no');
		$('#content').val(out);
		$('#modalhostqna').modal("show");
	}); 
});
</script>
<div class="jumbotron" style="">
	<h3>
		예약관리
	</h3>
</div>
<div class="row col-sm-12">
	<div class="input-group-sm" align="right">
		<form class="form-inline" role="form" name="searchForm" method="get">
        <div class="form-group input-group-sm">
        	 <span class="">From</span>
          <input id="from" type="date" class="form-control" style="background-color:#fff"/>
        </div>
        <div class="form-group input-group-sm">
          	<span class="">To</span>
	      	<input id="to" type="date"  class="form-control" style="background-color:#fff"/>
        </div>
      	<div class="form-group input-group-sm">
        </div>
        <div class="form-group input-group-sm">
      		 <a href="#" id="search" class="btn btn-info">
             	<span class="glyphicon glyphicon-search"></span> Search 
             </a>
             
        </div>
		</form>
	</div>
</div>              
<div class="row">
      <table class="table table-filter" id="extable">
         <tbody>
            <tr class="primary" align="center">
               <td width="20%"><i class="fa fa-hand-o-right"></i>예약방이름</td>
               <td width="15%"><i class="fa fa-group"></i>인원</td>
               <td width="15%"><i class="fa fa-calendar"></i>예약 일</td>
               <td width="15%"><i class="fa fa-calendar"></i>체크 인 </td>
               <td width="15%"><i class="fa fa-calendar"></i>체크 아웃 </td>
               <td width="20%"><i class="fa fa-exclamation-circle"></i></td>
            </tr>
         <c:forEach var="hostresinfo" items="${hostresinfo}">
         <tr>
            <td align="center">
               <div class="media">
                    ${hostresinfo.roomName} 
               </div>
            </td>
            <td align="center">
               <div class="media">
                  ${hostresinfo.roomCount}
               </div>
            </td>
            <td align="center">
               <div class="media">
                   ${hostresinfo.reservationDate}
               </div>
            </td>
              <td align="center">
               <div class="media">
                  ${hostresinfo.checkIn}
               </div>
            </td>
            <td align="center">
               <div class="media">
                 ${hostresinfo.checkOut}
               </div>
            </td>
            
            <td align="center">
                  <c:choose>
                   <c:when test="${hostresinfo.oksign  eq 1}">
                    <input type="button"  data-sign="${hostresinfo.reservationId}" class="btn btn-primary" value="승인완료" disabled="disabled">
                   </c:when>
                   <c:when test="${hostresinfo.oksign  eq 2}">
                    <input type="button"  data-sign="${hostresinfo.reservationId}" class="btn btn-danger" value="거부완료" disabled="disabled">
                   </c:when>
                  <c:otherwise>
                    <a id="ok" href="#" class="btn btn-primary" data-email="${hostresinfo.email }" data-name="${hostresinfo.username }"
                    data-roomname="${hostresinfo.roomName}" data-house="${hostresinfo.name}" data-checkin="${hostresinfo.checkIn}" 
                    data-checkout=" ${hostresinfo.checkOut}" data-sign="${hostresinfo.reservationId}"
                    >승인</a>
                    <a id="cancel" href="#" class="btn btn-info" data-email="${hostresinfo.email }" data-name="${hostresinfo.username }"
                    data-roomname="${hostresinfo.roomName}" data-house="${hostresinfo.name}" data-checkin="${hostresinfo.checkIn}" 
                    data-checkout=" ${hostresinfo.checkOut}" data-sign="${hostresinfo.reservationId}"
                    >거절</a>
                  </c:otherwise>
                  </c:choose>
             </td>
         </tr>
      </c:forEach>
      </tbody>
   </table>
</div>
                        
                  
                     
<%@ include file="/page/template/footer.jsp" %>