<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script type="text/javascript">
$(document).ready(function(){
   $(document).on('click', '.oksign', function(){
	   var sign = $(this).attr('data-sign');
       document.location.href="${root}/house/oksign.gbg?reservationId="+sign;
	   
   });   
   $(document).on('click', '.nosign', function(){
	   var sign = $(this).attr('data-sign');
       document.location.href="${root}/house/nosign.gbg?reservationId="+sign;
	   
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
                                    <td width="12%"><i class="fa fa-hand-o-right"></i>게스트하우스명</td>
                                    <td width="12%"><i class="fa fa-group"></i>객실 총원 수 </td>
                                    <td width="12%"><i class="fa fa-calendar"></i>예약 일자 </td>
                                    <td width="12%"><i class="fa fa-calendar"></i>체크 인 </td>
                                    <td width="12%"><i class="fa fa-calendar"></i>체크 아웃 </td>
                                    <td width="12%"><i class="fa fa-calendar"></i>예약 번호 </td>
                                    <td width="30%"><i class="fa fa-exclamation-circle"></i></td>
                                 </tr>
                              <c:forEach var="hostresinfo" items="${hostresinfo}">
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
                                       <div class="media">
                                           &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.checkIn}
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                           &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.checkOut}
                                       </div>
                                    </td>
                                      <td>
                                       <div class="media">
                                           &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hostresinfo.reservationId}
                                       </div>
                                    </td>
                                    <td>
                                          <input type="button"  data-sign="${hostresinfo.reservationId}" class="btn btn-primary oksign" value="승인">
                                          <input type="button"  data-sign="${hostresinfo.reservationId}" class="btn btn-warning nosign" value="거부">
                                          
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