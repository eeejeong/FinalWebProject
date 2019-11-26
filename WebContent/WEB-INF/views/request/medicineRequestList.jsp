<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="medeicineListTable">		
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
	  	<c:forEach items="${medrequestList}" var="med">
	  		<tr id="reset${reset}">
	  			<td class="col_sup_id" id="${med.sup_id}" style="vertical-align: middle;">${med.sup_id}</td>
	  			<td class="col_sup_name" id="${med.sup_name}" style="vertical-align: middle; width: auto">${med.sup_name}</td>
	  			<td class="col_sup_weight" id="${med.sup_weight}"style="vertical-align: middle; width: auto">${med.sup_weight}</td>
	  			<td style="vertical-align: middle; width: auto">
	  				<input name="inputtext" id="sup_amount${med.sup_id}"  type="number" class="form-control" placeholder="최대 ${med.sup_amount}개 선택 가능" >
	  			</td>	  		
	  				
		  			<td style="vertical-align: middle;">	  				
		  				<c:if test="${med.sup_amount != 0}">
		  				<button name="btn" type="button" class="btn btn-outline-info" id="completeBtn${med.sup_id}" 
		  				onclick="completeBtnClick(${med.sup_id}, ${med.sup_amount}, $('#sup_amount${med.sup_id}').val());" >담기</button>
						</c:if>
					</td>			
	  		</tr>			  	
		</c:forEach>		 
	  </tbody>
	</table>
</div>
<div style="display:flex;">
	 <div style="flex-grow:1; margin:auto; text-align: center;">
		<a onclick="medicineRequestList(1)" class="btn btn-outline-dark">처음</a>
		
		<c:if test="${groupNo>1}">
			<a onclick="medicineRequestList(${startPageNo-1})" class="btn btn-outline-info">이전</a>
		</c:if>
		
		<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		  <div class="btn-group mr-2" role="group" aria-label="First group">
		  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
		  		<c:if test="${pageNo==i}">
		  			<a onclick="medicineRequestList(${i})" class="btn btn-light active">${i}</a>
		  		</c:if>
		  		<c:if test="${pageNo!=i}">
		  		<a onclick="medicineRequestList(${i})" class="btn btn-light">${i}</a>
		  		</c:if>
		  	</c:forEach>
		  </div>
		</div>							
		<c:if test="${groupNo<totalGroupNum}">
			<a onclick="medicineRequestList(${endPageNo+1})" class="btn btn-outline-info">다음</a>
		</c:if>
		<a onclick="medicineRequestList(${totalPageNum})" class="btn btn-outline-dark">맨끝</a>
	</div>
	<div class="form-inline my-2 my-lg-0">
		<!--  <form class="form-inline my-2 my-lg-0" method="post"
			action="searchMedicine">-->
			 
			<input class="form-control mr-sm-2" id="searchName"name="searchName" type="text" placeholder="Search"aria-label="Search" >
         <button class="btn btn-outline-success my-2 my-sm-0" onclick="searchRequestMedicine()">검색</button>
		
		<!--</form>-->
	</div>

</div>

		