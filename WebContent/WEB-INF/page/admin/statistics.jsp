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
  
<!-- <div class="col-sm-6 col-sm-offset-2"></div>
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
            </div> -->
            <canvas id="myChart" width="" height=""></canvas>
<script>
var barChartData = {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"]	,
        datasets: [{
            label: '남성',
            backgroundColor:'rgba(54, 162, 235, 0.2)',
            data: [
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0
                
               
            ]
        }, {
            label: '여성',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            data: [
            	0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0
               
            ]
        }]
		
    };
$(document).ready(function() {
	var ctx = document.getElementById("myChart").getContext("2d");
    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            title:{
                display:true,
                text:"남녀 월별 가입 통계"
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                    stacked: true,
                }],
                yAxes: [{
                    stacked: true
                }]
            }
        }
    
    });
});


	$("#aaa").click(function() {
		$.ajax({
			method: 'get',
			url: '/gabogga/admin/gender.gbg',
			data : {},
			dataType: 'json',
			success: function(data) {
				window.myBar.destroy();
				ctx = document.getElementById("myChart").getContext('2d');
				window.myBar = new Chart(ctx, {
			        type: 'bar',
			        data: barChartData,
			        options: {
			            title:{
			                display:true,
			                text:"남녀 월별 가입 통계"
			            },
			            tooltips: {
			                mode: 'index',
			                intersect: false
			            },
			            responsive: true,
			            scales: {
			                xAxes: [{
			                    stacked: true,
			                }],
			                yAxes: [{
			                    stacked: true
			                }]
			            }
			        }
			    
			    });
				for (var i = 0; i <data.man.length; i++) {
					barChartData.datasets[0].data[data.man[i].mon-1]=data.man[i].cnt;	
				}
				for (var i = 0; i <data.woman.length; i++) {
					barChartData.datasets[1].data[data.woman[i].mon-1]=data.woman[i].cnt;	
				}
				window.myBar.update();
			}
		});
	});
	


</script>
  

<%@ include file="/page/template/footer.jsp" %>	