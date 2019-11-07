<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- 보건소 기본 템플릿 -->
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			#wrap{
				width:100%;
				height : 100vh;
				display : flex;
				flex-direction : column;
			}
			.content{
				height: 700px;
				padding-left: 30px;
				padding-right: 30px;
				}
		</style>
	</head>
	<body>
		<div id="wrap">
			<jsp:include page="../common/agencyHeader.jsp"></jsp:include>
			<div class="center">
				
				<div class="content">
				</div>
			</div>
			<jsp:include page="../common/footer.jsp"></jsp:include>		
		</div>
	</body>
</html>