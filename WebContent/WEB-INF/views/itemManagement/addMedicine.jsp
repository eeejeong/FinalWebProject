<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
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
		<style>
			.content{
				float:left;
				width:80%;
				position: absolute;
    			left: 17%;
			}
			.center{
				width:100%;
				overflow:hidden;
			}
		</style>
		<script type="text/javascript">		
		</script>
	</head>
	<body>
		<jsp:include page="../common/hospitalHeader.jsp"></jsp:include>
		<div class="center">		
			<div class="content">
				<h1>의약품 관리</h1>
				<h3>의약품 추가</h3>
				<form>
				  <div class="form-group row">
				    <label for="inputName" class="col-sm-2 col-form-label">의약품명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputName">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputAmount" class="col-sm-2 col-form-label">의약품수량</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputAmount">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputUsage" class="col-sm-2 col-form-label">의약품용도</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputUsage">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputWeight" class="col-sm-2 col-form-label">의약품무게</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputWeight">
				    </div>
				  </div>
				  <div class="form-group">
				  	<input type="submit" class="btn btn-secondary" value="완료"/>
				  </div>
				</form>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>

	</body>
</html>