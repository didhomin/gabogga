<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<c:forEach var="room" items="${room }">
예약완료<br>
체크 인  : ${house.checkIn }<br>
체크 아웃: ${house.checkOut }<br>
예약일자 : ${house.reservationDate }<br>
예약 인원 : ${house.person }<br>
Room Id : ${room.roomId }<br>
<%-- Reservation Id : ${house.reservationId }<br> --%>
<a href="${root }/index.jsp">메인화면</a>
</c:forEach>
</center>
</body>
</html>