<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/page/template/header.jsp" %>	
<!-- 여기서부터 우리가 꾸미기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<script type="text/javascript">

</script>
<div class="jumbotron" style="">
	<h3>
		<i class="glyphicon glyphicon-stats"></i> 통계
	</h3>
</div>
  <div align="center">
	<button id="ccc" class="btn btn-default">지역별 예약 수</button>
	<button id="bbb"  class="btn btn-default">지역별 등록된 매장수</button>
	<button id="aaa"  class="btn btn-default">가입 회원 성별</button>
  </div>
  
<div class="col-sm-6 col-sm-offset-2"><canvas id="myChart" width="" height=""></canvas></div>
            <div class="col-sm-3" style="padding-top: 30px; padding-left: 10px;">
                <div class="input-group form-group" >
	                <div>
		                <span class="">From</span>
	                </div>
	                <div>
    	       			<input type="date" class="form-control" style="background-color:#fff"/>
	                </div>
        		</div>
              	<div class="input-group form-group">
					<div>
	          			<span class="">To</span>
					</div>
					<div>
	           			<input type="date"  class="form-control" style="background-color:#fff"/>
					</div>
        		</div>
        		<div class="input-group form-group col-sm-offset-5">
	        		<input class="btn btn-default btn-block" type="submit"
											value="조회">
				</div>
            </div>
          
<script>
$(document).ready(function() {
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	    	labels: ["여성", "남성"],
	        datasets: [{	
	            label: '가입 회원 성별',
	            data: ["", ""],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	$("#aaa").click(function() {
		$.ajax({
			method: 'get',
			url: '/gabogga/admin/gender.gbg',
			dataType: 'json',
			success: function(data) {
				myChart.destroy();
				ctx = document.getElementById("myChart").getContext('2d');
				myChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				    	labels: ["여성", "남성"],
				        datasets: [{	
				            label: '가입 회원 성별',
				            data: [data.woman, data.man],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				            ],
				            borderColor: [
				                'rgba(255,99,132,1)',
				                'rgba(54, 162, 235, 1)',
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero:true
				                }
				            }]
				        }
				    }
				});
					myChart.update();
			}
		});
	});
	
});


</script>
  

<%@ include file="/page/template/footer.jsp" %>	