<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script>
var mapContainer = document.getElementById('map'+${a}), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

var geocoder = new daum.maps.services.Geocoder();

/* var starty, stopby1y, stopby2y, stopby3y, finishy;
var startx, stopby1x, stopby2x, stopby3x, finishx;  	
var start, stopby1, stopby2, stopby3, finish;  	 */
var pathline = new Array();

var stopbyx = new Array();
var stopbyy = new Array();
var stopby = new Array();

window.onload = function() {
	//searchAddress${a}("애월", 0);
	//searchAddress${a}("서귀포", 1);
	setMarkerAndLine();
	console.log($(".newMap"));
}


function setMarkerAndLine() {
	$(".newMap").forEach(function(i, v){
		console.log(i);
	});
}

function searchAddress${a}(address, cnt) {

	geocoder.addressSearch(address, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	    	 
	        /* var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        console.log(coords);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        }); */
	      	
        	stopbyy[cnt] = result[0].y;
        	stopbyx[cnt] = result[0].x;
        	stopby[cnt] = new daum.maps.LatLng(result[0].y, result[0].x);
        	
        	//alert("searchAddress stopbyx[0] "+stopbyx[0]);
        	//alert("searchAddress stopbyx[1] "+stopbyx[1]);
        	
        	var marker = new daum.maps.Marker({
	            map: map,
	            position: stopby[cnt]
	        });
        	
        	drawLine${a}(stopby[cnt]);
        	
        	if(cnt == 0) {
		       	// 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">출발</div>'
		        });
		        infowindow.open(map, marker);
        	}
        	
        	if(cnt == 1) {
		       	// 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">도착</div>'
		        });
		        infowindow.open(map, marker);
		        mapfinish${a}();
        	}
	    } 
	});    
}

function mapfinish${a}(){
	// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
/* 	var points = [
		new daum.maps.LatLng(starty, startx),
	    new daum.maps.LatLng(stopby1y, stopby1x),
	    new daum.maps.LatLng(stopby2y, stopby2x),
	    new daum.maps.LatLng(stopby3y, stopby3x),
	    new daum.maps.LatLng(finishy, finishx)
	]; */
	
	var points = stopby;

	//alert("mapfinish stopbyx[0] "+stopbyx[0]);
	//alert("mapfinish stopbyx[1] "+stopbyx[1]);
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new daum.maps.LatLngBounds();    

	var i, marker;
	for (i = 0; i < points.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker =     new daum.maps.Marker({ position : points[i] });
	    marker.setMap(map);
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(points[i]);
	}
	
	setBounds();
	
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
};

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
function drawLine${a}(addDraw) {

    // 마우스로 클릭한 위치입니다 
    //var clickPosition = mouseEvent.latLng;
    console.log(addDraw);

    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
    if (!drawingFlag) {

        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
        drawingFlag = true;
        
        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
        deleteClickLine();
        
        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
        deleteDistnce();

        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
        deleteCircleDot();
    
        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
        clickLine = new daum.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [addDraw], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
        moveLine = new daum.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다    
        });
    
        // 클릭한 지점에 대한 정보를 지도에 표시합니다
        displayCircleDot(addDraw, 0);

            
    } else { // 선이 그려지고 있는 상태이면

        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
        var path = clickLine.getPath();

        // 좌표 배열에 클릭한 위치를 추가합니다
        path.push(addDraw);
        
        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        displayCircleDot(addDraw, distance);
    }
    
    /* if(addDraw == finish) {
    	drawLineEnd(finish);
    } */
    
};
    
</script>
