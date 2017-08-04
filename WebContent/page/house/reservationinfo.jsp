<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->

<!-- 여기서부터 우리가 꾸미기 -->
<%@ include file="/page/template/header.jsp"%>
<%@ include file="/page/house/reservationModal.jsp"%>

<c:if test="${not empty user }">
<input type="hidden" name="userId" value="${user.userId }" id="userId">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable" id="tabs-427284">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-393602" data-toggle="tab">호스트</a>
						</li>
						<li><a href="#panel-80252" data-toggle="tab">고객</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-393602">
							<div class="panel-group" id="panel-274780">
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="panel-title" data-toggle="collapse"
											data-parent="#panel-274780" href="#panel-element-584644">
											${reservation.name } </a>
									</div>
									<div id="panel-element-584644"
										class="panel-collapse collapse in">
										<div class="panel-body">Anim pariatur cliche...</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="panel-title" data-toggle="collapse"
											data-parent="#panel-274780" href="#panel-element-206792">
											Collapsible Group Item #2</a>
									</div>
									<div id="panel-element-206792" class="panel-collapse collapse">
										<div class="panel-body">Anim pariatur cliche...</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-group" id="panel-500114">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-500114" href="#panel-element-812364">Collapsible Group Item #1</a>
					</div>
					<div id="panel-element-812364" class="panel-collapse collapse in">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-500114" href="#panel-element-891842">Collapsible Group Item #2</a>
					</div>
					<div id="panel-element-891842" class="panel-collapse collapse">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
			</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</c:if>
	
	
	
	
	
	
	
	
	
	<!-- 여기까지가 우리가 꾸밀부분 -->
	<!-- 푸터 -->
	<%@ include file="/page/template/footer.jsp"%>