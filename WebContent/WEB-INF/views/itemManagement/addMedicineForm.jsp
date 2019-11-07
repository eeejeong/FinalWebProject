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
				height: 700px;
				padding-left: 30px;
				padding-right: 30px;
				}
		</style>
		<script type="text/javascript">
			function checkForm(){
				var result = true;
				//모든 error 내용 지우기 
				$(".error").text("");
				//입력값 검사 
				if($("#sup_name").val() == ""){
					$("#sup_nameError").text("*의약품명을 입력하세요.");
					result = false;
				}
				if($("#sup_amount").val() == ""){
					$("#sup_amountError").text("*수량을 입력하세요.");
					result = false;
				}
				if($("#sup_weight").val() == ""){
					$("#sup_weightError").text("*무게를 입력하세요.");
					result = false;
				}
				return result;
			}
			
			function checkMedName(){
				$.ajax({
					url: "checkMedName",
					data:{sup_name:$("#sup_name").val()},
					success:function(data){
						if(!data.result){
							$("#sup_nameError").text("*이미 존재하는 의약품입니다.");
						    $("#completeBtn").prop("disabled",true);
						}
						else{
							$(".error").text("");
							$("#completeBtn").prop("disabled",false);
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<jsp:include page="../common/agencyHeader.jsp"></jsp:include>
			<div class="content">
				<h1>의약품 관리</h1>
				<h3>의약품 추가</h3>
				<form method="post" action="addMedicine" onsubmit="return checkForm()">
				  <div class="form-group row">
				    <label for="sup_name" class="col-sm-2 col-form-label">의약품명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="sup_name" name="sup_name" oninput="checkMedName()" >
				      <span id="sup_nameError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="sup_amount" class="col-sm-2 col-form-label">의약품수량</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="sup_amount" name="sup_amount">
				      <span id="sup_amountError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="sup_weight" class="col-sm-2 col-form-label">의약품무게</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="sup_weight" name="sup_weight">
				      <span id="sup_weightError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group" style="float: right">
				  	<input type="submit" class="btn btn-success" id="completeBtn" value="완료"/>
				  </div>
				</form>
			</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>