<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script type="text/javascript">
$(document).ready(function(){
   
   $('#oksign').click(function(){
      $(location).attr('href', '${root}/house/oksign.gbg').attr('method', 'post').submit();
   });
   
   $('#deny').click(function(){
      $(location).attr('href', '${root}/house/deny.gbg').attr('method', 'post').submit();
   });
   
});
</script>
   
      <section class="content page-top row">
         <div class="col-sm-10 col-sm-push-1">
         <h2>예약 관리</h2>
            <div class="panel panel-default">
               <div class="panel-body">
                  <div class="row" style="padding-bottom:10px;">

                     <div class="col-sm-6 pull-left">
                        <!-- <button type="button" id="newRegisterBtn" class="btn btn-sm btn-primary"><i class="fa fa-angellist"></i>&nbsp;새로운 숙소 추가</button>
                        <button type="button" id="reservationBtn" class="btn btn-sm btn-default"><i class="fa fa-calendar"></i>&nbsp;예약 관리</button> -->
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
                                    <td width="20%"><i class="fa fa-hand-o-right"></i>게스트하우스명</td>
                                    <td width="20%"><i class="fa fa-group"></i>객실 총원 수 </td>
                                    <td width="20%"><i class="fa fa-calendar"></i>예약 일자 </td>
                                    <td width="30%"><i class="fa fa-exclamation-circle"></i></td>
                                 </tr>
                              <c:forEach var="hostresinfo" items="${hostresinfo}">
                                 <%-- <input type="hidden" id="seq${GusethouseDto.groupId}" value="${GusethouseDto.groupId}">
                                 <input type="hidden" id="gCount${GusethouseDto.groupId}" value="${GusethouseDto.gCount}">
                                 <input type="hidden" id="nowCount${GusethouseDto.groupId}" value="${GusethouseDto.nowCount}"> --%>
                                 <tr>
                                    <td>
                                       <div class="media">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.name}
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                           &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.roomCount}
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                           &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.reservationDate}
                                       </div>
                                    </td>
                                    <td>
                                    	<c:choose>
                                   			 <c:when test="${oksign=0 }">
                                          		<button type="button" id="oksign" class="btn btn-primary"><i class="fa fa-wrench"></i>승인</button>
                                           	 </c:when>
                                           	 <c:when test="${oksign=1 }">
                                           	 	<button type="button" id="oksign" class="btn btn-primary"><i class="fa fa-wrench"></i>승인</button>
                                           	 </c:when>
                                    	</c:choose>
                                          <button type="button" id="refuse" class="btn btn-danger"
                                           onclick="javascript:joinGroup();">
                                              <i class="fa fa-remove"></i>거부
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
</body>
</html>