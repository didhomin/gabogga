<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<%@ include file="/page/community/logincheck.jsp" %>
<!-- 여기서부터 우리가 꾸미기-->
<div class="row">
<div class="col-sm-3 sidenav">
<%@ include file="/page/community/boardmenu.jsp" %>
</div>
</div>
<!-- 여기서부터 게시판 메인 꾸미기 -->
		<div class="col-sm-9 main">			
			<div class="row">
				<div class="col-sm-11">
				</div>
				<div class="col-sm-1">	
					<button type="button" class="btn btn-success btn-sm">목록</button>
				</div>
			</div><br>
			
			<table class="table table-bordered">
			    <thead>
			      <tr class="info">
			        <td width="80%"><b>제목이 나오는 자리</b></td>
			        <td width="20%">2017.07.23</td>
			      </tr>
			    </thead>
			    <thead>
			      <tr class="warning">
			        <td width="80%"><b>jieun</b></td>
			        <td width="20%">조회수 : 1004</td>
			      </tr>
			    </thead>
			    <tbody>
					<tr>
					   <td colspan="2">
					   <%@ include file="/page/community/map/daummap.jsp" %>
					   </td>
					</tr>
					<tr>
					  <td colspan="2">
					  	여기는 <br>
					  	글쓰는 <br>
					  	자리 입니다.
					  </td>
					</tr>
			    </tbody>
			</table>
<!-- 댓글 리스트 -->
			<table class="table table-striped">
				<tr>
					<td>
						<table>
							<tr>
								<td width="20%"><b>jieun</b></td>
			        			<td width="20%">2017.07.23</td>
			        			<td width="50%"></td>
			        			<td class="pull-right"><a href="">답글</a></td>
							</tr>
							<tr>
								<td colspan="4">
								<br>
								동행 구하셧나염?
								</td>
							</tr>
						</table>
					</td>
				</tr>
<!-- 답글 입력 부분 -->
				<tr>
					<td>
						<div class="row input-group-form">
							<div class="row col-sm-1">&nbsp&nbsp&nbsp&nbsp&nbsp
								<span class="glyphicon glyphicon-arrow-right"></span>
							</div>
							<div class="col-sm-9">
								<textarea class="form-control" rows="3" id="comm" placeholder="댓글을 입력해주세요.">
								</textarea>
							</div>
							<div class="col-sm-2">
								<div class="checkbox">
								  <label><input type="checkbox" value="">비밀로하기</label>
								</div>	
								<button type="button" class="btn btn-warning btn-sm">답글입력</button>
							</div>
						</div><br>
					</td>
				</tr>
<!-- 답글 입력 부분 끝 -->
				<tr>
					<td>
						<table>
							<tr>
								<td width="20%"><b>jieun</b></td>
			        			<td width="20%">2017.07.23</td>
			        			<td width="50%"></td>
			        			<td class="pull-right"><a href="">답글</a></td>
							</tr>
							<tr>
								<td colspan="4">
								<br>
								동행 구하셧나염?
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td width="20%"><b>jieun</b></td>
			        			<td width="20%">2017.07.23</td>
			        			<td width="50%"></td>
			        			<td class="pull-right"><a href="">답글</a></td>
							</tr>
							<tr>
								<td colspan="4">
								<br>
								동행 구하셧나염?
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<div class="row input-group-form">
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" id="comm" placeholder="댓글을 입력해주세요.">
					</textarea>
				</div>
				<div class="col-sm-2">
					<div class="checkbox">
					  <label><input type="checkbox" value="">비밀로하기</label>
					</div>	
					<button type="button" class="btn btn-warning btn-sm">댓글입력</button>
				</div>
			</div><br>
<!-- 글쓰기, 목록 -->
			<div class="row">
				<div class="col-sm-10">
				</div>
				<div class="col-sm-2 input-group-btn">	
					<a href="#" class="btn btn-primary btn-sm">
			          <span class="glyphicon glyphicon-pencil"></span> 글쓰기
			        </a>
			        <button type="button" class="btn btn-success btn-sm">목록</button>
				</div>
			</div>
		</div>

	
	
	
<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->
<%@ include file="/page/template/footer.jsp" %>	