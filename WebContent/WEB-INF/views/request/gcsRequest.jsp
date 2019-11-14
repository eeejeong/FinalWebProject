<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
<script type="text/javascript">

	$(function() {
		// MQTT Broker와 연결하기
		client = new Paho.MQTT.Client(location.hostname, 61624, "clientId" + new Date().getTime());
		client.onMessageArrived = onMessageArrived;
		client.connect({onSuccess:onConnect});	// 연결이 되면 안에 있는 함수를 자동으로 실행				
	});
	
	// 연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
	function onConnect() {
		client.subscribe("/drone/fc/pub");
	}
	
	// 메세지를 수신했을 때 자동으로 실행(콜백)되는 함수
	function onMessageArrived(message) {
		
	}
	
	function sendMessage(jsonStr) {		
		//alert(jsonStr);
		var message = new Paho.MQTT.Message(jsonStr);
		message.destinationName = "/drone/request/sub";
		client.send(message);
	}

	function deliveringBtn(order_id, agency_id){
		console.log(agency_id);
		$.ajax({
			url : 'request/deliveringClicked?order_id=' + order_id + '&agency_id=' + agency_id,
			success : function(data) {			
				var json = new Object();
				json.msgid = 'missioninfo';
				json.lat = data.agencyLat;
				json.lng = data.agencyLng;
				json.agencyId = data.agencyId;
				json.alt = 10;
			
				var jsonStr = JSON.stringify(json);
				sendMessage(jsonStr);				
				location.reload();
			}
		});
		
	}
</script>
<style>
div.title {
	width: 100%;
	float: left;
	box-sizing: border-box;
}

/* 수정 */
.content {
	height: 740px;
	padding : 50px;
}

.form-control {
	text-align: center;
}
</style>

</head>
<body>
	<div class="content">
		<div class="title">
			<img style="height: 30px; margin-bottom: 10px;" src="<%=application.getContextPath()%>/resources/image/title/request_list.png" alt="요청목록"/>
		</div>
		<div>
			<table style="margin: auto; text-align: center;"
				class="table table-sm">
				<thead>
					<tr style="background-color: #dcdcdc">
						<th scope="col">요청 번호</th>
						<th scope="col">요청 기관</th>
						<th scope="col">위도</th>
						<th scope="col">경도</th>
						<th scope="col">필요 시간</th>
						<th scope="col">배송하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${requestList}" varStatus="status">
							<tr>
								<td style="width: auto; vertical-align: middle">${list.order_id}</td>
								<td style="width: auto; vertical-align: middle">${agencyList[status.index].agency_name}</td>
								<td style="width: auto; vertical-align: middle">${agencyList[status.index].agency_latitude}</td>
								<td style="width: auto; vertical-align: middle">${agencyList[status.index].agency_longitude}</td>
								<td style="width: auto; vertical-align: middle">${list.order_need_time}</td>
								<td style="width: auto; vertical-align: middle">
									<button type="button" class="btn btn-outline-mint" onclick="deliveringBtn(${list.order_id}, '${list.order_agency_id}')">배송하기</button>
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="display: flex;">
			<div style="flex-grow: 1; margin: auto; text-align: center;">
				<a href="?pageNo=1" class="btn btn-outline-dark">처음</a>

				<c:if test="${groupNo>1}">
					<a href="?pageNo=${startPageNo-1}"
						class="btn btn-outline-info">이전</a>
				</c:if>

				<div style="display: inline-block;" class="btn-toolbar"
					role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group mr-2" role="group" aria-label="First group">
						<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
							<c:if test="${pageNo==i}">
								<a href="?pageNo=${i}" class="btn btn-light active">${i}</a>
							</c:if>
							<c:if test="${pageNo!=i}">
								<a href="?pageNo=${i}" class="btn btn-light">${i}</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<c:if test="${groupNo<totalGroupNum}">
					<a href="?pageNo=${endPageNo+1}"
						class="btn btn-outline-info">다음</a>
				</c:if>
				<a href="?pageNo=${totalPageNum}"
					class="btn btn-outline-dark">맨끝</a>
			</div>
			
		</div>
	</div>
</body>
</html>