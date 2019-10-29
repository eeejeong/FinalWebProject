<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
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
.content {
	height: 2000px;
	padding-left: 30px;
	padding-right: 30px;
}

.form-control {
	text-align: center;
}
</style>

<script type="text/javascript">
			window.rCheck = false; 
			function first() { 
				if (!rCheck) { 
					rCheck = true; 
					medicineRequestList(); 
				} 
			} 

			function checkboxClick(sup_id) {
				$("#sup_amount"+sup_id).prop("readonly", false);
				$("#completeBtn"+sup_id).prop("disabled", false);
			}
			function completeBtnClick(sup_id, sup_amount) {	
				$("#sup_amount"+sup_id).prop("readonly", true);
				$("#completeBtn"+sup_id).prop("disabled", true);
				$("#checkbox"+sup_id).prop("checked", false);
				$.ajax({
					url:"searchItemById?sup_id=" + sup_id,
					success:function(data){
						$("#resultList").append("<tr>" 
								+ '<td> <input class="form-control" value="' + sup_id + '" readonly/> </td>' 
								+ '<td> <input class="form-control" value="' + data.sup_class + '" readonly/> </td>' 
								+ '<td> <input class="form-control" value="' + data.sup_name + '" readonly/> </td>' 
								+ '<td> <input class="form-control" value="' + data.sup_weight + '" readonly/> </td>' 
								+ '<td> <input class="form-control" value="' + sup_amount + '" readonly/> </td>' 
								+ '<td> <input onclick="deletee(this);" type="button" class="btn btn-outline-danger" value="삭제 "/></td>' 								
								+ "</tr>");	
					}
				});
							
			}
			function deletee(obj){
				var tr = $(obj).parent().parent();
				
				tr.remove();
			}
			
			function medicineRequestList() {
				$.ajax({
					url:"medicineRequestList",
					success:function(data){
						$('#itemTable').html(data)
					}
				});
			}
			
			function bloodRequestList() {
				$.ajax({
					url:"bloodRequestList",
					success:function(data){
						$('#itemTable').html(data)
					}
				});
			}			
		</script>
</head>
<body onload="first()">
	<jsp:include page="../common/publicHealthHeader.jsp"></jsp:include>

	<div class="content">
		<h1 style="color: pink">의약품 요청</h1>
		<div>
			<div class="title">
				<h3>의약품 목록</h3>
			</div>
			<div class="dropdown">
				<a class="btn btn-primary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 품목 선택 </a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<button class="dropdown-item" type="button"
						onclick="medicineRequestList();">백신</button>
					<button class="dropdown-item" type="button"
						onclick="bloodRequestList();">혈액</button>
				</div>
			</div>
		</div>
		<div id="itemTable"></div>
		<br>
		<div id="requestTable">
			<div class="title">
				<h3>요청 담기 목록</h3>
			</div>
			<form>
				<table style="margin: auto; text-align: center;"
					class="table table-sm">
					<thead>
						<tr style="background-color: #dcdcdc">
							<th scope="col">의약품 번호</th>
							<th scope="col">분류</th>
							<th scope="col">이름</th>
							<th scope="col">무게</th>
							<th scope="col">수량</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="resultList">

					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div style="display: flex;">
		<div style="flex-grow: 1; margin: auto; text-align: center;">
			<a href="medrequestList?pageNo=1" class="btn btn-outline-dark">처음</a>

			<c:if test="${groupNo>1}">
				<a href="medrequestList?pageNo=${startPageNo-1}"
					class="btn btn-outline-info">이전</a>
			</c:if>

			<div style="display: inline-block;" class="btn-toolbar"
				role="toolbar" aria-label="Toolbar with button groups">
				<div class="btn-group mr-2" role="group" aria-label="First group">
					<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
						<c:if test="${pageNo==i}">
							<a href="medrequestList?pageNo=${i}" class="btn btn-light active">${i}</a>
						</c:if>
						<c:if test="${pageNo!=i}">
							<a href="medrequestList?pageNo=${i}" class="btn btn-light">${i}</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<c:if test="${groupNo<totalGroupNum}">
				<a href="medrequestList?pageNo=${endPageNo+1}"
					class="btn btn-outline-info">다음</a>
			</c:if>
			<a href="medrequestList?pageNo=${totalPageNum}"
				class="btn btn-outline-dark">맨끝</a>
		</div>
		<div>
			<form class="form-inline my-2 my-lg-0" method="post"
				action="searchMedicine">
				<input class="form-control mr-sm-2" id="searchName"
					name="searchName" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</div>
	<div style="float: right; display: flex">
		<div>
			<a href="#" class="btn btn-secondary">요청 완료</a>
			<button type="button" class="btn btn-outline btn-danger"
				id="deleteBtn" onclick="deleteMed()">삭제</button>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</body>
</html>