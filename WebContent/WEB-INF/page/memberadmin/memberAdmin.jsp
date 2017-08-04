<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/page/template/header.jsp"%>

<c:if test="${not empty emailAuth }">
	<script type="text/javascript">
		$(document).ready(function() {
			alert("${emailAuth}님 인증이 완료되었습니다. 로그인후 이용하세요");
			$('#modalLogin').modal('show');
		});
	</script>
</c:if>
<c:if test="${empty user }">
	<c:if test="${not empty loginresult }">
		<script type="text/javascript">
			$(document).ready(function() {
				alert("${loginresult}");
				$('#modalLogin').modal('show');
			});
		</script>
	</c:if>
</c:if>
<c:if test="${not empty mvlogin}">
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modalLogin').modal('show');
		});
	</script>
</c:if>
<c:if test="${not empty passModify}">
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modalPassModify').modal({
				backdrop : "static"
			});
		});
	</script>
</c:if>
<!-- 여기서부터 우리가 꾸미기 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(document).on('click', '#tt', function() {
							var namemodel = $(this).val();
							//	alert("입력됬어!!"+namemodel);
							$.ajax({
								type : 'GET',
								dataType : 'json',
								url : '${root}/memberAdmin/idcheck.gbg',
								data : {
									'namemodel' : namemodel
								},
								success : function(data) {
									//	alert("성공 출력>>>");
									$("#mid").val(data.userId);
									$("#mname4").val(data.name);
									$("#mname").val(data.gemail);
									$("#mname1").val(data.gender);
									$("#mname2").val(data.regDate);
									$("#mname3").val(data.tel);
									$("#myModal").modal().show();
								},
								error : function(e) {
									alert("에러발생 >>>" + e)
								}
							})
						});
						$(document).on(	'click','#delBt',function() {
											var delet = $('#mid').val();
											document.location.href = "${root}/memberAdmin/delete.gbg?id="+ delet+"&bcode=1&key=&word=";

										});
						var valueArr = new Array();
						$(document).on('click', '#chBt', function() {
							valueArr.push($(this).val());
							console.log("valueArr는" + valueArr);

						});
						$(document).on('click','#blackBt',function() {
											console.log("버튼 클릭 했을 때 "+ valueArr);
											document.location.href = "${root}/memberAdmin/black.gbg?id="+ valueArr+"&bcode=1&key=&word=";
											});
						$(document).on(	'click','#blacklistBt',function() {
											document.location.href = "${root}/memberAdmin/blacklist.gbg?pg=1&bcode=3&key=&word=";
										});
						$('.listselect').click( function () {
							$('#bcode').val('${qs.bcode}');
							$('#pg').val($(this).text());
							//alert("pg "+$(this).text());
							$('#key').val('${qs.key}');
							$('#word').val('${qs.word}');
							$('#commonForm').attr('action','${root}/memberAdmin/list.gbg').submit();
						});
						$('#searchBtn').click(function () {
							$('#bcode').val('${qs.bcode}');
							$('#pg').val('1');
							$('#key').val($('#skey').val());
							$('#word').val($('#sword').val());
						//	alert("key와 word값" +$('#key').val() +"========"+$('#word').val());
							$('#commonForm').attr('action','${root}/memberAdmin/list.gbg').submit();
						});

					});
</script>
<div class="container">
		<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-bell"></i>회원정보
		<p>회원정보 상세보기 하기 위해서는 클릭을 진행해 주세요 </p>
	</h3>
	</div>
	
	<table class="table table-striped">

		<thead>
			<tr>
				<input type="button" value="블랙리스트" id="blackBt"
					class="btn btn-danger" width="3">
			</tr>
			<tr>
				<input type="button" value="블랙리스트확인" id="blacklistBt"
					class="btn btn-success" width="3">
			</tr>
			<tr>
				<th>계정번호</th>
				<th>이름</th>
				<th>Email</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<c:forEach var="userAdminlist1" items="${userAdminlist }">
			<tbody>
				<tr>
					<td><input type="checkbox" id="chBt"
						value="${userAdminlist1.userId}"> <input id="tt"
						value="${userAdminlist1.userId}" readonly="readonly"
						style="border: none; background-color: transparent;" width="2">
					</td>
					<td>${userAdminlist1.name}</td>
					<td>${userAdminlist1.email }</td>
					<td>${userAdminlist1.tel }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</div>
<form action="" id="commonForm" name="commonForm" method="get">
	<input type="hidden" id="bcode" name="bcode">
	<input type="hidden" id="pg" name="pg">
	<input type="hidden" id="key" name="key">
	<input type="hidden" id="word" name="word">
	<input type="hidden" id="seq" name="seq">


</form>



<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<h3>
						회원번호 :<input id="mid" value="" readonly="readonly"
							style="border: none; background-color: transparent;">
				</h4>
				</h3>
			</div>
			<div class="modal-body">
				<h3>
					이름 :<input id="mname4" value="" readonly="readonly"
						style="border: none; background-color: transparent;"><br>
				</h3>
				<h3>
					Email : <input id="mname" value="" readonly="readonly"
						style="border: none; background-color: transparent;"><br>
				</h3>
				<h3>
					성별 : <input id="mname1" value="" readonly="readonly"
						style="border: none; background-color: transparent;"><br>
				</h3>
				<h3>
					가입날짜 : <input id="mname2" value="" readonly="readonly"
						style="border: none; background-color: transparent;"><br>
				</h3>
				<h3>
					전화번호 : <input id="mname3" value="" readonly="readonly"
						style="border: none; background-color: transparent;"><br>
				</h3>

			</div>

			<div class="modal-footer">
				<button type="button" id="delBt" class="btn btn-info" value="">삭제</button>
				<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td colspan="3" height="5"></td>
	</tr>
	<tr valign="top">
		<td nowrap><a href="#"></a></td>
		<td width="100%" align="center"><!--PAGE--> ${navigationIn.navigator }</td>
		<td nowrap class="stext"><b>${navigationIn.pageNo}</b> /  ${navigationIn.totalPageCount }
		pages</td>
	</tr>
</table>	
<br>


<table width="100%"   cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td colspan="3" height="10"></td>
	</tr>
	<tr>
		<td width="50%"></td>
		<td nowrap><select name="skey" id="skey" class="inp"  width="23" >
				<option value="name">유저이름
				<option value="user_Id">유저 번호
     
		</select> <span id="sear1"> <input type="text" name="sword" id="sword"
				size="22" class="inp" style="margin-top: -19px;"> </span> 
   
   <a href="#"><input type="button"
				id="searchBtn" width="32" height="18" border="0" align="absmiddle"
				value="검색"></a>
    
    <c:if test="${userInfo ==null }">
   
   </c:if>
   <br>
  </td>
  <td width="50%" align="right"><a href="#"><input type="button" value="맨위로" width="24" height="11"
				align="absmiddle" alt="TOP"></a><br>
  </td>
 </tr>
</table>


<!-- 여기까지가 우리가 꾸밀부분 -->
					<!-- 푸터 -->
					<%@ include file="/page/template/footer.jsp"%>