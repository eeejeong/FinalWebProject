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
	#inwrapper{
		height:100%;
		padding-top:120px;
	}
	
	#header{
		width:100%;
		height:200px;
		margin-bottom:12px;
		text-align: center;
	}
	#logo{
		height:200px;
		line-height:200px;
		margin: 0 auto;
		text-align: center;
	}
	#logo img{
		height:80%;
		vertical-align:middle;
	}
	
	#content {
		width: 100%;
		/* height:100%; */
		text-align: center;
	}
	
	#loginForm {
		width: 100%;
		height: 500px;
	}
	
	#loginForm .loginbtn{
		width: 350px;
		margin-top:15px;
		background-color:#B0D7DC;
		border :0px;
	}
	
	#loginForm .joinbtn{
		width: 350px;
		border:0px;
	}
	
	.form-control {
		border-radius: 10px;
		width: 350px;
		height: 50px;
		margin: 0 auto;
		background-color: #F5F5F5;
		border: 1px solid #F5F5F5;
	}
	#agency_id{
		padding-left:45px;
		background-image : url('<%=application.getContextPath()%>/resources/image/login_icon.png');
		background-repeat:no-repeat;
		background-position:13px center;
		background-size:20px 50%;
	}
	
	#agency_password{
		padding-left:45px;
		background-image : url('<%=application.getContextPath()%>/resources/image/pw_icon.png');
		background-repeat:no-repeat;
		background-position:13px center;
		background-size:20px 50%;
	}
}
</style>
<script type="text/javascript">
function checkForm(){
	var result = true;
	
	$(".error").text("");
	
	if($("#agency_id").val()==""){
		$("#errorAgency_id").text("*아이디를 입력하세요 ");
		result = false;
	}
	if($("#agency_password").val()==""){
		$("#errorAgency_password").text("*비밀번호를 입력하세요");
		result = false;
	}
	return result;
	
}

</script>
</head>
<body>
	<div id="wrap">
	<div id="inwrapper">
		<div id="header">
			<div id="logo">
				<a href="<%= request.getContextPath()%>">
				<img
					src="<%=application.getContextPath()%>/resources/image/medirone_logo.png"
					alt="로고" />
				</a>
			</div>
		</div>

		<div id="content">
			<div id="loginForm">
			<form method="post" action="login" onsubmit="return checkForm()">
					<div class="form-group">
						<label for="agency_id">ID</label> 
						<input id="agency_id" type="text" name="agency_id" class="form-control" placeholder="" /> 
						<span id="errorAgency_id" class="error" style="color: red">${errorAgency_id}</span>
					</div>
	
					<div class="form-group">
						<label for="agency_password"> PASSWORD</label> <input
							id="agency_password" name="agency_password" class="form-control"
							type="password" placeholder="" /> <span
							id="errorAgency_password" class="error" style="color: red">${errorAgency_password }</span>
	
					</div>
					<button type="submit" class="btn btn-danger loginbtn">로그인</button>
					<br/> <a style="margin-top: 15px;" href="join/" class="btn btn-dark joinbtn">회원가입</a>			
				</form>
			</div>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>