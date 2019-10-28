<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<style type="text/css">
			#con-left{
				width:15%;
				background-color : rgb(206,157,255);
				float:left;
				height: 700px;
			}
		</style>
	</head>
	<body>
		<div id="con-left">
			<ul>
				<li><a href="<%= request.getContextPath()%>/requestList/">요청 게시판</a></li>
				<li><a href="<%= request.getContextPath()%>/itemManagement/">의약품 관리</a></li>
				<li><a href="<%= request.getContextPath()%>/management/">회원 관리</a></li> ${agency_Id}
			</ul>
		</div>
	</body>
</html>
