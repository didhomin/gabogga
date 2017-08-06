<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>가보까?</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 <script src="${root }/page/member/js/kakao.js"></script>
 <script src="${root }/page/member/js/facebook.js"></script>
 <%@ include file="/WEB-INF/page/member/registerModal.jsp" %>	
 <%@ include file="/WEB-INF/page/member/loginModal.jsp" %>	
 <%@ include file="/WEB-INF/page/member/passReset.jsp" %>	
 <%@ include file="/WEB-INF/page/member/passModify.jsp" %>	
 <%@ include file="/WEB-INF/page/member/memberModify.jsp" %>	
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${root }/index.jsp"><strong><font color="black"><b>가보까?</b></font></strong></a>
				</div>
				
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${empty user }">
							<li class=""><a href="${root }/admin/notice.gbg">도움말</a></li>
						</c:when>
						<c:when test="${user.type==2 }">
	 						<li class=""><a href="${root }/admin/notice.gbg">도움말</a></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">관리자 <strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="${root}/boardadmin/boardmenuadmin.gbg">커뮤니티관리</a></li>
									<li><a href="${root}/memberAdmin/list.gbg?pg=1&bcode=1&key=&word=">회원관리</a></li>
									<li><a href="${root}/admin/statistics.gbg">통계</a></li>
								</ul>
							</li>
							
						</c:when>
						<c:otherwise>
	 						<li class=""><a href="${root }/admin/notice.gbg">도움말</a></li>
	 					</c:otherwise>
						</c:choose>
				</ul>
				
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					
					
					
					<ul class="nav navbar-nav navbar-right">
						
						<c:choose>
						<c:when test="${empty user }">
							<li id="loginM"><a href="javascript:modalLogin();">
								<span class="glyphicon glyphicon-log-in"></span> Login</a>
							</li>
							<li id="loginM"><a href="javascript:modalRegister();">
								<span class="glyphicon glyphicon-user"></span> Register</a>
							</li>
						</c:when>
						<c:when test="${user.type==2 }">
					
							<li><a href="${root}/boardadmin/boardmenu.gbg">커뮤니티</a></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">호스팅하기 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="${root}/host/register.gbg">숙소등록</a></li>
								<li><a href="${root}/manage/list.gbg">숙소관리</a></li>
								<!-- <li class="divider"></li> -->
								<c:if test="${user.host ==1}">
								<li class="divider"></li>
								<li><a href="${root}/house/hostresinfo.gbg">호스트 예약관리</a></li>
								</c:if>
							</ul>
						</li>
							<li class="dropdown">
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span>
							</a>
								<ul class="dropdown-menu">
									<c:if test="${not empty user }">
									<li><a href="${root}/myreservation/userresinfo.gbg?userId=${user.userId}">예약확인</a></li>
									</c:if>
									<li class="divider"></li>
			 						<li><a href="javascript:memberModify();">회원정보수정</a></li>
			 						<li><a href="${root }/member/logout.gbg">로그아웃</a></li>							
	 							</ul>
	 						</li>
						</c:when>
						<c:otherwise>
							<li><a href="${root}/boardadmin/boardmenu.gbg">커뮤니티</a></li>
							<li class="dropdown">
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">호스팅하기 <strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="${root}/host/register.gbg">숙소등록</a></li>
									<li><a href="${root}/manage/list.gbg">숙소관리</a></li>
									<!-- <li class="divider"></li> -->
									<c:if test="${not empty user.host }">
									<li class="divider"></li>
									<li><a href="${root}/house/hostresinfo.gbg">호스트 예약관리</a></li>
									</c:if>
								</ul>
							</li>
							<li class="dropdown">
							<a class="dropdown-toggle" href="#" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"></span>
							</a>
								<ul class="dropdown-menu">
									<c:if test="${not empty user }">
									<li><a href="${root}/myreservation/userresinfo.gbg?userId=${user.userId}">예약확인</a></li>
									</c:if>
									<li class="divider"></li>
	 								<li><a href="javascript:memberModify();">회원정보수정</a></li>
	 								<li><a href="${root }/member/logout.gbg">로그아웃</a></li>
	 							</ul>
	 						</li>
	 					</c:otherwise>
						</c:choose>
	 					
	 					
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 70px">
		<div class="row">