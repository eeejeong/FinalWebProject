<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<title>메디론 | MEDIRONE</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/image/favicon.ico" />
		<style type="text/css">
			#header{
				width:100%;
				height:130px;
				box-shadow: 5px 5px 15px #dadada;
				background-color: #f9f9f9;
				line-height: 130px;
				text-align: center;
			}
			#logo{
				height:130px;
				line-height:130px;
				margin: 0 auto;
				text-align: center;
			}
			#logo img{
				height: 100px;
				vertical-align:middle;
			}
		</style>
	</head>
	<body>
		<div id="header">
			<div id="logo">
				<a href="<%= request.getContextPath()%>">
				<img
					src="<%=application.getContextPath()%>/resources/image/medirone_logo.png"
					alt="로고" />
				</a>
			</div>
		</div>
</body>
</html>