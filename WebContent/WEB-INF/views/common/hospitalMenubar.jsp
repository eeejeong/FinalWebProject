<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<style type="text/css">
			#menu{
				width:100%;
				background-color : rgb(206,157,255);
				height: 30px;
			}
			#menu ul li {
			    list-style:none;
			    float: left;
			    margin-right: 20px;
			    }
		</style>
	</head>
	<body>
		<div id="menu">
			<ul>
				<li><a href="<%= request.getContextPath()%>/requestList/">요청 게시판</a></li>
				<li><a href="<%= request.getContextPath()%>/itemManagement/">의약품 관리</a></li>
				<li><a href="#">회원 관리</a></li>
				<li>${agency_Id}   <a href="update/up?agency_id=${agency_Id}">회원정보 수정</a></li>
			</ul>
		</div>
	</body>
</html>
