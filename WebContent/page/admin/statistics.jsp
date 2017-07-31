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
	<button id="" class="btn btn-default">지역별 예약 수</button>
	<button id=""  class="btn btn-default">지역별 등록된 매장수</button>
	<button id=""  class="btn btn-default">가입 회원 성별</button>
  </div>
<div class="col-sm-6 col-sm-offset-3"><canvas id="myChart" width="" height=""></canvas></div>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
    	labels: ["여성", "남성"],
        datasets: [{	
            label: '연령대별 가입자수',
            data: ["20", "12"],
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
var obj = JSON.parse('${agejson}');

console.log(obj);
for (var i = 0; i <obj.length; i++) {
	myChart.data.labels[i] = obj[i].age;	
	myChart.data.datasets[0].data[i] = obj[i].ageCount;	
}
	myChart.update();
</script>
  

<%@ include file="/page/template/footer.jsp" %>	