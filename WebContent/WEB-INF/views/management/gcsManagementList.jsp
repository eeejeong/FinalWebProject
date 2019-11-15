<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메디론 | MEDIRONE</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/image/favicon.ico" />
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>

<script>
	$(function() {
		// MQTT Broker와 연결하기
		client = new Paho.MQTT.Client("106.253.56.124", 61624, "clientId" + new Date().getTime());
		client.onMessageArrived = onMessageArrived;
		client.connect({onSuccess:onConnect});	// 연결이 되면 안에 있는 함수를 자동으로 실행	
	});
	
	// 연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
	function onConnect() {
		client.subscribe("/drone/mission/pub");
	}
	
	// 메세지를 수신했을 때 자동으로 실행(콜백)되는 함수
	function onMessageArrived(message) {
		
	}
	
	
	function sendMessage(jsonStr) {		
		try { 
			// java: JSObject. 크롬에서 실행할 때는 없고, webview에서 실행할 때는 있고.
			if(java) {
				java.receiveMissionInfo(jsonStr);	
				java.windowClose();
			}
		} catch(err) {
		}
		var message = new Paho.MQTT.Message(jsonStr);
		message.destinationName = "/drone/request/sub";
		client.send(message);
	}


	function showGoingMission(agency_id) {
		$.ajax({
			url : 'showMissionClicked?&agency_id=' + agency_id,
			success : function(data) {		
				var json = new Object();
				json.msgid = 'showMission';
				json.lat = data.agencyLat;
				json.lng = data.agencyLng;
				json.waypoint = data.waypoint;

				var jsonStr = JSON.stringify(json);
				sendMessage(jsonStr);	
			}
		});
	}
	
	function showRtlMission(agency_id) {
		$.ajax({
			url : 'showRtlMissionClicked?&agency_id=' + agency_id,
			success : function(data) {		
				var json = new Object();
				json.msgid = 'showMission';
				json.lat = 37.4951330561;
				json.lng = 127.122456779;
				json.waypoint = data.waypoint;

				var jsonStr = JSON.stringify(json);
				sendMessage(jsonStr);	
			}
		}); 
	}
</script>

<style>
/* 수정 */
div.title {
	float: left;
	box-sizing: border-box;
	width: 100%;
}
.content{
	height: 740px;
	padding: 50px;
	}
#agencyAddressLink {
	color: #398AD7; 
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="content">
		<div class="title">
				<img style="height: 30px; margin-bottom: 10px;" src="<%=application.getContextPath()%>/resources/image/title/member.png" alt="회원 관리"/>
			</div>
		<div>
			<table class="table table-sm">
				<thead>
					<tr style="background-color: #dcdcdc">
						<th scope="col" >회원 ID</th>
						<th scope="col" >보건소 명</th>
						<th scope="col" style="text-align: center;">위도</th>
						<th scope="col" style="text-align: center;">경도</th>
						<th scope="col" style="text-align: center;">미션 경로</th>
						<th scope="col" style="text-align: center;">보건소 경로</th>
						<th scope="col" style="text-align: center;">RTL 경로</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${managementList}" var="mana">
						<tr>
							<td style="vertical-align: middle;">${mana.agency_id}</td>
							<td style="vertical-align: middle;">${mana.agency_name}</td>
							<td style="vertical-align: middle; text-align: center;">${mana.agency_latitude}</td>
							<td style="vertical-align: middle; text-align: center;">${mana.agency_longitude}</td>		
							<td style="vertical-align: middle; text-align: center;">
								<c:if test="${mana.mission_waypoint == null}"> 
									경로 없음
								</c:if>
								<c:if test="${mana.mission_waypoint != null}"> 
									경로 있음
								</c:if>
							</td>	
							<td style="vertical-align: middle; text-align: center;">
								<button class="btn btn-outline-pink" onclick="showGoingMission('${mana.agency_id}')"> 불러오기</button>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<button class="btn btn-outline-mint" onclick="showRtlMission('${mana.agency_id}')"> 불러오기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="display: flex;">
			<div style="flex-grow: 1; margin: auto; text-align: center;">
				<a href="managementList?pageNo=1" class="btn btn-outline-dark">처음</a>

				<c:if test="${groupNo>1}">
					<a href="managementList?pageNo=${startPageNo-1}"
						class="btn btn-outline-info">이전</a>
				</c:if>

				<div style="display: inline-block;" class="btn-toolbar"
					role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group mr-2" role="group" aria-label="First group">
						<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
							<c:if test="${pageNo==i}">
								<a href="managementList?pageNo=${i}"
									class="btn btn-light active">${i}</a>
							</c:if>
							<c:if test="${pageNo!=i}">
								<a href="managementList?pageNo=${i}" class="btn btn-light">${i}</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<c:if test="${groupNo<totalGroupNum}">
					<a href="managementList?pageNo=${endPageNo+1}"
						class="btn btn-outline-info">다음</a>
				</c:if>
				<a href="managementList?pageNo=${totalPageNum}"
					class="btn btn-outline-dark">맨끝</a>
			</div>
		</div>
	</div>
</body>
</html>