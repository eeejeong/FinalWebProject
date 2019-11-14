<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
	<c:forEach items="${medicineList}" var="med">
	   <!-- items들어있는 요소 수 만큼 반복... -->
	   <tr>
		<td class="col_sup_id" id="${med.sup_id}" style="vertical-align: middle;">${med.sup_id}</td>
		<td class="col_sup_name" id="${med.sup_name}" style="vertical-align: middle; width: auto">${med.sup_name}</td>
		<td class="col_sup_weight" id="${med.sup_weight}"style="vertical-align: middle; width: auto">${med.sup_weight}</td>
		<td style="vertical-align: middle; width: auto">
			<input name="inputtext" id="sup_amount${med.sup_id}"  type="number" class="form-control" placeholder="최대 ${med.sup_amount}개 선택 가능" >
		</td>	  		
		<c:if test="${med.sup_amount != 0}">	
			<td style="vertical-align: middle;">	  				
			<button name="btn" type="button" class="btn btn-outline-info" id="completeBtn${med.sup_id}" 
			onclick="completeBtnClick(${med.sup_id}, ${med.sup_amount}, $('#sup_amount${med.sup_id}').val());" >담기</button>
			</td>	
		</c:if>     
		</tr>
	</c:forEach>
</table>
