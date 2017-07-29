<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-bell"></i>문의사항
	</h3>
</div>
	<div>
	서비스 이용 중 문제가 발생했거나 건의할 사항이 있으신가요? 저희에게 이야기를 들려주세요.
	<hr/>
	</div>
	<div class="row">
                <div class="col-sm-7 col-sm-offset-2">
                  <c:choose>
                  <c:when test="${not empty user }">
	                  <form class="" method="post" action="${root }/admin/qna.gbg">
	                    <div class="form-group">
	                      <label for="">Email</label>
	                      <input type="email" class="form-control" id="from" name="from" value="${user.email }" readonly="readonly">
	                    </div>
	                    <div class="form-group">
	                      <label for="">Name</label>
	                      <input type="text" class="form-control" id="name" name="name" value="${user.name }">
	                    </div>
	                    <div class="form-group">
	                      <label for="">Subject</label>
	                      <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
	                    </div>
	                    <div class="form-group ">
	                      <label for="">Content</label>
	                     <textarea class="form-control" id="content" name="content" placeholder="Content" rows="10"></textarea> 
	                    </div>
	                    <button type="submit" class="btn btn-default btn-lg pull-right">Send Mail</button>
	                  </form>
                  </c:when>
                  <c:otherwise>
                  <h3>로그인 후 이용가능합니다.</h3>
                  </c:otherwise>
                  </c:choose>
                  </div>
	</div>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	