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
			#header{
				width:100%;
				height:150px;
				background-color:beige;
			}
			#logo{
				height:150px;
			}
			#logo img{
				height:100%;
			}
			#content {
				flex-grow:1;
				display:flex;
				min-height:0;
			}
			#content #con-left{
				width:200px;
				background-color : rgb(206,157,255);
			}
			#content #center {
				flex-grow:1 ;
				padding:10px;
			}
			#center iframe {
				margin-top:0px;
				width:100%;
				height:100%;
			}
			#footer{
				width:100%;
				height:100px;
				background-color:pink;
			}
			#fBar ul{
				width:100%;
				height:100%;
				list-style:none;
			    margin:0;
			    padding:0;
			    text-align:center
			}
			#fBar ul li{
				margin-left:20px;
				display:inline-block;
			}
			#fBar ul li:first-child{
				margin-left:0px;
			}
			#fBar ul li a{
				color:black;
				text-decoration:none;
			}

		</style>
	</head>
	<body>
		<div id="wrap">
			<div id="header">
				<div id="logo">
					<img src="<%=application.getContextPath()%>/resources/image/img_brand3.png" alt="로고" />
				</div>
			</div>
			
			<div id="content">
				<!-- page 내용 -->
				<!--  -->
				<div id="con-left">
					<ul>
						<li><a href="#">요청 게시판</a></li>
						<li><a href="#">의약품 관리</a></li>
					</ul>
				</div>
				<div id="center">
					<iframe name="iframe" src="http://tomcat.apache.org" frameborder="0"></iframe>
				</div>
			</div>
			
			<div id="footer">
				<div id="fBar">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">사이트맵</a></li>
					</ul>
				</div>
				<div id="copyright">
					Copyright(c) Medirone All Rights Reserved.
				</div>
			</div>
		</div>
	</body>
</html>