<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/page/template/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <section class="content page-top row">
         <div class="col-sm-10 col-sm-push-1">
         <h2><i class="fa fa-bed" style="font-size:36px"></i>&nbsp;숙소 관리</h2>
            <div class="panel panel-default">
               <div class="panel-body">
                  <div class="row" style="padding-bottom:10px;">

                     <div class="col-sm-6 pull-left">
                        <button type="button" id="create" class="btn btn-sm btn-primary"><i class="fa fa-angellist"></i>&nbsp;새로운 숙소 추가</button>
                        <button type="button" id="accept" class="btn btn-sm btn-default"><i class="fa fa-calendar"></i>&nbsp;예약 관리</button>
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
                                    <td width="10%"><i class="fa fa-group"></i>전체 객실 수 </td>
                                    <td width="20%"><i class="fa fa-github-alt"></i>게스트하우스 관리자</td>
                                 </tr>
                              <c:forEach var="GroupRoomDto" items="${grouplist}">
                                 <input type="hidden" id="seq${GroupRoomDto.groupId}" value="${GroupRoomDto.groupId}">
                                 <input type="hidden" id="gCount${GroupRoomDto.groupId}" value="${GroupRoomDto.gCount}">
                                 <input type="hidden" id="nowCount${GroupRoomDto.groupId}" value="${GroupRoomDto.nowCount}">
                                 <tr>
                                    <td>
                                       <div class="media">
                                          <p class="media-meta">${GroupRoomDto.regDate}</p>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <p class="media-meta" id="majorName${GroupRoomDto.groupId}">${GroupRoomDto.majorName}</p>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <div class="media-meta" id="groupName${GroupRoomDto.groupId}">${GroupRoomDto.groupName}</div>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta" id="content${GroupRoomDto.groupId}">${GroupRoomDto.content}</span>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta">${GroupRoomDto.name}</span>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta">${GroupRoomDto.nowCount} / ${GroupRoomDto.gCount} 명</span>
                                       </div>
                                    </td>
                                    <td>
                                       <p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
                                          <button type="button" id="joinGroup" class="btn btn-danger"
                                           onclick="javascript:joinGroup(${GroupRoomDto.groupId});">
                                              <span class="glyphicon glyphicon-thumbs-up"></span>
                                           </button>
                                        </p>
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