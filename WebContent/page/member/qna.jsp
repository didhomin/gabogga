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
                <div class="col-sm-7 col-sm-offset-1">
                  <form class="">
                    <div class="form-group">
                      <label for="">Name</label>
                      <input type="text" class="form-control" id="" placeholder="YangHomin">
                    </div>
                    <div class="form-group">
                      <label for="">Email</label>
                      <input type="email" class="form-control" id="exampleInputEmail2" placeholder="yourmail@example.com">
                    </div>
                    <div class="form-group">
                      <label for="">Subject</label>
                      <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Subject">
                    </div>
                    <div class="form-group ">
                      <label for="">Content</label>
                     <textarea class="form-control" placeholder="Content" rows="10"></textarea> 
                    </div>
                    <button type="submit" class="btn btn-default btn-lg pull-right">Send Mail</button>
                  </form>
                  </div>
	</div>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	