<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>의약품 관리</h1>
		<table class="table table-sm" >
		  <thead>
		    <tr style="background-color:#dcdcdc">
		      <th scope="col">체크박스</th>
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
			      <th scope="row"><input type="checkbox" aria-label="Checkbox for following text input"></th>
			      <td>${med.sup_id}</td>
			      <td>${med.sup_name}</td>
			      <td>${med.sup_amount}</td>
			      <td>${med.sup_weight}</td>
			      <td><button >수정</button></td>
			    </tr>
			</c:forEach>
		  </tbody>
		</table>
		<div style="display:flex;">
			 <div style="flex-grow:1; margin:auto">
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
				<a href="addMedicine" class="btn btn-secondary">추가</a>
				<button onclick="deleteMedicine" class="btn btn-outline-secondary">삭제</button> 
			</div>
		</div> 
		<a href="bloodList">혈액 관리</a>
	</body>
</html>