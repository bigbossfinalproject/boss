<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name=viewport content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/dist/jquery.jqplot.js"></script>
<script type="text/javascript"
	src="./resources/dist/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript"
	src="./resources/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="./resources/dist/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="./resources/dist/plugins/jqplot.pointLabels.js"></script>
<link rel="stylesheet" type="text/css"
	href="./resources/dist/jquery.jqplot.css" />
<script src="./resources/js/calendar_beans_v2.2.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/jquery.mask.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./resources/js/budget.js" type="text/javascript"
	charset="utf-8"></script>
		

<script>	window.onload = function() {
		document.getElementById('cal').valueAsDate = new Date();
		item_list();
		selectFunction();

	}
</script>
<style type="text/css">
.aa:hover {
	background-color: lightgray;
}

table.ui-datepicker-calendar {
	display: none;
}
</style>

</head>


<body>

	<table align="center">
		<tr>
			<td id="graph" style="width: 700px; height: 304px;"></td>
			<td id="chart6" style="width: 700px; height: 304px;"></td>
		</tr>
	</table>

	<table align="center">
		<tr>
			<td id="chart5" style="width: 1500px; height: 304px;"></td>
		</tr>
	</table>

	<br>


	<div class="container">

		<input id=cal type="month" onchange="selectFunction();">


		<table class="table"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background: #fafafa; text-align: center;">분류</th>
					<th style="background: #fafafa; text-align: center;">예산</th>
					<th style="background: #fafafa; text-align: center;">사용금액</th>
					<th style="background: #fafafa; text-align: center;">남은금액</th>
					<th style="background: #fafafa; text-align: center;">수정</th>
					<th style="background: afafa; text-align: center;">삭제</th>
				</tr>
			</thead>
			<tbody id="budgetTable">
			</tbody>

		</table>
	</div>
	<div class="container">
		<table class="table"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center"><h5>아이템품목</h5></td>
					<td>
					
					
					 <select  class="form-control" id="item_code">		
					</select></td>

					<td style="background-color: #fafafa; text-align: center"><h5>예산</h5></td>
					<td><input class="form-control" type="text" id="budget_amount"
						size="20"></td>
					<td colspan="2"><button class="btn btn-primary pull-right"
							onclick="insertFunction();" type="button">등록</button>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-xs-2" align="center">
	</div>
 <input type="month" id="excle1"><input type="month" id="excle2"><button onclick="excelFunction();" type="button">엑셀로 저장하기 예산 복사</button>
 <a href="원하는_주소" download>download 속성 예제</a>

</body>

</html>