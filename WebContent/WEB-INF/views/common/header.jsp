<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>		
		<style type="text/css">
			#header{
				width:100%;
				height:150px;
				background-color:beige;
				text-align: center;
			}
			#logo{
				height:150px;
				margin: 0 auto;
			}
			#logo img{
				height:100%;
			}
		</style>
	</head>
	<body>
		<div id="header">
			<div id="logo">
				<a href="<%= request.getContextPath()%>">
				<img
					src="<%=application.getContextPath()%>/resources/image/img_brand3.png"
					alt="로고" />
				</a>
			</div>
		</div>
</body>
</html>