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
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/jquery-ui-1.12.1/jquery-ui-timepicker-addon.css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/jquery-ui-1.12.1/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/jquery-timepicker/jquery.timepicker.css" />
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/jquery-timepicker/jquery.timepicker.min.js"></script>
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
	height: 1000px;
	padding: 50px;
}

.form-control {
	text-align: center;
}
</style>



<script type="text/javascript">
	$(function() {
		$("#time1").timepicker({
			step : 5, //시간간격 : 5분
			timeFormat : "H:i" //시간:분 으로표시
		});
	});

	$(document).ready(function() {
		$("#time1").timepicker('setTime', new Date());
	});

	$(function() {
		$("#date2").datepicker({
			showOn : "both",
			buttonImage : "../resources/image/calendar.gif",
			buttonImageOnly : true,
			buttonText : "Select date"
		});

	});

	window.rCheck = false;
	function first() {
		if (!rCheck) {
			rCheck = true;
			medicineRequestList(1);
		}
	}

	/*
	function checkboxClick(sup_id) {
		if ($("#checkbox" + sup_id).prop("checked")) {
			$("#sup_amount" + sup_id).prop("readonly", false);
			$("#completeBtn" + sup_id).prop("disabled", false);
		}
		if ($("#checkbox" + sup_id).prop("checked") == false) {
			$("#sup_amount" + sup_id).prop("readonly", true);
			$("#completeBtn" + sup_id).prop("disabled", true);
		}
	}
	*/

	function completeBtnClick(sup_id, sup_amount, request_amount) {
		$("input[name=inputtext]").val("");
		$("input[name=inputtext1]").val("");
		if (request_amount == "") {
			alert("수량을 입력해주세요.");
		} else {
			if (sup_amount < request_amount) {
				alert("최대 개수를 넘었습니다.");
			}
			if (sup_amount >= request_amount) {
				$('#completeBtn' + sup_id).css("display", "none");
				$.ajax({
					url : "searchItemById?sup_id=" + sup_id,
					success : function(data) {
						$("#resultList")
								.append(
										"<tr>"
										+ '<td> <input name="col1" class="form-control" value="' + sup_id + '" readonly/> </td>'
										+ '<td> <input name="col2" class="form-control" value="' + data.sup_class + '" readonly/> </td>'
										+ '<td> <input name="col3" class="form-control" value="' + data.sup_name + '" readonly/> </td>'
										+ '<td> <input name="col4" class="form-control" value="' + request_amount + '" readonly/> </td>'
										+ '<td> <input name="col5" id="eachTotalWeight" class="form-control" value="'
										+ (data.sup_weight * request_amount)
										+ '" readonly/> </td>'
										+ '<td> <input name="delete" onclick="deleteRow(this,'
										+ sup_id
										+ ');" type="button" class="btn btn-outline-danger" value="삭제 "/></td>'
										+ "</tr>");
					}
				});
			}
		}
	}

	function deleteRow(obj, sup_id) {
		var tr = $(obj).parent().parent();
		$('#completeBtn' + sup_id).css("display", "inline");
		tr.remove();
	}

	function medicineRequestList(pageNo) {
		$.ajax({
			url : 'medicineRequestList?pageNo=' + pageNo,
			success : function(data) {
				$('#itemTable').html(data)
			}
		});
	}

	function bloodRequestList() {
		$.ajax({
			url : 'bloodRequestList',
			success : function(data) {
				$('#itemTable').html(data)
			}
		});
	}

	function totalWeight() {
		var $dataRows = $("#requestTable tr:not('#titleRow')");
		var totalWeight = 0;
		$dataRows.each(function() {
			$(this).find('#eachTotalWeight').each(function(i) {
				totalWeight += parseInt($(this).val());
			});
		});
		if (totalWeight > 3000) {
			alert("최대 무게 3KG을 넘었습니다.");
			return false;
		} else {
			$('#totalWeightInput').val(totalWeight);
			return true;
		}
	}

	function completeRequestBtn(date, time) {
		var checkTotalWeight = totalWeight();
		if (checkTotalWeight) {
			var needDate = date + " " + time;
			var itemArray = [];
			// 첫 제목 행을 제외한 테이블 행 수
			var len = ($("#requestTable tr").length) - 1;

			for (var i = 0; i < len; i++) {
				var item = "";
				item += $("input[name=col1]").eq(i).val() + ",";
				item += $("input[name=col2]").eq(i).val() + ",";
				item += $("input[name=col3]").eq(i).val() + ",";
				item += $("input[name=col4]").eq(i).val() + ",";
				item += $("input[name=col5]").eq(i).val()
				itemArray.push(item);
			}

			jQuery.ajaxSettings.traditional = true;

			$.ajax({
				method : "POST",
				data : {
					"itemArray" : itemArray,
					"needDate" : needDate
				},
				url : 'requestComplete',
				error : function(request, error) {
					alert("필요한 의료품을 담아주세요")
					/* alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error); */
				},
				success : function(data) {
					if (data.result == "ok") {
						alert("!!");
						location.replace("http://localhost:8080/FinalWebProject/request/");
					}
				}
			});
		}
	}
