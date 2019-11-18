<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="con-box"> 
	<table style="margin: auto; text-align:center;" class="table table-sm">
	  <thead>
	    <tr style="background-color:#dcdcdc">
	      <th scope="col">요청 번호 </th>
	      <th scope="col">필요 시간</th>
	      <th scope="col">요청 기관</th>
	      <th scope="col">접수 날짜</th>
	      <th scope="col">배송 상태</th>
	      <th scope="col">추가 기능</th>
	    </tr>
	  </thead>
	  <tbody>
		
		  <c:forEach items="${requestList}" var="req">
		    <tr>
		      <td style="width:auto; vertical-align:middle"><a href="javascript:popupOpen(${req.order_id});">${req.order_id}</a></td>
		      <td style="width:auto; vertical-align:middle">${req.order_need_time}</td>
		      <td style="width:auto; vertical-align:middle">${req.order_agency_id}</td>
		      <td style="width:auto; vertical-align:middle"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${req.order_date}"></fmt:formatDate></td>
		      <td style="width:auto; vertical-align:middle">
				<c:if test="${req.order_status == 'REQUESTED'}">
					<button type="button" class="btn btn-outline-mint" disabled>접수 완료</button>
				</c:if>
				<c:if test="${req.order_status == 'PREPARING'}">
					<button type="button" class="btn btn-outline-mint" disabled>배송 준비</button>
				</c:if>  
				<c:if test="${req.order_status == 'DELIVERING'}">
					<button type="button" class="btn btn-outline-mint" onclick="showPopup()">위치 확인</button>
				</c:if>
				<c:if test="${req.order_status == 'DELIVERED'}">
					<button type="button" class="btn btn-outline-mint" disabled>배송 완료</button>
				</c:if>
		      </td>
		      <td style="width:auto; vertical-align:middle">
		      	<c:choose>
				  <c:when test="${req.order_status == 'REQUESTED'}">
					  <button type="button" class="btn btn-outline-danger" onclick="cancelRequest(${req.order_id})">접수취소</button>
				  </c:when>
				  <c:when test="${req.order_status == 'DELIVERED' && req.delivered_check == 'N'}">
				 	  <button id="deliverSuccessBtn" type="button" class="btn btn-outline-info" onclick="deliverSuccess(${req.order_id}, '${req.order_agency_id}')">수취 확인</button>
				  </c:when>
				  <c:otherwise>
				   		-
				  </c:otherwise>
				</c:choose>
		      </td>
		    </tr>
		</c:forEach>
	  </tbody>
	</table>
</div>
<div id="con_bottom">
	 <div id="bottom_btn">
		<button type="button" onclick="listAll(1)"  class="btn btn-outline-dark">처음</button>
		
		<c:if test="${groupNo>1}">
			<button type="button" onclick="listAll(${startPageNo-1})"  class="btn btn-outline-info">이전</button>
		</c:if>
		
		<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		  <div class="btn-group mr-2" role="group" aria-label="First group">
		  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
		  		<c:if test="${pageNo==i}">
		  			<button type="button"  onclick="listAll(${i})" class="btn btn-light active">${i}</button>
		  		</c:if>
		  		<c:if test="${pageNo!=i}">
		  		<button type="button"  onclick="listAll(${i})" class="btn btn-light">${i}</button>
		  		</c:if>
		  	</c:forEach>
		  </div>
		</div>							
		<c:if test="${groupNo<totalGroupNum}">
			<button type="button"  onclick="listAll(${endPageNo+1})" class="btn btn-outline-info">다음</button>
		</c:if>
		<button type="button"  onclick="listAll(${totalPageNum})" class="btn btn-outline-dark">맨끝</button>
		<a href="request/totalRequestList" class="btn btn-mint submit_btn">요청 등록</a>
	</div>
</div> 