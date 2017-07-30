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
<canvas id="myChart" width="400" height="400"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
    	 labels: ["10대", "20대", "30대", "40대", "50대"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
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