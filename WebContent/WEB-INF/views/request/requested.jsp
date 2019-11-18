<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="requested">		
	<table style="margin: auto; text-align:center;" class="table table-sm">
	  <thead>
	    <tr style="background-color:#dcdcdc">
	      <th scope="col">의약품 번호</th>
	      <th scope="col">이름</th>			      
	      <th scope="col">무게(g)</th>
	      <th scope="col">수량</th>
	      <th scope="col">담기</th>
	    </tr>
	  </thead>
	 <tbody id="ajaxResult">
	  	<c:forEach items="${requested}" var="req">
	  		<tr id="reset${reset}">
	  			<td class="col_sup_id" id="${req.sup_id}" style="vertical-align: middle;">${req.sup_id}</td>
	  			<td class="col_sup_name" id="${req.sup_name}" style="vertical-align: middle; width: auto">${req.sup_name}</td>
	  			<td class="col_sup_weight" id="${req.sup_weight}"style="vertical-align: middle; width: auto">${req.sup_weight}</td>
	  			<td style="vertical-align: middle; width: auto">
	  				<input name="inputtext" id="sup_amount${req.sup_id}"  type="number" class="form-control" placeholder="최대 ${req.sup_amount}개 선택 가능" >
	  			</td>	  		
	  			<c:if test="${req.sup_amount != 0}">	
		  			<td style="vertical-align: middle;">	  				
		  				<button name="btn" type="button" class="btn btn-outline-info" id="completeBtn${req.sup_id}" 
		  				onclick="completeBtnClick(${req.sup_id}, ${req.sup_amount}, $('#sup_amount${req.sup_id}').val());" >담기</button>
					</td>	
				</c:if>
	  		</tr>			  	
		</c:forEach>
		 
	  </tbody>
	</table>
	
</div>
<div style="display:flex;">
	 <div style="flex-grow:1; margin:auto; text-align: center;">
		<a onclick="requested(1)" class="btn btn-outline-dark">처음</a>
		
		<c:if test="${groupNo>1}">
			<a onclick="requestedList(${startPageNo-1})" class="btn btn-outline-info">이전</a>
		</c:if>
		
		<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		  <div class="btn-group mr-2" role="group" aria-label="First group">
		  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
		  		<c:if test="${pageNo==i}">
		  			<a onclick="requestedList(${i})" class="btn btn-light active">${i}</a>
		  		</c:if>
		  		<c:if test="${pageNo!=i}">
		  		<a onclick="requestedList(${i})" class="btn btn-light">${i}</a>
		  		</c:if>
		  	</c:forEach>
		  </div>
		</div>							
		<c:if test="${groupNo<totalGroupNum}">
			<a onclick="requestedList(${endPageNo+1})" class="btn btn-outline-info">다음</a>
		</c:if>
		<a onclick="requestedList(${totalPageNum})" class="btn btn-outline-dark">맨끝</a>
	</div>
	<div class="form-inline my-2 my-lg-0">
		<!--  <form class="form-inline my-2 my-lg-0" method="post"
			action="searchMedicine">-->
			 
			<input class="form-control mr-sm-2" id="searchName"name="searchName" type="text" placeholder="Search"aria-label="Search" >
         <button class="btn btn-outline-success my-2 my-sm-0" onclick="searchRequestMedicine()">검색</button>
		
		<!--</form>-->
	</div>

</div>

		