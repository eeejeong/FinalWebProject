<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<th scope="col">수취 확인</th>
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
						<button type="button" class="btn btn-outline-secondary" disabled>배송 완료</button>
					</td>
					<td style="width: auto; vertical-align: middle">
						<c:if test="${req.delivered_check == 'Y'}">
							<button type="button" class="btn btn-outline-pink" disabled>수취 확인</button>
						</c:if> 
						<c:if test="${req.delivered_check == 'N'}">
							<button type="button" class="btn btn-outline-mint" disabled>수취 미확인</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div style="display: flex;">
	<div style="flex-grow: 1; margin: auto; text-align: center;">
		<button type="button" onclick="listDelivered(1)"  class="btn btn-outline-dark">처음</button>

		<c:if test="${groupNo>1}">
			<button type="button" onclick="listDelivered(${startPageNo-1})" 
				class="btn btn-outline-info">이전</button>
		</c:if>

		<div style="display: inline-block;" class="btn-toolbar"
			role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group mr-2" role="group" aria-label="First group">
				<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
					<c:if test="${pageNo==i}">
						<button type="button" onclick="listDelivered(${i})" class="btn btn-light active">${i}</button>
					</c:if>
					<c:if test="${pageNo!=i}">
						<button type="button" onclick="listDelivered(${i})" class="btn btn-light">${i}</button>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<c:if test="${groupNo<totalGroupNum}">
			<button type="button"  onclick="listDelivered(${endPageNo+1})" 
				class="btn btn-outline-info">다음</button>
		</c:if>
		<button type="button" onclick="listDelivered(${totalPageNum})"
			class="btn btn-outline-dark">맨끝</button>
	</div>
	
</div>