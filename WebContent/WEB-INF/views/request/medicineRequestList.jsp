<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="medeicineListTable">		
	<table style="margin: auto; text-align:center;" class="table table-sm">
	  <thead>
	    <tr style="background-color:#dcdcdc">
	      <th scope="col">선택 </th>
	      <th scope="col">의약품 번호</th>
	      <th scope="col">이름</th>			      
	      <th scope="col">무게(g)</th>
	      <th scope="col">수량</th>
	      <th scope="col">담기</th>
	    </tr>
	  </thead>
	  <tbody>
	 
	  	<c:forEach items="${medrequestList}" var="med">
	  		<tr id="reset${reset}">
	  			<td width="50" style="vertical-align:middle;">
			     	 <input id="checkbox${med.sup_id}" type="checkbox" name="medicineCheckBox" onclick="checkboxClick(${med.sup_id});"> </td>
	  			<td class="col_sup_id" id="${med.sup_id}" style="vertical-align: middle;">${med.sup_id}</td>
	  			<td class="col_sup_name" id="${med.sup_name}" style="vertical-align: middle; width: auto">${med.sup_name}</td>
	  			<td class="col_sup_weight" id="${med.sup_weight}"style="vertical-align: middle; width: auto">${med.sup_weight}</td>
	  			<td style="vertical-align: middle; width: auto">
	  				<input name="inputtext" id="sup_amount${med.sup_id}"  type="number" class="form-control" placeholder="최대 ${med.sup_amount}개 선택 가능" readonly>
	  			</td>
	  			
	  			<td style="vertical-align: middle;">
	  				<button name="btn" type="button" class="btn btn-outline-info" id="completeBtn${med.sup_id}" 
	  				onclick="completeBtnClick(${med.sup_id}, ${med.sup_amount}, $('#sup_amount${med.sup_id}').val());" disabled>담기</button>
				</td>
				
	  		</tr>			  	
		</c:forEach>
		 
	  </tbody>
	</table>
	
</div>
<div style="display:flex;">
	 <div style="flex-grow:1; margin:auto; text-align: center;">
		<a href="medrequestList?pageNo=1" class="btn btn-outline-dark">처음</a>
		
		<c:if test="${groupNo>1}">
			<a href="medrequestList?pageNo=${startPageNo-1}" class="btn btn-outline-info">이전</a>
		</c:if>
		
		<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
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
			<a href="medrequestList?pageNo=${endPageNo+1}" class="btn btn-outline-info">다음</a>
		</c:if>
		<a href="medrequestList?pageNo=${totalPageNum}" class="btn btn-outline-dark">맨끝</a>
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

		