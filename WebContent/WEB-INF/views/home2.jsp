<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- 좌측 메뉴바 없는 템플릿 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#wrap {
	width: 100%;
	height: 100%;
}

#header {
	width: 100%;
	height: 300px;
	background-color: beige;
}

#content {
	width: 100%;
	height: 100%;
	text-align: center;
	padding : 40px;
	
}
    
	

#footer {
	width: 100%;
	heigth: 200px;
	background-color: pink;
}

#fBar ul {
	width: 100%;
	height: 150px;
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center
}

#fBar ul li {
	margin-left: 20px;
	display: inline-block;
}

#fBar ul li:first-child {
	margin-left: 0px;
}

#fBar ul li a {
	color: black;
	text-decoration: none;
}


</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="logo">
				<img
					src="<%=application.getContextPath()%>/resources/image/img_brand3.png"
					alt="로고" />
			</div>
		</div>

		<div id="content">
					<h5>로그인</h5>
			<form method="post" name="login" action="Login">
				<div class="form-group">
					<input type="text" name="member_id" placeholder="아이디" /> <span
						id="midError" class="error" style="color: red">${miderror }</span>
				</div>
				<div class="form-group">
					<input type="password" name="member_password" placeholder="패스워드" />
					<span id="mpasswordError" class="error" style="color: red">${mpassworderror }</span>
				</div>
				<button type="submit" class="btn btn-danger">로그인</button>
				<br /> <a id="" href="https://www.youtube.com/?gl=KR&hl=ko">회원가입</a>
			</form>
			
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
			<div id="copyright">Copyright(c) Medirone All Rights Reserved.
			</div>
		</div>
	</div>
</body>
</html>