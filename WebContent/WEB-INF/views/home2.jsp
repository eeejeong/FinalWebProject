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
	height: 100vh;
	display: flex;
	flex-direction: column;
}

#header {
	width: 100%;
	height: 150px;
	background-color: beige;
}

#logo {
	height: 150px;
}

#logo img {
	height: 100%;
}

#content {
	width: 100%;
	height: 100%;
	flex-grow: 1;
	display: flex;
	min-height: 0;
	text-align: center;
	
}

#login_form{
	
	width: 100%;
	height: 100%;
	margin-top : 10%;
	text-align: center;

}

#footer {
	width: 100%;
	height: 100px;
	background-color: pink;
}

#fBar ul {
	width: 100%;
	height: 100%;
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

#content {
	
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
			<div id="login_form">
			<h5>로그인</h5>
			<form method="post"  action="login">
				<label for="Agency_id"></label>
				<div class="input-group">
					<input id= Agency_id type="text" name="Agency_id" placeholder="아이디" /> <span
						id="midError" class="error" style="color: red">${miderror }</span>
				</div>
				<div class="form-group">
				<label for="Agency_password"></label>
					<input id="Agency_password" type="password" name="Agency_password" placeholder="패스워드" />
					<span id="mpasswordError" class="error" style="color: red">${mpassworderror }</span>
				</div>
				<button type="submit" class="btn btn-danger">로그인</button>
				<br /> <a id="" href="https://www.youtube.com/?gl=KR&hl=ko">회원가입</a>
			</form>
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
			<div id="copyright">Copyright(c) Medirone All Rights Reserved.
			</div>
		</div>
	</div>
</body>
</html>