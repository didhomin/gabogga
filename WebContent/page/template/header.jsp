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
					<a class="navbar-brand" href=""><strong>가보까?</strong></a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav ">
						<li class=""><a href="">공지사항</a></li>
						<li class=""><a href="">인기순</a></li>
						<li class=""><a href="">가격순</a></li>

					</ul>
					<!--  <form class="navbar-form navbar-right">
			      	<div class="input-group">
				        <input type="text" class="form-control" placeholder="Search">
				        <div class="input-group-btn">
				          <button class="btn btn-default" type="submit">
				            <i class="glyphicon glyphicon-search"></i>
				          </button>
				      	</div>
				    </div>
			    </form> -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">예약하기 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="">내일로</a></li>
								<li><a href="">제주도</a></li>
							</ul></li>

						<li id="loginM"><a href="#"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li id="loginM"><a href="#"><span
								class="glyphicon glyphicon-user"></span> Login</a></li>


					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 70px">
		<div class="row">