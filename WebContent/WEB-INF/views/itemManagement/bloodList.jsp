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
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">	
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
							window.location.replace("http://localhost:8080/FinalWebProject/itemManagement/bloodList");
						}
					});		
				}
			});			
		});
		
		</script>
	
	</head>
	<body>
		<h3>혈액 관리</h3>
		총 개수: ${totalBloodRowNum}
		
		<table class="table table-sm">
		  <thead>
		    <tr style="background-color: #dcdcdc">
		      <th scope="col">체크박스</th>
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
			      <td>
			     	 <input type="checkbox" name="bloodCheckBox">
					<!-- 
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="customCheck${blood.sup_id}" name="bloodCheckBox">
						<label class="custom-control-label" for="customCheck${blood.sup_id}"></label>
					</div>
					 -->
			      </td>
			      <td>${blood.sup_id}</td>
			      <td>${blood.sup_name}</td>
			      <td>${blood.sup_amount}</td>
			      <td>${blood.sup_weight}</td>
			      <td>수정</td>
			    </tr>
			</c:forEach>
		  </tbody>
		</table>
		<div> 
			<a href="addBloodForm" class="btn btn-dark pull-right">추가</a>
			<button type="button" class="btn btn-outline btn-danger" id="deleteBtn">삭제</button>
		</div>

	</body>
</html>