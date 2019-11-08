<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	width: 100%;
	float: left;
	box-sizing: border-box;
}

div.dropdown {
	float: right;
	box-sizing: border-box;
}
/* 수정 */
.content {
	height: 740px;
	padding : 50px;
}

.form-control {
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="../common/agencyHeader.jsp"></jsp:include>

	<div class="content">
		<div class="title">
			<img style="height: 40px" src="<%=application.getContextPath()%>/resources/image/title/request.png" alt="요청게시판"/>
			<hr style="color: grey; height: 2px;">
			<img style="height: 30px; margin-bottom: 10px;" src="<%=application.getContextPath()%>/resources/image/title/request_list.png" alt="요청목록"/>
		</div>
		<div>
			<table style="margin: auto; text-align: center;"
				class="table table-sm">
				<thead>
					<tr style="background-color: #dcdcdc">
						<th scope="col">요청 번호</th>
						<th scope="col">필요시간</th>
						<th scope="col">요청 기관</th>
						<th scope="col">접수 날짜</th>
						<th scope="col">배송 상태</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${requestList}" var="req">
						<tr>
							<td style="width: auto; vertical-align: middle"><a
								href="javascript:popupOpen(${req.order_id});">${req.order_id}</a></td>
							<td style="width: auto; vertical-align: middle">${req.order_need_time}</td>
							<td style="width: auto; vertical-align: middle">${req.order_agency_id}</td>
							<td style="width: auto; vertical-align: middle"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${req.order_date}"></fmt:formatDate> </td>
							<td style="width: auto; vertical-align: middle">
								<c:if test="${req.order_status == 'REQUESTED'}">
									<button type="button" class="btn btn-outline-info">접수</button>
								</c:if> 
								<c:if test="${req.order_status == 'DELIEVERING'}">
									배송 중
								</c:if>
								<c:if test="${req.order_status == 'DELIEVERED'}">
									배송 완료
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="display: flex;">
			<div style="flex-grow: 1; margin: auto; text-align: center;">
				<a href="?pageNo=1" class="btn btn-outline-dark">처음</a>

				<c:if test="${groupNo>1}">
					<a href="?pageNo=${startPageNo-1}"
						class="btn btn-outline-info">이전</a>
				</c:if>

				<div style="display: inline-block;" class="btn-toolbar"
					role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group mr-2" role="group" aria-label="First group">
						<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
							<c:if test="${pageNo==i}">
								<a href="?pageNo=${i}" class="btn btn-light active">${i}</a>
							</c:if>
							<c:if test="${pageNo!=i}">
								<a href="?pageNo=${i}" class="btn btn-light">${i}</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<c:if test="${groupNo<totalGroupNum}">
					<a href="?pageNo=${endPageNo+1}"
						class="btn btn-outline-info">다음</a>
				</c:if>
				<a href="?pageNo=${totalPageNum}"
					class="btn btn-outline-dark">맨끝</a>
			</div>
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function popupOpen(order_id){
		var popUrl = "<%=request.getContextPath()%>/request/medrequest_popuplist?order_id="+ order_id;
		//html을 하나 더 만들어서 목록을 띄움
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
		console.log("1")
	}
</script>
</html>