</script>

</head>

<body onload="first()">
	<jsp:include page="../common/agencyHeader.jsp"></jsp:include>
	<div class="content">
		<div class="title">
			<img style="height: 40px;"
				src="<%=application.getContextPath()%>/resources/image/title/request_register.png"
				alt="의약품 요청 등록" />
			<hr style="color: grey; height: 2px;">
		</div>
		<img style="height: 30px; margin-bottom: 10px;"
			src="<%=application.getContextPath()%>/resources/image/title/request_item_list.png"
			alt="의약품 목록" />

		<div class="dropdown">
			<a class="btn btn-primary dropdown-toggle" href="#" role="button"
				id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 품목 선택 </a>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				<button class="dropdown-item" type="button" onclick="medicineRequestList(1);">백신</button>
				<button class="dropdown-item" type="button" onclick="bloodRequestList();">혈액</button>
			</div>
		</div>

		<div id="itemTable"></div>
		<br>
		<div>
			<div class="title">
				<img style="height: 30px; margin-bottom: 10px;"
					src="<%=application.getContextPath()%>/resources/image/title/request_register_list.png"
					alt="요청 담기 목록" />
			</div>
			<form>
				<table id="requestTable" style="margin: auto; text-align: center;"
					class="table table-sm">
					<thead>
						<tr id="titleRow" style="background-color: #dcdcdc">
							<th scope="col">의약품 번호</th>
							<th scope="col">분류</th>
							<th scope="col">이름</th>
							<th scope="col">수량</th>
							<th scope="col">무게(g)</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="resultList">
					</tbody>
				</table>
			</form>
		</div>

		<form style="float: right;" class="form-inline my-2 my-lg-0" method="post">
			<div style="display: flex; margin-top: 10px;">
				<input class="form-control mr-sm-2" type="text" name="date"
					id="date2" size="8" /> <input class="form-control mr-sm-2"
					type="text" name="time1" value="" placeholder="시간선택" id="time1"
					required size="8" maxlength="5">
				<div style="height: 20px;" class="input-group mb-3">
				  <div class="input-group-prepend">
				    <button class="btn btn-outline-dark" type="button" id="button-addon1" onclick="totalWeight()">총 무게 계산</button>
				  </div>
				<input class="form-control mr-sm-2" id="totalWeightInput" name="totalWeightInput" type="text" placeholder="총 무게" aria-label="총 무게" />
				</div>				
				<h6 style="margin-right: 5px; margin-top: 10px;">g</h6>
				<input type="submit" class="btn btn-mint" onclick="completeRequestBtn(date2.value, time1.value)" value="요청 완료" />
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>