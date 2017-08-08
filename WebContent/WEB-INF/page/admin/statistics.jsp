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
	<button id="aaa"  class="btn btn-default">가입 회원 성별</button>
	<button id="bbb"  class="btn btn-default">월별 예약 수</button>
	<button id="ccc" class="btn btn-default">지역별 게스트하우스 수</button>
  </div>
  
<div id="chart" class="col-sm-9 col-sm-offset-1"><canvas id="myChart" width="" height=""></canvas></div>
         
          
<script>
var barChartData = {  
        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"]   ,
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
    
var lineChartData = {  
		labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        datasets: [{
            label: '월별 예약 수',
            backgroundColor:'rgba(153,255,51,0.5)',
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
          $('#chart').attr('class','col-sm-9 col-sm-offset-1');
          window.myBar.update();
       }
    });

	
	
	$("#bbb").click(function() {
		$.ajax({
			method: 'get',
			url: '/gabogga/admin/reservation.gbg',
			data : {},
			dataType: 'json',
			success: function(data) {
                window.myBar.destroy();
				ctx = document.getElementById("myChart").getContext('2d');
				window.myBar = new Chart(ctx, {
				    type: 'line',
				    data: lineChartData,
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
		                   },	
	                	bezierCurve : true,
	                	datasetFill : false,
	                	scaleShowGridLines : false
					 }
				});
                for(var i=0;i<data.reservationlist.length;i++) {
                	lineChartData.datasets[0].data[data.reservationlist[i].month-1]=data.reservationlist[i].count;
                }
                $('#chart').attr('class','col-sm-9 col-sm-offset-1');
				window.myBar.update();
			}
		});
	});
	
	
	$("#ccc").click(function() {
		$.ajax({
			method: 'get',
			url: '/gabogga/admin/region.gbg',
			data : {},
			dataType: 'json',
			success: function(data) {
				
				 var cdata=new Array('FFB6C1', 'FFCFDA ','FFD0CD','FAEB78 ','FFE650','FFC6A5','FF9696','6EE5A3','73E1E1',
		                      '96F56E','84FB84','52E252','8C8CFF','64AAFF','5AD2FF');
				 var label = [];
                 var value=[];
                 var bgcolor=[];

                 for(var i=0;i<data.regionlist.length;i++) {
                       label[i] = data.regionlist[i].addressgroup;
                       value[i] = data.regionlist[i].count;
                       bgcolor[i]= "#"+cdata[Math.floor(Math.random()*cdata.length)];
                       
              }

                 window.myBar.destroy();
				ctx = document.getElementById("myChart").getContext('2d');
				window.myBar = new Chart(ctx, {
				    type: 'doughnut',
				    data: {
				    	labels: label,
				        datasets: [{	
				            label: label,
				            data: value,
				            backgroundColor: bgcolor,
				            borderColor: bgcolor
				        }]
				    }
				});
				$('#chart').attr('class','col-sm-5 col-sm-offset-3');
				window.myBar.update();
			}
		});
	});
	

	
});


</script>
  

<%@ include file="/page/template/footer.jsp" %>	