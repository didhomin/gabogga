<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="<%=root%>/css/bootstrap.css" type="text/css"> -->
	<title>가보까?</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
		  		<a class="navbar-brand" href="#"><b>가보까?</b></a>
		  	</div>
		  	<ul class="nav navbar-nav">
	            <li id="noticeM"><a href="#">공지사항</a></li>
	            <li id="noticeM"><a href="#">인기순</a></li>
	            <li id="noticeM"><a href="#">가격순</a></li>
	        </ul>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">예약하기<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a href="#">내일로</a></li>
			            <li><a href="#">제주도</a></li>
			            <li class="divider"></li>
			            <li><a href="#">어디1</a></li>
			            <li class="divider"></li>
			            <li><a href="#">어디2</a></li>
			          </ul>
			        </li>
			    	<li><a href="#">커뮤니티</a></li>
			    	<li id="joinM"><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			    	<li id="loginM"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			    </ul>
			    <form class="navbar-form navbar-right">
			      	<div class="input-group">
				        <input type="text" class="form-control" placeholder="Search">
				        <div class="input-group-btn">
				          <button class="btn btn-default" type="submit">
				            <i class="glyphicon glyphicon-search"></i>
				          </button>
				      	</div>
				    </div>
			    </form>
			</div>
		</div>
	</div>
</nav>

<div class="container" style="margin-top:70px">
	<div class="row">
