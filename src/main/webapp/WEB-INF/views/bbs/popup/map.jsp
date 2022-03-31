<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>


	<div id="map" style="width:600px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c0c32c9cb35eb65b93ac9e9a7f426bb5"></script>
	
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.485472620638, 126.898223123534), // 좌표
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options); // 지도 생성
			
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(37.485472620638, 126.898223123534); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/link/to/브레인컨설팅 본사,37.485472620638,126.898223123534" style="color:blue" target="_blank">브레인컨설팅 본사</a></div>', 
			    iwPosition = new kakao.maps.LatLng(37.485472620638, 126.898223123534); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 

			
		</script>
	
</body>
</html>