<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
		<style>
			div.title {
				float: left;
				box-sizing: border-box;    
			}
			div.dropdown {
				float: right;
				box-sizing: border-box;
			}
			/* 수정 */
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
		// 의약품 삭제
		$(function(){
			$("#deleteBtn").click(function onclick(){ 
				var deleteBlood = new Array();
				var checkbox = $("input[name=bloodCheckBox]:checked");
				
				if($("input[name=bloodCheckBox]:checked").length == 0) {
					alert("삭제할 항목을 선택해주세요.");
				} else {					
					// 체크된 체크박스 값을 가져온다
					checkbox.each(function(i) {
						// checkbox.parent() : checkbox의 부모는 <td>이다.
						// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
						var tr = checkbox.parent().parent().eq(i);
						var td = tr.children();
														
						// td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져온다.
						var sup_id = td.eq(1).text();
											
						// 가져온 값을 배열에 담는다.
						deleteBlood.push(sup_id);	
					});
		
					jQuery.ajaxSettings.traditional = true;

					$.ajax({
						url: 'deleteBlood',
						data: {"deleteBlood": deleteBlood},
						success: function(data) {
							alert("삭제 완료");   
							location.replace("http://localhost:8080/FinalWebProject/itemManagement/bloodList");
						}
					});		
				}
			});		
			$("#updateBtn").click(function onclick() {
				alert("구현하자");
			});
		});
		
		</script>
	
	</head>
	<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="center"> 
		<jsp:include page="../common/sidebar.jsp"></jsp:include>
		<div class="content">
			<h1>의약품 관리</h1>	
			<div>
				<div class="title">	<h3>혈액 관리</h3> </div>	
				<div class="dropdown">
					<a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						품목 선택
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="medicineList">백신</a>
						<a class="dropdown-item" href="bloodList">혈액</a>
					</div>
				</div>
			</div>
			<!-- 총 개수: ${totalBloodRowNum} -->
			<div>
				<table style="margin: auto; text-align:center;" class="table table-sm">
				  <thead>
				    <tr style="background-color: #dcdcdc">
				      <th scope="col">선택</th>
				      <th scope="col">번호</th>
				      <th scope="col">이름</th>
				      <th scope="col">수량</th>
				      <th scope="col">무게</th>
				      <th scope="col">수정</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${bloodList}" var="blood">
						<tr>
					      <td width="50" style="vertical-align:middle;">
					     	 <input type="checkbox" name="bloodCheckBox">
							<!-- 
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customCheck${blood.sup_id}" name="bloodCheckBox">
								<label class="custom-control-label" for="customCheck${blood.sup_id}"></label>
							</div>
							 -->
					      </td>
					      <td style="vertical-align:middle;">${blood.sup_id}</td>
					      <td style="vertical-align:middle;">${blood.sup_name}</td>
					      <td style="vertical-align:middle;">${blood.sup_amount}</td>
					      <td style="vertical-align:middle;">${blood.sup_weight}</td>
					      <td><button type="button" class="btn btn-outline-info" id="updateBtn">수정</button></td>
					    </tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
			<div style="float:right"> 
				<a href="addBloodForm" class="btn btn-dark">추가</a>
				<button type="button" class="btn btn-outline btn-danger" id="deleteBtn">삭제</button>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>