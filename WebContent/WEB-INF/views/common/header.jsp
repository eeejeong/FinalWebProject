<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>		
		<style type="text/css">
			#header{
				width:100%;
				height:200x;
				background-color:beige;
				text-align: center;
			}
			#logo{
				height:200px;
				line-height:200px;
				margin: 0 auto;
				text-align: center;
			}
			#logo img{
				height:80%;
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