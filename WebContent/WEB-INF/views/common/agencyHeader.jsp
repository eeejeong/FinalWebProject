<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>	
		<style type="text/css">
			#wrapper{
				width:100%;
				height:130px;
				display: flex;
				box-shadow: 5px 5px 15px #dadada;
				background-color: #f9f9f9;
				line-height: 130px;
				padding-left: 50px;
				padding-right: 50px;
			}
		
			#logo{
				height:130px;
				/* line-height:130px; */
				
			}
			#logo img{
				margin-right:50px;
				vertical-align:middle;
				height: 70%
			}
			.menu{
				vertical-align: bottom;
			}
			.menu img{
				height: 20px;
				margin-right: 30px;
			}
			.agencyInfo{
				 float: right; 
				 width: auto;
				 vertical-align: middle;				 
			}
			.agencyInfo img{
				height: 14px;
			}
			
		</style>
		
	</head>
	<body>
		<div id="wrapper">
			<div id="logo">
				<c:if test="${agency_Id != null}">
					<a href="<%= request.getContextPath()%>/request">
					<img src="<%=application.getContextPath()%>/resources/image/medirone_logo.png" alt="로고" /></a>
				</c:if>				
			</div>
			
			<div class="menu" style="flex-grow: 1">
				<div id="menu_text" style="display: flex">
				<a id="request" href="<%= request.getContextPath()%>/request/">
					<img src="<%=application.getContextPath()%>/resources/image/menu/menu_request.png" 
					onmouseover="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_request_pink.png';" 
					onmouseout="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_request.png';" 
					alt="요청게시판" title="요청게시판" />
				</a>
				<c:if test="${agency_Id eq 'admin'}">
					<a id="medicine" href="<%= request.getContextPath()%>/itemManagement/">
						<img src="<%=application.getContextPath()%>/resources/image/menu/menu_medicine.png" 
						onmouseover="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_medicine_pink.png';" 
						onmouseout="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_medicine.png';" 
						alt="의약품관리" title="의약품관리" />
					</a>
					<a id="member" href="<%= request.getContextPath()%>/management/">
						<img src="<%=application.getContextPath()%>/resources/image/menu/menu_member.png" 
						onmouseover="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_member_pink.png';" 
						onmouseout="this.src='<%=application.getContextPath()%>/resources/image/menu/menu_member.png';" 
						alt="회원관리" title="회원관리" />
					</a>
				</c:if>
				</div>
			</div>
			
			<div class="agencyInfo">
				<img style="height: 20px; margin-right: 5px" src="<%=application.getContextPath()%>/resources/image/login_icon.png"/>
				<span style="font-size: 18px; margin-right: 10px;">${agency_Id}</span>
				<c:if test="${agency_Id != null}">
					<a style="margin-right: 10px;" href="<%= request.getContextPath()%>/logout/">
						<img src="<%=application.getContextPath()%>/resources/image/agencyInfo/logout.png" 
						onmouseover="this.src='<%=application.getContextPath()%>/resources/image/agencyInfo/logout_mint.png';" 
						onmouseout="this.src='<%=application.getContextPath()%>/resources/image/agencyInfo/logout.png';" 
						alt="로그아웃" title="로그아웃" />
					</a>
					<a href="<%= request.getContextPath()%>/update/up?agency_id=${agency_Id}">
						<img src="<%=application.getContextPath()%>/resources/image/agencyInfo/member.png" 
						onmouseover="this.src='<%=application.getContextPath()%>/resources/image/agencyInfo/member_mint.png';" 
						onmouseout="this.src='<%=application.getContextPath()%>/resources/image/agencyInfo/member.png';" 
						alt="정보수정" title="정보수정" />
					</a>
				</c:if>							
			</div>
		</div>
	
</body>
</html>