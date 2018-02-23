<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>

<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script type="text/javascript">
	window.onload = function() {
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		$.ajax(
			{
				url : './list2.io',
				type : 'POST',
				dataType : 'text',
				success : function(data) {
					var data_Json = JSON.parse(data);
					var result = data_Json.result;
					var rowItem = "";
					for (var i = 0; i < result.length; i++) {
						rowItem += "<tr>"
						for (var j = 0; j < result[i].length; j++) {
							if (j == 4) {

								rowItem += "<td class = 'text-right'>" + result[i][j].value + "</td>";
								continue;
							}
							rowItem += "<td>" + result[i][j].value + "</td>";
						}
						rowItem += "<td><button type='button' class='glyphicon glyphicon-minus' id='row_remove'></button></td></tr>";
					}
					$('#incomeTable').append(rowItem);
				},
				error : function() {
					alert('통신실패!!');
				}
			})
	}

	$(function() {
		$('#add_row')
			.click(
				function() {
					var now = new Date() // 현재 날짜
					var curr_date = now.getDate();
					if (curr_date < 10)
						curr_date = "0" + curr_date;
					var curr_month = now.getMonth() + 1; //Months are zero based
					if (curr_month < 10)
						curr_month = "0" + curr_month;
					var curr_year = now.getFullYear();
					var result = curr_year + "-" + curr_month + "-"
						+ curr_date;

					var rowItem = "<tr>"
					rowItem += "<td> <input type='date' class='form-control' value = '" + result + "'> </td>"
					rowItem += "<td> <input type='text' class='form-control' placeholder='소득구분' > </td>"
					rowItem += "<td> <input type='email' class='form-control' placeholder='거래코드'> </td>"
					rowItem += "<td> <input type='text' class='form-control' placeholder='금융사코드'> </td>"
					rowItem += "<td> <input type='text' class='form-control text-right' placeholder='금액'> </td>"
					rowItem += "<td> <input type='text' class='form-control' placeholder='비고'> </td>"
					rowItem += "<td><button type='button' class='glyphicon glyphicon-ok' id='row_add'></button></td>"
					rowItem += "</tr>"
					$('#incomeTable').append(rowItem);

				});

		$(document).on('click', 'td', function() {
			var txt = $(this).children().val();
			console.log(txt);
		});

		$(document).on("click", "#row_remove", function() {

			$(this).parent().parent().remove();
		});

		$(document).on("click", "#row_add", function() {

			var objTable = document.getElementById("incomeTable");

			var tdArr = new Array(); // 배열 선언
			// 현재 클릭된 Row(<tr>)
			var tr = $(this).parent().parent();
			var td = tr.children();
			var content = td.children();


			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i) {
				tdArr.push(td.children().eq(i).val());
			});
			var tdArr2 = tdArr.slice(0, 6);
			var allArray = {
				"arrData" : tdArr2
			};

			$.ajax({
				url : "./addIncomeList.io",
				type : "POST",
				data : allArray,
				success : function(data) {
					alert("완료!");
				},
				error : function() {
					alert('통신실패!!');
				}
			})



		});

	})
</script>
</head>
<body>
	<header><jsp:include page="/resources/include/header.jsp" /></header>
	<h2 class="text-center">소득 내역</h2>

	<div class="container" id="table">
		<table class="table table-bordered text-center" id=incomeTable>
			<colgroup>
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="25%" />
				<col width="30%" />
			</colgroup>

			<thead>
				<tr>
					<th class="text-center">거래날짜</th>
					<th class="text-center">소득구분</th>
					<th class="text-center">거래구분</th>
					<th class="text-center">거래은행</th>
					<th class="text-center">금액</th>
					<th class="text-center">비고</th>
				</tr>
			</thead>
			<tbody id=ajaxTable>
				<%-- <c:forEach items="${incomeList}" var="income">
					 <tr>

						<td><input type="date" class="form-control"
							value='${income.income_Date}' ></td>
						<td>${income.income_Date }</td>
						<td>${income.income_Code}</td>
						<td>${income.trade_Code}</td>
						<td>${income.bank_Code}</td>
						<td class="text-right">${income.income_Amount}</td>
						<td>${income.income_Description}</td>
						<td>
							<button type="button" class="glyphicon glyphicon-minus"
								id="row_remove"></button>
						</td>
					</tr> 
				</c:forEach> --%>

			</tbody>
		</table>
	</div>



	<hr />
	<input type="button" value="행 생성" id="add_row" />

	<footer><jsp:include page="/resources/include/footer.jsp" /></footer>
</body>


</html>