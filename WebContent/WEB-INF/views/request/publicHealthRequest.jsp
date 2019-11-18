<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/image/favicon.ico" />
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>	
		<script>
			window.rCheck = false;
			
			//맨 처음 실행에는 전체 요청 목록을 보여줌
			function first() {
				if (!rCheck) {
					rCheck = true;
					listAll(1);
				}
			};
			
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
				var JSONString = message.payloadString;
				var json = JSON.parse(JSONString);
			
			}		
			
			// 보건소가 수취 확인 버튼을 눌렀을 때 실행하는 메소드
			function deliverSuccess(order_id, agency_id) {
				$.ajax({
					url : "request/deliverSuccess?order_id=" + order_id + '&agency_id=' + agency_id,
					success : function(data) {							
						location.reload();
					}
				});
			}
			
			function showPopup() { 
				var url = 'request/showMap';
				window.open(url, "showMap", "width=1000, height=800, left=100, top=50"); 
			}
		
			function cancelRequest(order_id) {
				$.ajax({
					url : "request/cancelRequest?order_id=" + order_id,
					success : function(data) {
						if(data.result) {
							location.reload();
						}
					}
				});
			}
			
			// 필터링: 전체 보기
			function listAll(pageNo) {
				$.ajax({
					url: 'request/listAll?pageNo='+pageNo,
					success : function(data) {
						$('#requestTable').html(data)
					}
				});
			}
			//=====배송 요청 필터링 작업======
			function listRequested(pageNo) {
				$.ajax({
					url: 'request/listRequested?pageNo=' + pageNo,
					success : function(data) {
						$('#requestTable').html(data)
					}
				});
			}
					
			//필터링: 배송중
			function listDelivering(pageNo) {
				$.ajax({
					url: 'request/listDelivering?pageNo=' + pageNo,
					success : function(data) {
						$('#requestTable').html(data)
					}
				});
			}
			
			// 필터링: 배송 완료
			function listDelivered(pageNo) {
				$.ajax({
					url: 'request/listDelivered?pageNo=' + pageNo,
					success : function(data) {
						$('#requestTable').html(data)
					}
				});
			}
			function listPreparing(pageNo) {
				$.ajax({
					url: 'request/preparingList?pageNo=' + pageNo,
					success : function(data) {
						$('#requestTable').html(data)
					}
				});
			}
		</script>
		<style>
			div.title {
				float: left;
				box-sizing: border-box;    
				width: 100%;
			}
			div.dropdown {
				float: right;
				box-sizing: border-box;
			}
			/* 수정 */
			#content{
				position:relative;
				height: 740px;
				padding: 50px;

				}
			#content .con-box{
				height:100%;
			}
			.form-control{
				text-align: center;
			}	
			#con_bottom{
				width:100%;
				position:absolute;
				bottom:0px;
				margin-bottom:5px;
				text-align:center;
			}
			#bottom_btn{
				display:inline-block;
				margin:auto;
				text-align: center;
			}
			#bottom_btn .submit_btn{
				position:absolute;
				right:100px;
			}
		</style>
	</head>
	<body onload="first()">
		<jsp:include page="../common/agencyHeader.jsp"></jsp:include>
		
		<div id="content">
		<div class="title">
			<img style="height: 40px" src="<%=application.getContextPath()%>/resources/image/title/request.png" alt="요청게시판"/>
			<hr style="color: grey; height: 2px;">
			<img style="height: 30px; margin-bottom: 10px;" src="<%=application.getContextPath()%>/resources/image/title/request_list.png" alt="요청목록"/>
		<div class="dropdown">
			<a class="btn btn-pink dropdown-toggle" href="#" role="button"
				id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 배송 상태 </a>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<button class="dropdown-item" type="button" onclick="listAll(1)">전체 보기</button>
				<button class="dropdown-item" type="button" onclick="listRequested(1)">접수 완료</button>
				<button class="dropdown-item" type="button" onclick="listPreparing(1)">배송 준비</button>
				<button class="dropdown-item" type="button" onclick="listDelivering(1)">배송 중</button>
				<button class="dropdown-item" type="button" onclick="listDelivered(1)">배송 완료</button>
			</div>
		</div>
		</div>
		
		<!-- 필터링 결과가 뿌려지는 테이블 -->
		<div id="requestTable"></div>
		
		
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript">
	function popupOpen(order_id){
		var popUrl = "<%= request.getContextPath()%>/request/medrequest_popuplist?order_id=" + order_id;
		//html을 하나 더 만들어서 목록을 띄움
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
		console.log("1")
		}
	</script>
</html>