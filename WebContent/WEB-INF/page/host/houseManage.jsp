<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/template/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script type="text/javascript">
$(document).ready(function(){
	
	$('#newRegisterBtn').click(function(){
		$(location).attr('href', '${root}/host/register.gbg');
	});
	
	$('#reservationBtn').click(function(){
		$(location).attr('href', '${root}/host/second.gbg');
	});
	
	$('#mModifyBtn').click(function(){
		$(location).attr('href', '${root}/host/first.gbg');
	});
	
	$('#mDeleteBtn').click(function(){
		$(location).attr('href', '${root}/manage/delete.gbg');
	});
	
	$('#reservationBtn').click(function(){
		$(location).attr('href', '${root}/house/hostresinfo.gbg');
	});
	
});
function viewS(a){
	document.location.href="${root}/house/reservation.gbg?guesthouseId="+a;
}
</script>
   
      <section class="content page-top row">
      <div class="jumbotron" style="">
	<h3>
		<i class="fa fa-wrench" style="font-size:24px"></i>&nbsp;숙소관리
	</h3>
		</div>
         <div class="col-sm-10 col-sm-push-1">
            <div class="panel panel-default">
               <div class="panel-body">
                  <div class="row" style="padding-bottom:10px;">

                     <div class="col-sm-6 pull-left">
                        <button type="button" id="newRegisterBtn" class="btn btn-sm btn-primary"><i class="fa fa-angellist"></i>&nbsp;새로운 숙소 추가</button>
                        <button type="button" id="reservationBtn" class="btn btn-sm btn-default"><i class="fa fa-calendar"></i>&nbsp;예약 관리</button>
                     </div>
                     <div class="row">
                        <div class="form-group form-inline">
                           
                        </div>
                     </div>
                  </div>
                     <div class="row">
                        <div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
                           <table class="table table-filter" id="extable">
                              <tbody>
                                 <tr class="primary" align="center">
                                	 <td width="30%"><i class="fa fa-thumbs-o-up"></i>게스트하우스 대표 사진</td>
                                    <td width="20%"><i class="fa fa-hand-o-right"></i>게스트하우스명</td>
                                    <td width="20%"><i class="fa fa-group"></i>전체 객실 수 </td>
                                    <td width="30%"><i class="fa fa-exclamation-circle"></i></td>
                                 </tr>
                              <c:forEach var="GusethouseDto" items="${manage}">
                                 <%-- <input type="hidden" id="seq${GusethouseDto.groupId}" value="${GusethouseDto.groupId}">
                                 <input type="hidden" id="gCount${GusethouseDto.groupId}" value="${GusethouseDto.gCount}">
                                 <input type="hidden" id="nowCount${GusethouseDto.groupId}" value="${GusethouseDto.nowCount}"> --%>
                                 <tr>
                                    <td>
                                       <div class="media">
                                           &nbsp;&nbsp;&nbsp;&nbsp;<img src="${root}/thumb/${GusethouseDto.picture}">
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                            <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GusethouseDto.name}
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                           <br><br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GusethouseDto.roomCount}
                                       </div>
                                    </td>
                                    <td><br><br>
                                          <button type="button" id="mModifyBtn" class="btn btn-primary"
                                          >
                                             <i class="fa fa-wrench"></i>수정
                                           </button>
                                    
                                          <button type="button" id="mDeleteBtn" class="btn btn-danger"
                                           >
                                              <i class="fa fa-remove"></i>삭제
                                           </button>

                                          <button type="button" id="mViewBtn" class="btn btn-default"
                                           onclick="javascript:viewS('${GusethouseDto.guesthouseId}');">
                                              <i class="fa fa-file-pdf-o"></i>미리보기
                                           </button>
                                       
                                     </td>
                                 </tr>
                              </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
               </div>
         <div align="center" style="clear:both;">
         ${navigator.navigator}
         </div>
         <div class="col-md-6"></div>
            </div>
         </div>
      </section>
<%@ include file="/WEB-INF/page/template/footer.jsp" %>