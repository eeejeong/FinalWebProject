<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4조 프로젝트 </title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<style>


.login {
	width: 230px;
	position: absolute;
	top: 30%;
	left: 50%;
	margin-top: 70px;
	margin-left: -115px;
	padding:20px;
	text-align:center;
}




</style>
<script>
function checkForm() {
	var result = true;
	//모든 에러 내용 지우기
	$(".error").text("");
	//입력값 검사 
	if ($("#member_id").val() == "") {
		$("#midError").text("*아이디를 입력하세요");
		result = false;
	}
	if ($("#member_password").val() == "") {
		$("#mpasswordError").text("*비밀번호를 입력하세요");
		result = false;
	}
	
	return result;
}
function passcheck(){
	
}
</script>

</head>
<body>
	<div id="wrap">
		<div id="infozone">
			<span class="smalltext" style="color:HotPink;"></span>
			
		</div>

		   <div id="contentszone">
			<!-- 로고 단<div class="title">Web Programming Test</div>-->
		</div>

		<div id="listzone">
			
			<div class="login">
			<!-- LOGIN Form -->
			<form method="post" name="login" action="Login">
				<div class="form-group">
				<input type="text" name="member_id" placeholder="아이디" /> 
				<span id="midError" class="error" style="color: red">${miderror }</span>
				</div>
				<div class="form-group">
				<input type="password" name="member_password" placeholder="패스워드" />
				<span id="mpasswordError" class="error" style="color: red">${mpassworderror }</span>
				</div>
				<button type="submit" class="btn btn-danger">로그인</button><br/>
				
				<a id="" href="https://www.youtube.com/?gl=KR&hl=ko" >회원가입</a>
			</form>
			<!-- LOGIN Form End-->
			</div>
		</div>
	</div>
</body>
</html>





