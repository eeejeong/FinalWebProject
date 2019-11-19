<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/image/favicon.ico" />
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>	
		<style>
			#map {
				max-width: 100%;
				max-height: 100%;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				margin: auto;
				overflow: auto;
				position: fixed;		
			}
		</style>
	</head>
	
	<body>		
		<div id="divReceive"></div>
		<div id="map"> </div> 
	</body>	

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cef5f118d942254be778baadfb2acb4&libraries=services"></script>
		<script>
			$(function() {
				// MQTT Broker와 연결하기
				client = new Paho.MQTT.Client("106.253.56.124", 61624, "clientId" + new Date().getTime());
				client.onMessageArrived = onMessageArrived;
				client.connect({onSuccess:onConnect});	// 연결이 되면 안에 있는 함수를 자동으로 실행				
			});
			
			// 연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
			function onConnect() {
				  client.subscribe("/drone/fc/pub");
			}
					
			// 메세지를 수신했을 때 자동으로 실행(콜백)되는 함수
			var map = null;
			var marker = null;
			function onMessageArrived(message) {
				var JSONString = message.payloadString;
				var json = JSON.parse(JSONString);
				if(json.msgid == "GLOBAL_POSITION_INT") {
					var currentLat = json.currLat;
					var currentLng = json.currLng;
					var markerPosition  = new kakao.maps.LatLng(currentLat, currentLng); 
				
					if(map == null) {
						var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
					
				    	mapOption = {
				        	center : markerPosition, // 지도의 중심좌표
				        	level : 3
				    	// 지도의 확대 레벨
				    	};
						
				    	map = new kakao.maps.Map(mapContainer, mapOption);
				    	map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
					}
					
					//드론 위치로 지도 이동
				    map.setCenter(markerPosition);
					
				    
					 // 마커 이미지의 이미지 주소입니다
				    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				    // 마커를 생성합니다
				    if(marker != null) {
				    	marker.setMap(null);
				    	marker.setPosition(markerPosition);
				    } else {
					    marker = new kakao.maps.Marker({
					        position: markerPosition
					    });
				    }

				    // 마커가 지도 위에 표시되도록 설정합니다
				    marker.setMap(map);
				} 
			}
			
			function sendMessage() {
				var message = new Paho.MQTT.Message(text);
				message.destinationName = "/drone/fc/sub";
				client.send(message);
			}	
				
	</script>		

</html>