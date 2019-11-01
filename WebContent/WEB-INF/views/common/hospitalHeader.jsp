<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>	
		<style type="text/css">
			#header{
				width:100%;
				height:150px;
				background-color:beige;
				display: flex;
			}
			#logo{
				height:150px;
			}
			#logo img{
				height:100%;
			}
			
			#menu{

			}
		</style>
	</head>
	<body>
		<div id="header">
			<div id="logo">
				<c:if test="${agency_Id != null}">
					<a href="<%= request.getContextPath()%>/hospitalHome">
					<img src="<%=application.getContextPath()%>/resources/image/img_brand3.png" alt="로고" /></a>
				</c:if>				
			</div>
			
			<div id="menu" style="flex-grow: 1">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active">
								<a class="nav-link" href="<%= request.getContextPath()%>/request/">요청 게시판<span class="sr-only">(current)</span></a>
							</li>
							
							<li class="nav-item active">
								<a class="nav-link" href="<%= request.getContextPath()%>/itemManagement/">의약품 관리<span class="sr-only">(current)</span></a>
							</li>
							
							<li class="nav-item active">
								<a class="nav-link" href="<%= request.getContextPath()%>/management/">회원 관리<span class="sr-only"></span></a>
							</li>
						</ul>
					</div>
				</nav>			
			</div>
			<div id="agencyInfo" style="float: right; width: 300px">
				<div>${agency_Id}님, 환영합니다!</div>
				<div>
					<c:if test="${agency_Id != null}">
						<a href="<%= request.getContextPath()%>/logout/" class="btn btn-outline-danger">로그아웃</a>
						<a href="<%= request.getContextPath()%>/update/up?agency_id=${agency_Id}" class="btn btn-outline-dark">회원수정</a>
					</c:if>							
				</div>
			</div>
		</div>
</body>
</html>