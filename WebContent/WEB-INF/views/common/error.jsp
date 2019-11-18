<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메디론|MEDIRONE</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/image/favicon.ico" />		
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	</head>
	<script>
		function errorMessage() {
			alert("잘못된 접근입니다.");
			location.href = "http://" + location.host + "/FinalWebProject/";		
		}
	</script>
	<body onload="errorMessage()">
		
	</body>
</html>