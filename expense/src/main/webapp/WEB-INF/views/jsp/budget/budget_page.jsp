<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page trimDirectiveWhitespaces="true" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name=viewport content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="./resources/dist/jquery.jqplot.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.pointLabels.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/dist/jquery.jqplot.css" />
<script src="./resources/js/budget.js" type="text/javascript" charset="utf-8"></script>
		

<script>	window.onload = function() {
	
	var dt = new Date();
	dt.setFullYear(dt.getFullYear()-1);
		document.getElementById('cal').valueAsDate = new Date();
		document.getElementById('total_firstDate').valueAsDate = dt;
		document.getElementById('total_lastDate').valueAsDate = new Date();
		item_list();
		selectFunction();
		headerFunction();
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


<body style="width: 1280px; margin: 40px auto 0;">
 <header><jsp:include page="/resources/include/header.jsp"/></header>
 <div class="inner_frame"><jsp:include page="/resources/include/info_header.jsp"/></div>
	<div class="frame_1300">
	<br><br><br><br><br><br><br>
	 	<table class="table table-bordered text-center" style="margin-bottom: 0;">
		<tr>
			<td id="graph" style="width: 40%; height: 300px;"></td>
			<td id="chart6" style="width: 40%; height: 300px;"></td>
		</tr>
	</table>
	
	<br>
	<table class="table table-bordered text-center" style="margin-bottom: 0;">
	<tr>
	<td align="left"><input type="month" id="total_firstDate" onchange="total_listFunction();" ><input type="month" id="total_lastDate" onchange="total_listFunction();"></td>
		</tr>
		<tr>
			<td id="chart5" style="width: 80%; height: 300px;"></td>
		</tr>
	</table>
	<br>
	<table   >
	<tbody>
		<tr>
		<td align="left"><input id=cal type="month" onchange="selectFunction();"></td>
		</tr>
		<tr>
			<td align="left"><input type="month" id="excel1" ><input type="month" id="excel2"></td>
		<td align="left"><button class="btn btn-primary pull-right" onclick="excelFunction();" type="button" style="width: 300">Excel download</button></td>
		<td align="left" id="excel3"></td>
		</tr>
		</tbody>
</table>
		<table class="table table-bordered text-center" style="margin-bottom: 0;">
			<thead>
				<tr>
					<th style="background: #fafafa; text-align: center;">분류</th>
					<th style="background: #fafafa; text-align: center;">예산</th>
					<th style="background: #fafafa; text-align: center;">사용금액</th>
					<th style="background: #fafafa; text-align: center;">남은금액</th>
					<th style="background: #fafafa; text-align: center;">예산설정일</th>
					<th style="background: #fafafa; text-align: center;">수정</th>
					<th style="background: afafa; text-align: center;">삭제</th>
				</tr>
			</thead>
			<tbody id="budgetTable">
			</tbody>

		</table>
	
		<table class="table table-bordered text-center" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center"><h5>아이템품목</h5></td>
					<td><select  class="form-control" id="item_code">	</select></td>
					<td style="background-color: #fafafa; text-align: center"><h5>예산</h5></td>
					<td><input class="form-control" type="text" id="budget_amount" size="20"></td>
					<td style="background-color: #fafafa; text-align: center"><h5>예산날짜</h5></td>
					<td><input class="form-control" type="date" id="budget_date" size="20"></td>			
					<td colspan="2"><button class="btn btn-primary pull-right"
							onclick="insertFunction();" type="button">등록</button>
				</tr>
			</tbody>
		</table>
		</div>
			
</body>

</html>