<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style type="text/css">
			#footer{
				width:100%;
				height:100px;
				line-height:100px;
				background-color:#F4C2C2;
			}
			#footer .footer_logo{
				margin-left:50px;
				height: 60px;
				vertical-align:middle;
			}
			#fBar ul{
				width:100%;
				height:100%;
				list-style:none;
			    margin:0;
			    padding:0;
			    
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
				text-align:center;
			}
		</style>
	</head>
	<body>
		<div id="footer">
			<img class="footer_logo" src="<%=application.getContextPath()%>/resources/image/footer_text.png" alt="로고" />
			<!-- 
			<div id="fBar">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">회사소개</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">사이트맵</a></li>
				</ul>
			</div> 
			<div id="copyright">Copyright(c) Medirone All Rights Reserved.</div>
			-->
		</div>
	</body>
</html>
