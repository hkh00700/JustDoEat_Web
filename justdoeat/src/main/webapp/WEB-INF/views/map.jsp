<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style>
#map{ margin-right:100px;
	  left:50%;
	  width: 1200px;
	  transform:translateX(-50%);
	  height:600px;
	}
</style>

<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
<body>
	<div id="map"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b7262693dcf80bf66b95325ad7138f9"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(35.15349350081162, 126.88798515956327), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨 
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
	    
	    var lat = 35.15349350081162  //position.coords.latitude, // 위도
	        lon = 126.88798515956327 //position.coords.longitude; // 경도
	    
	    var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	    
	    // 마커와 인포윈도우를 표시합니다
	    displayMarker(locPosition);
	        
	  });
	
	}

	//지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition) {
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({  
		    map: map, 
		    position: locPosition
		}); 
		
		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);      
	}    

</script>
</body>
</html>