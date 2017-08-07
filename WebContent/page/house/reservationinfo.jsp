<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->

<!-- 여기서부터 우리가 꾸미기 -->
<%@ include file="/page/template/header.jsp"%>
<%@ include file="/page/house/reservationModal.jsp"%>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- 16 KB -->
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

<c:if test="${not empty user }">
	<input type="hidden" name="userId" value="${user.userId }" id="userId">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<c:forEach var="re" items="${relist }" varStatus="i">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="panel-title" data-toggle="collapse"
								data-parent="#panel-${i.count }"
								href="#panel-element-${i.count }">${re.name }
								체크인:${re.checkIn } 체크아웃:${re.checkOut } 예약인원: ${re.person }
								예약상태: ${re.oksign } 예약날짜: ${re.reservationDate }</a>
						</div>
						<div id="panel-element-${i.count }"
							class="panel-collapse collapse">
							<div class="panel-body">
								<%-- 방이름 : ${re.roomName}(${re.roomType}) 주소 : ${re.address1 } ${re.address2 } <br>
							전화번호: ${re.phone } lat: ${re.lat } lng: ${re.lng } 체크인시작 : ${re.checkinStart }  체크인끝 : ${re.checkinEnd }  체크아웃시작 : ${re.checkoutStart }   체크아웃끝 : ${re.checkoutEnd } <br>
							인터넷: ${re.internet } 주차: ${re.park } 애완동물: ${re.pet } 유아: ${re.child } 요금: ${re.housePay } 소개: ${re.introduce } --%>



								<div class="col-sm-5">
									<li>홈페이지 : <a href="https://${re.hwebsite }/">${re.hwebsite }</a></li>
									<li>주소 : ${re.address1 }<br> &nbsp; &nbsp; &nbsp;
										&nbsp; &nbsp; &nbsp; &nbsp; ${re.address2 }
									</li>
									<li>연락처 : ${re.phone }</li>
									<hr>
								</div>
								<div class="col-sm-5">
									<li>체크인 시작시간 : ${re.checkinStart }</li>
									<li>체크인 마감시간 : ${re.checkinEnd }</li>
									<li>체크아웃 시작시간 : ${re.checkoutStart }</li>
									<li>체크아웃 마감시간 : ${re.checkoutEnd }</li>
									<hr>
								</div>

								<%-- <div class="col-sm-2">
									<h4>
										<label>시설</label>
									</h4>
								</div>
								<div class="col-sm-5">
									<li class="internet">인터넷 : <c:choose>
											<c:when test="${re.internet eq 1}">
										          	있음
										          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<li>주차유무 : <c:choose>
											<c:when test="${re.park eq 1}">
										          	가능
										          </c:when>
											<c:otherwise>
										          	불가능
										          </c:otherwise>
										</c:choose>
										<hr>
								</div>
								<div class="col-sm-5">
									<li>어린이 동반 : <c:choose>
											<c:when test="${re.child eq 1}">
									           	가능
									          </c:when>
											<c:otherwise>
									          	불가능
									          </c:otherwise>
										</c:choose>
									</li>
									<li>반려동물 동반: <c:choose>
											<c:when test="${re.pet eq 1}">
									           	가능
									          </c:when>
											<c:otherwise>
									          	불가능
									          </c:otherwise>
										</c:choose>
									</li>
									<hr>
								</div>
								
								<div class="col-sm-2">
									<h4>
										<label>편의시설</label>
									</h4>
								</div>
								<div class="col-sm-5">
									<li>와이파이 : <c:choose>
											<c:when test="${re.wifi eq 1 }">
									          	있음
									          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<li>샴푸 : <c:choose>
											<c:when test="${re.shampo eq 1 }">
									          	있음
									          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<hr>
								</div>
								<div class="col-sm-5">
									<li>서랍장 : <c:choose>
											<c:when test="${re.drawer eq 1 }">
									          	있음
									          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<li>TV: <c:choose>
											<c:when test="${re.tv eq 1 }">
									          	있음
									          </c:when>
											<c:otherwise>
									          	없음
									          </c:otherwise>
										</c:choose>
									</li>
									<hr>
								</div> --%>
								
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:if>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp"%>