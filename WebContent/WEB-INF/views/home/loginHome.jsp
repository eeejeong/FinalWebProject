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
	
	#content {
		width: 100%;
		height: 100%;
		flex-grow: 1;
		text-align: center;
/* 		margin-left: auto;
		margin-right: auto; */
		position: relative;
	}
	#loginForm {
		width: 100%;
		height: 500px;
		position: absolute;
		top: 50%;
		margin-top: -250px;
	}
	.form-control {
		border-radius: 25px;
		width: 500px;
		height: 50px;
		margin: 0 auto;
		background-color: #F5F5F5;
		border: 1px solid #F5F5F5;
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
		<jsp:include page="../common/header.jsp"></jsp:include>

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
					<button type="submit" class="btn btn-danger">로그인</button>
					<br/> <a style="margin: 10px;" id="" href="join/" class="btn btn-dark">회원가입</a>			
				</form>
			</div>
		</div>

	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>