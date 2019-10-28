<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				height: 700px;
				padding-left: 30px;
				padding-right: 30px;
				}
			.form-control{
				text-align: center;
			}	
		</style>
		
		<script type="text/javascript">			
		// 의약품 삭제
		function deleteMed(){
				var deleteMedicine = new Array();
				var checkbox = $("input[name=medicineCheckBox]:checked");
				
				if($("input[name=medicineCheckBox]:checked").length == 0) {
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
						deleteMedicine.push(sup_id);	
					});
		
					jQuery.ajaxSettings.traditional = true;

					$.ajax({
						url: 'deleteMedicine',
						data: {"deleteMedicine": deleteMedicine},
						success: function(data) {
							alert("삭제 완료");   
							location.replace("http://localhost:8080/FinalWebProject/itemManagement/medicineList");
						}
					});		
				}
		}
		
		function update(sup_id){
			$("#updateBtn"+sup_id).css("display", "none");
			$("#completeBtn"+sup_id).css("display", "inline");
			$("#sup_name"+sup_id).prop("readonly", false);
			$("#sup_amount"+sup_id).prop("readonly", false);
			$("#sup_weight"+sup_id).prop("readonly", false);
		}
		
		function complete(sup_id){
			$("#updateBtn"+sup_id).css("display", "inline");
			$("#completeBtn"+sup_id).css("display", "none");		
			$.ajax({
				url: "updateMedicine",
				data: {
					sup_id: sup_id, 
					sup_name:$("#sup_name"+sup_id).val(), 
					sup_amount:$("#sup_amount"+sup_id).val(), 
					sup_weight:$("#sup_weight"+sup_id).val()},
				method: "post"
			});
			$("#sup_name"+sup_id).prop("readonly", true);
			$("#sup_amount"+sup_id).prop("readonly", true);
			$("#sup_weight"+sup_id).prop("readonly", true);	
		}
		
		</script>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/hospitalMenubar.jsp"></jsp:include>
		
		<div class="content">
		<h1>의약품 관리</h1>
		<div>
			<div class="title">	<h3>백신 관리</h3> </div>	
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
		<div> 
			<table style="margin: auto; text-align:center;" class="table table-sm">
			  <thead>
			    <tr style="background-color:#dcdcdc">
			      <th scope="col">선택</th>
			      <th scope="col">번호</th>
			      <th scope="col">이름</th>
			      <th scope="col">수량</th>
			      <th scope="col">무게</th>
			      <th scope="col">수정</th>
			    </tr>
			  </thead>
			  <tbody>
				<c:forEach items="${medicineList}" var="med"> <!-- items들어있는 요소 수 만큼 반복... -->
				    <tr>
				      <td width="50" style="vertical-align:middle;">
					     	 <input type="checkbox" name="medicineCheckBox">
				      <td>${med.sup_id}</td>
				      <td style="width:auto; vertical-align:middle">
				      	<input id="sup_name${med.sup_id}"  type="text" class="form-control" value="${med.sup_name}" readonly>
					  </td>
				      <td style="width:auto; vertical-align:middle">
					    <input id="sup_amount${med.sup_id}" type="number" class="form-control" value="${med.sup_amount}" readonly>
					  </td>
				      <td style="width:auto; vertical-align:middle">
				      	<input id="sup_weight${med.sup_id}" type="number" class="form-control" value="${med.sup_weight}" readonly>
				      </td>
				      <td>
				      <button type="button" class="btn btn-outline-info" id="updateBtn${med.sup_id}" onclick="update(${med.sup_id})" style="display:inline">수정</button>
				      <button type="button" class="btn btn-outline-info" id="completeBtn${med.sup_id}" onclick="complete(${med.sup_id})" style="display:none">완료</button>
				      </td>
				    </tr>
				</c:forEach>
			  </tbody>
			</table>
		</div>
		<div style="display:flex;">
			 <div style="flex-grow:1; margin:auto; text-align: center;">
				<a href="medicineList?pageNo=1" class="btn btn-outline-dark">처음</a>
				
				<c:if test="${groupNo>1}">
					<a href="medicineList?pageNo=${startPageNo-1}" class="btn btn-outline-info">이전</a>
				</c:if>
				
				<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group mr-2" role="group" aria-label="First group">
				  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
				  		<c:if test="${pageNo==i}">
				  			<a href="medicineList?pageNo=${i}" class="btn btn-light active">${i}</a>
				  		</c:if>
				  		<c:if test="${pageNo!=i}">
				  		<a href="medicineList?pageNo=${i}" class="btn btn-light">${i}</a>
				  		</c:if>
				  	</c:forEach>
				  </div>
				</div>							
				<c:if test="${groupNo<totalGroupNum}">
					<a href="medicineList?pageNo=${endPageNo+1}" class="btn btn-outline-info">다음</a>
				</c:if>
				<a href="medicineList?pageNo=${totalPageNum}" class="btn btn-outline-dark">맨끝</a>
			</div>
			<div>
				<a href="addMedicineForm" class="btn btn-secondary">추가</a>
				<button type="button" class="btn btn-outline btn-danger" id="deleteBtn" onclick="deleteMed()">삭제</button>
			</div>
		</div> 
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>