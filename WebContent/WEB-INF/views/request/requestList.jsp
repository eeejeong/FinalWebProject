<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
			/* 수정 */
			.content{
				height: 700px;
				padding-left: 30px;
				padding-right: 30px;
				}
		</style>
	</head>
	<body>
		<jsp:include page="../common/hospitalHeader.jsp"></jsp:include>
			<div class="content">
				<h1>요청게시판 (병원)</h1>
			</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>