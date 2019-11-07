<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- 병원 기본 템플릿 -->
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
			#header{
				width:100%;
				height:200px;
				/* margin-bottom:12px;
				text-align: center; */
			}
			#content{
				height: 750px;
				/* padding-left: 30px;
				padding-right: 30px; */
				padding : 20px 30px;
				background-color: #grey;
				}
		</style>
	</head>
	<body>
		<div id="wrap">	
			<div id="header"> 
				<jsp:include page="../common/agencyHeader.jsp"></jsp:include>	
			</div>		
			<div id="content">
			</div>

			<jsp:include page="../common/footer.jsp"></jsp:include>		
		</div>
	</body>
</html>