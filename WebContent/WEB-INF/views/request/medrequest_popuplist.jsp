<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
				}
			.form-control{
				text-align: center;
			}	
		</style>
		
	</head>
	
	<body>
		<div class="content">
			<div> 
				<table style="margin: auto; text-align:center;" class="table table-sm">
				  <thead>
				    <tr style="background-color:#dcdcdc">
				   	  <th scope="col">No.</th>
				      <th scope="col">의약품 명</th>
				      <th scope="col">수량</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="size" value="${fn:length(medrequest_popuplist1)}" />
					 <c:forEach var="i" begin="0" end="${size-1}">
					    <tr>
					      <td style="width:auto; vertical-align:middle">${sup_names[i]}</td>
					      <td style="width:auto; vertical-align:middle">${sup_names[i]}</td>
					      <td style="width:auto; vertical-align:middle">${medrequest_popuplist1[i].item_amount}</td>
					    </tr>
					</c:forEach>
				  </tbody>
				</table>
			</div>
		</div>
	</body>
</html>