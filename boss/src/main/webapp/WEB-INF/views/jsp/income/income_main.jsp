<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/resources/include/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>
<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script type="text/javascript">
	$(function() {
		$('#add_row')
				.click(
						function() {
							var now = new Date() // 현재 날짜
							var curr_date = now.getDate();
							var curr_month = now.getMonth() + 1; //Months are zero based
							if (curr_month < 10)
								curr_month = "0" + curr_month;
							var curr_year = now.getFullYear();
							var result = curr_year + "-" + curr_month + "-"
									+ curr_date;

							var rowItem = "<tr>"
							rowItem += "<td> <input type='date' class='form-control' value = '"+ result +"'> </td>"
							rowItem += "<td> <input type='text' class='form-control' placeholder='소득 구분' > </td>"
							rowItem += "<td> <input type='email' class='form-control' placeholder='거래 코드'> </td>"
							rowItem += "<td> <input type='text' class='form-control' placeholder='금융사 코드'> </td>"
							rowItem += "<td> <input type='text' class='form-control text-right' value='금액'> </td>"
							rowItem += "<td> <input type='text' class='form-control' placeholder='비고'> </td>"
							rowItem += "<td><button type='button' class='glyphicon glyphicon-minus' id='row_remove'></button></td>"
							rowItem += "</tr>"
							$('#incomeTable').append(rowItem).trigger('create');

						});

		$(document).on('click', 'td', function() {
			var txt = $(this).children().val();
			console.log(txt);
		});

		$(document).on("click", "#row_remove", function() {

			console.log("여기 들어옴?");
			$(this).parent().parent().remove();
		});

	})
</script>
</head>
<body>

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
			<tbody>
				<c:forEach items="${incomeList}" var="income">
					<tr>

						<td><input type="date" class="form-control"
							value='${income.income_Date}' id="test"></td>
						<%-- <td>${income.income_Date }</td> --%>
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
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr />
	<input type="button" value="행 생성" id="add_row" />


</body>
<%@ include file="/resources/include/footer.jsp"%>


</html>