<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
		<script type="text/javascript"
			src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
			.content{
				height: 740px;
				padding : 50px;
				}
			div.title {
				width: 100%;
				float: left;
				box-sizing: border-box;
			}
		</style>
		<script type="text/javascript">
			function checkForm() {
				var result = true;
				// 모든 에러 내용 지우기
				$(".error"). text("");
				
				// 입력값 검사
				if($("#sup_name").val() == "") {
					$("#sup_nameError").text("*혈액 종류를 입력하세요.");
					result = false;
				}
				if($("#sup_amount").val() == "") {
					$("#sup_amountError").text("*혈액 수량을 입력하세요.");
					result = false;
				}	
				if($("#sup_weight").val() == "") {
					$("#sup_weightError").text("*혈액 무게를 입력하세요.");
					result = false;
				}
			
				return result;
			}
			
			function checkBloodName() {	
				var inputName = $('#sup_name').val();
				$.ajax({
			        	url: "checkBloodName",
			        	data: {sup_name: inputName},
			        	success: function(data) {
			        		if(data.result==false) {
			        			$("#sup_nameError").text("*이미 존재하는 혈액 종류입니다.");
			        			$("#completeBtn").prop("disabled", true);
			        		} else {
			        			$("#sup_nameError").text("");
			        			$("#completeBtn").prop("disabled", false);
			        		}
			        	}
			       });
			}		
		</script>
	</head>
	<body>
		<jsp:include page="../common/agencyHeader.jsp"></jsp:include>
			<div class="content">
				<div class="title">
					<img style="height: 40px" src="<%=application.getContextPath()%>/resources/image/title/items.png" alt="의약품 관리"/>
					<hr style="color: grey; height: 2px;">		
				</div>
				<img style="height: 30px; margin-bottom: 10px;" src="<%=application.getContextPath()%>/resources/image/title/item_addBlood.png" alt="혈액 추가"/>
			
				<form method="post" action="addBlood" onsubmit="return checkForm()">
				  <div class="form-group row">
				    <label for="inputName" class="col-sm-2 col-form-label" >혈액 종류</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="sup_name" name="sup_name" oninput="checkBloodName()">
				       <span id="sup_nameError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputAmount" class="col-sm-2 col-form-label">혈액 수량</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="sup_amount" name="sup_amount">
				      <span id="sup_amountError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group row">
				    <label for="inputWeight" class="col-sm-2 col-form-label">혈액 무게</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" id="sup_weight" name="sup_weight">
				      <span id="sup_weightError" class="error" style="color:red"></span>
				    </div>
				  </div>
				  <div class="form-group" style="float: right">
				  	<input id="completeBtn" type="submit" class="btn btn-mint" value="완료"/>
				  </div>
				</form>
			</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>