<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>	
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.bundle.min.js"></script>
		
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
	height: 1200px;
	padding: 50px;
}

.form-control {
	text-align: center;
}
</style>

<script type="text/javascript">
	

	$(function() {
		$("#timeInput").timepicker({
			step : 5, //시간간격 : 5분
			timeFormat : 'H:i' //시간:분 으로표시
		});
	});

	$(document).ready(function() {
		$("#timeInput").timepicker('setTime', new Date());
	});

	
	window.rCheck = false;
		
	function first() {
		if (!rCheck) {
			rCheck = true;
			medicineRequestList(1);
		}
	};
	
	$(function() {
		$("#dateInput").datepicker({
			dateFormat : 'yy-mm-dd',
			showOn : "both",
			buttonImage : "../resources/image/calendar.gif",
			buttonImageOnly : true,
			buttonText : "날짜 선택"
		});
		  $("img.ui-datepicker-trigger").attr("style", "margin: 6px 5px; height: 23px; vertical-align:middle; cursor: Pointer;");
		  $('#dateInput').insertAfter( $('#dateInput').next('img') );
	});
	
    // 이미 담은 물품인지 확인하는 function
	function checkRegistered(sup_id){
		// 첫 제목 행을 제외한 테이블 행 수
		var len = ($("#requestTable tr").length) - 1;
		if(len == 0) {
			return true;
		}
		for (var i = 0; i < len; i++) {		
			if(sup_id == $("input[name=col1]").eq(i).val()) {			
				alert("이미 담은 의약품입니다. 수정을 원하시면 삭제 후 다시 담아주세요.");
				return false;
			}		
		}
		return true;
	}
	
    // 담기 버튼을 눌렀을 때 실행하는 function
	function completeBtnClick(sup_id, sup_amount, request_amount) {
		$("input[name=inputtext]").val("");
		$("input[name=inputtext1]").val("");
		
		if(checkRegistered(sup_id)) {	
			if (request_amount == "") {
				alert("수량을 입력해주세요.");
			} else {
				if (sup_amount < request_amount) {
					alert("최대 개수를 넘었습니다.");
				} else {		
					$.ajax({
						url : "searchItemById?sup_id=" + sup_id,
						success : function(data) {
							$("#resultList").append(
								"<tr>"
								+ '<td> <input name="col1" class="form-control" value="' + sup_id + '" readonly/> </td>'
								+ '<td> <input name="col2" class="form-control" value="' + data.sup_class + '" readonly/> </td>'
								+ '<td> <input name="col3" class="form-control" value="' + data.sup_name + '" readonly/> </td>'
								+ '<td> <input name="col4" class="form-control" value="' + request_amount + '" readonly/> </td>'
								+ '<td> <input name="col5" id="eachTotalWeight" class="form-control" value="' + (data.sup_weight * request_amount) + '" readonly/> </td>'
								+ '<td> <input name="delete" onclick="deleteRow(this,' + sup_id + ');" type="button" class="btn btn-outline-danger" value="삭제 "/></td>'
								+ "</tr>");
						}
					});
				}
			}
		}
	}
    
    // 하단의 담은 목록 중 삭제 버튼을 눌렀을 때 실행하는 function
	function deleteRow(obj, sup_id) {
		var tr = $(obj).parent().parent();
		$('#completeBtn' + sup_id).css("display", "inline");
		$("#sup_amount" + sup_id).prop("readonly", false);
		$("#completeBtn" + sup_id).prop("disabled", false);
		tr.remove();
	}

    // 상단의 목록 중 백신 목록을 보여주는 function
	function medicineRequestList(pageNo) {
		$.ajax({
			url : 'medicineRequestList?pageNo=' + pageNo,
			success : function(data) {
				$('#itemTable').html(data)
			}
		});
	}

    // 상단의 목록 중 혈액 목록을 보여주는 function
	function bloodRequestList() {
		$.ajax({
			url : 'bloodRequestList',
			success : function(data) {
				$('#itemTable').html(data)
			}
		});
	}

    // 담은 목록의 총 무게를 합하는 function
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
	
    // 필요 시간과 날짜를 입력했는지 확인하는 function
	function dateTime(date, time) {
		if(date == "" || time == "") {
			alert("시간과 날짜를 입력해주세요.");
			return false;
		}
		return true;
	}

    // 요청 완료 버튼을 눌렀을 때 확인하는 function
	function completeRequestBtn(date, time) {
		var checkTotalWeight = totalWeight();
		var checkDateTime = dateTime(date, time);
		if (checkTotalWeight && checkDateTime) {
			var needDate = date + " " + time;
			var itemArray = [];
			
			// 첫 제목 행을 제외한 테이블 행 수
			var len = ($("#requestTable tr").length) - 1;
			if(len == 0) {
				alert("필요한 의료품을 담아주세요.");
				return false;
			}

			for (var i = 0; i < len; i++) {
				var item = "";
				item += $("input[name=col1]").eq(i).val() + "&&";
				item += $("input[name=col2]").eq(i).val() + "&&";
				item += $("input[name=col3]").eq(i).val() + "&&";
				item += $("input[name=col4]").eq(i).val() + "&&";
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
			success : function(data) {
				location.href = "http://" + location.host + "/FinalWebProject/request";		
			},
			error : function(data) {
				console.log(data);			
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
			<a class="btn btn-pink dropdown-toggle" href="#" role="button"
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
				<input class="form-control" id="dateInput" type="text" name="dateInput" placeholder="날짜선택" style="width:150px; margin-right: 5px"/>
				<input class="form-control" id="timeInput" type="text" name="timeInput" placeholder="시간선택" style="width:150px; margin-right: 9px"/>
				<div style="height: 20px;" class="input-group mb-3">
				  <div class="input-group-prepend">
				    <button class="btn btn-outline-dark" type="button" id="button-addon1" onclick="totalWeight()">총 무게 계산</button>
				  </div>
				<input class="form-control mr-sm-2" id="totalWeightInput" name="totalWeightInput" type="text" placeholder="총 무게" aria-label="총 무게" />
				</div>				
				<h6 style="margin-right: 5px; margin-top: 10px;">g</h6>
				<input type="button" class="btn btn-mint" onclick="completeRequestBtn(dateInput.value, timeInput.value)" value="요청 완료" />
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>